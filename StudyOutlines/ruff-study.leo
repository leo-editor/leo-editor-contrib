<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="http://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20231101055901.1"><vh>Startup</vh>
<v t="ekr.20231101055901.2"><vh>@settings</vh>
<v t="ekr.20231101055901.3"><vh>@data history-list</vh></v>
</v>
<v t="ekr.20231101060133.1"><vh>--- buttons</vh>
<v t="ekr.20231101055901.4"><vh>@button backup</vh></v>
<v t="ekr.20231101055901.5"><vh>@@button remove copyright</vh></v>
<v t="ekr.20231101055901.6"><vh>@@button clean-comments</vh></v>
<v t="ekr.20231101055908.1"><vh>@button recursive-import</vh></v>
</v>
</v>
<v t="ekr.20231101055901.3"></v>
<v t="ekr.20231101055908.1"></v>
<v t="ekr.20231101055932.1"><vh>@button clean-rust</vh>
<v t="ekr.20231101060448.1"><vh>remove_at_others</vh></v>
<v t="ekr.20231101062905.1"><vh>clean_headline</vh></v>
</v>
<v t="ekr.20231101055917.1"><vh>--- ruff_formatter</vh>
<v t="ekr.20231101055917.2"><vh>shared_traits.rs</vh>
<v t="ekr.20231101055917.3"><vh>trait AsFormat</vh></v>
<v t="ekr.20231101055917.4"><vh>impl AsFormat for &amp;T</vh></v>
<v t="ekr.20231101055917.6"><vh>trait IntoFormat</vh></v>
<v t="ekr.20231101055917.7"><vh>impl IntoFormat for Option</vh></v>
<v t="ekr.20231101055917.9"><vh>impl IntoFormat for &amp;'a T</vh></v>
<v t="ekr.20231101055917.11"><vh>trait FormattedIterExt</vh></v>
<v t="ekr.20231101055917.12"><vh>struct FormattedIter</vh></v>
<v t="ekr.20231101055917.13"><vh>impl std::iter::Iterator for FormattedIter</vh></v>
<v t="ekr.20231101055917.15"><vh>impl std::iter::FusedIterator for FormattedIter</vh></v>
<v t="ekr.20231101055917.16"><vh>impl std::iter::ExactSizeIterator for FormattedIter</vh></v>
</v>
<v t="ekr.20231101070946.1"><vh>src/</vh>
<v t="ekr.20231101055917.17"><vh>src/arguments.rs</vh>
<v t="ekr.20231101055917.18"><vh>struct Argument</vh></v>
<v t="ekr.20231101055917.19"><vh>impl Clone for Argument</vh></v>
<v t="ekr.20231101055917.21"><vh>impl Argument</vh></v>
<v t="ekr.20231101055917.22"><vh>impl Arguments</vh></v>
<v t="ekr.20231101055917.24"><vh>impl Clone for Arguments</vh></v>
<v t="ekr.20231101055917.26"><vh>impl Format for Arguments</vh></v>
<v t="ekr.20231101055917.28"><vh>impl std::fmt::Debug for Arguments</vh></v>
<v t="ekr.20231101055917.30"><vh>impl From&gt; for Arguments</vh></v>
<v t="ekr.20231101055917.32"><vh>mod tests</vh>
<v t="ekr.20231101055917.33"><vh>fn test_nesting</vh></v>
</v>
</v>
<v t="ekr.20231101055917.34"><vh>src/buffer.rs</vh>
<v t="ekr.20231101055917.35"><vh>trait Buffer</vh>
<v t="ekr.20231101055917.36"><vh>fn write_fmt</vh></v>
</v>
<v t="ekr.20231101055917.37"><vh>impl BufferSnapshot</vh>
<v t="ekr.20231101055917.38"><vh>fn unwrap_position</vh></v>
</v>
<v t="ekr.20231101055917.39"><vh>impl + ?Sized, Context&gt; Buffer for &amp;mut W</vh>
<v t="ekr.20231101055917.40"><vh>fn write_element</vh></v>
<v t="ekr.20231101055917.41"><vh>fn elements</vh></v>
<v t="ekr.20231101055917.42"><vh>fn write_fmt</vh></v>
<v t="ekr.20231101055917.43"><vh>fn state</vh></v>
<v t="ekr.20231101055917.44"><vh>fn state_mut</vh></v>
<v t="ekr.20231101055917.45"><vh>fn snapshot</vh></v>
<v t="ekr.20231101055917.46"><vh>fn restore_snapshot</vh></v>
</v>
<v t="ekr.20231101055917.47"><vh>struct VecBuffer</vh></v>
<v t="ekr.20231101055917.48"><vh>impl VecBuffer</vh>
<v t="ekr.20231101055917.49"><vh>fn new</vh></v>
<v t="ekr.20231101055917.50"><vh>fn new_with_vec</vh></v>
<v t="ekr.20231101055917.51"><vh>fn with_capacity</vh></v>
<v t="ekr.20231101055917.52"><vh>fn into_vec</vh></v>
<v t="ekr.20231101055917.53"><vh>fn take_vec</vh></v>
</v>
<v t="ekr.20231101055917.54"><vh>impl Deref for VecBuffer</vh></v>
<v t="ekr.20231101055917.56"><vh>impl DerefMut for VecBuffer</vh></v>
<v t="ekr.20231101055917.58"><vh>impl Buffer for VecBuffer</vh>
<v t="ekr.20231101055917.59"><vh>fn write_element</vh></v>
<v t="ekr.20231101055917.60"><vh>fn elements</vh></v>
<v t="ekr.20231101055917.61"><vh>fn state</vh></v>
<v t="ekr.20231101055917.62"><vh>fn state_mut</vh></v>
<v t="ekr.20231101055917.63"><vh>fn snapshot</vh></v>
<v t="ekr.20231101055917.64"><vh>fn restore_snapshot</vh></v>
</v>
<v t="ekr.20231101055917.65"><vh>struct Inspect</vh></v>
<v t="ekr.20231101055917.66"><vh>impl Inspect</vh></v>
<v t="ekr.20231101055917.68"><vh>impl Buffer for Inspect</vh>
<v t="ekr.20231101055917.69"><vh>fn write_element</vh></v>
<v t="ekr.20231101055917.70"><vh>fn elements</vh></v>
<v t="ekr.20231101055917.71"><vh>fn state</vh></v>
<v t="ekr.20231101055917.72"><vh>fn state_mut</vh></v>
<v t="ekr.20231101055917.73"><vh>fn snapshot</vh></v>
<v t="ekr.20231101055917.74"><vh>fn restore_snapshot</vh></v>
</v>
<v t="ekr.20231101055917.75"><vh>struct RemoveSoftLinesBuffer</vh></v>
<v t="ekr.20231101055917.76"><vh>impl RemoveSoftLinesBuffer</vh>
<v t="ekr.20231101055917.77"><vh>fn new</vh></v>
<v t="ekr.20231101055917.78"><vh>fn clean_interned</vh></v>
</v>
<v t="ekr.20231101055917.79"><vh>fn clean_interned</vh></v>
<v t="ekr.20231101055917.80"><vh>impl Buffer for RemoveSoftLinesBuffer</vh>
<v t="ekr.20231101055917.81"><vh>fn write_element</vh></v>
<v t="ekr.20231101055917.82"><vh>fn elements</vh></v>
<v t="ekr.20231101055917.83"><vh>fn state</vh></v>
<v t="ekr.20231101055917.84"><vh>fn state_mut</vh></v>
<v t="ekr.20231101055917.85"><vh>fn snapshot</vh></v>
<v t="ekr.20231101055917.86"><vh>fn restore_snapshot</vh></v>
</v>
<v t="ekr.20231101055917.87"><vh>trait BufferExtensions: Buffer + Sized</vh>
<v t="ekr.20231101055917.88"><vh>fn start_recording</vh></v>
</v>
<v t="ekr.20231101055917.89"><vh>struct Recording</vh></v>
<v t="ekr.20231101055917.90"><vh>impl Recording</vh>
<v t="ekr.20231101055917.91"><vh>fn new</vh></v>
<v t="ekr.20231101055917.92"><vh>fn write_fmt</vh></v>
<v t="ekr.20231101055917.93"><vh>fn write_element</vh></v>
<v t="ekr.20231101055917.94"><vh>fn stop</vh></v>
</v>
<v t="ekr.20231101055917.95"><vh>impl Deref for Recorded</vh></v>
</v>
<v t="ekr.20231101055917.97"><vh>src/builders.rs</vh>
<v t="ekr.20231101055917.98"><vh>struct Line</vh></v>
<v t="ekr.20231101055917.99"><vh>impl Line</vh></v>
<v t="ekr.20231101055917.100"><vh>impl Format for Line</vh></v>
<v t="ekr.20231101055917.102"><vh>impl std::fmt::Debug for Line</vh></v>
<v t="ekr.20231101055917.104"><vh>fn token</vh></v>
<v t="ekr.20231101055917.105"><vh>struct Token</vh></v>
<v t="ekr.20231101055917.106"><vh>impl Format for Token</vh></v>
<v t="ekr.20231101055917.108"><vh>impl std::fmt::Debug for Token</vh></v>
<v t="ekr.20231101055917.110"><vh>impl Format for SourcePosition</vh></v>
<v t="ekr.20231101055917.112"><vh>fn text</vh></v>
<v t="ekr.20231101055917.113"><vh>struct Text</vh></v>
<v t="ekr.20231101055917.114"><vh>impl Format for Text</vh>
<v t="ekr.20231101055917.115"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.116"><vh>impl std::fmt::Debug for Text</vh></v>
<v t="ekr.20231101055917.118"><vh>struct SourceTextSliceBuilder</vh></v>
<v t="ekr.20231101055917.119"><vh>impl Format for SourceTextSliceBuilder</vh>
<v t="ekr.20231101055917.120"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.121"><vh>fn debug_assert_no_newlines</vh></v>
<v t="ekr.20231101055917.122"><vh>struct LineSuffix</vh></v>
<v t="ekr.20231101055917.123"><vh>impl Format for LineSuffix</vh></v>
<v t="ekr.20231101055917.125"><vh>impl std::fmt::Debug for LineSuffix</vh></v>
<v t="ekr.20231101055917.127"><vh>impl Format for LineSuffixBoundary</vh></v>
<v t="ekr.20231101055917.129"><vh>struct FormatLabelled</vh></v>
<v t="ekr.20231101055917.130"><vh>impl Format for FormatLabelled</vh></v>
<v t="ekr.20231101055917.132"><vh>impl std::fmt::Debug for FormatLabelled</vh></v>
<v t="ekr.20231101055917.134"><vh>impl Format for Space</vh></v>
<v t="ekr.20231101055917.136"><vh>struct Indent</vh></v>
<v t="ekr.20231101055917.137"><vh>impl Format for Indent</vh></v>
<v t="ekr.20231101055917.139"><vh>impl std::fmt::Debug for Indent</vh></v>
<v t="ekr.20231101055917.141"><vh>struct Dedent</vh></v>
<v t="ekr.20231101055917.142"><vh>impl Format for Dedent</vh></v>
<v t="ekr.20231101055917.144"><vh>impl std::fmt::Debug for Dedent</vh></v>
<v t="ekr.20231101055917.146"><vh>struct Align</vh></v>
<v t="ekr.20231101055917.147"><vh>impl Format for Align</vh></v>
<v t="ekr.20231101055917.149"><vh>impl std::fmt::Debug for Align</vh></v>
<v t="ekr.20231101055917.151"><vh>struct BlockIndent</vh></v>
<v t="ekr.20231101055917.152"><vh>impl Format for BlockIndent</vh>
<v t="ekr.20231101055917.153"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.154"><vh>impl std::fmt::Debug for BlockIndent</vh></v>
<v t="ekr.20231101055917.156"><vh>struct Group</vh></v>
<v t="ekr.20231101055917.157"><vh>impl Group</vh>
<v t="ekr.20231101055917.158"><vh>fn with_group_id</vh></v>
<v t="ekr.20231101055917.159"><vh>fn should_expand</vh></v>
</v>
<v t="ekr.20231101055917.160"><vh>impl Format for Group</vh>
<v t="ekr.20231101055917.161"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.162"><vh>impl std::fmt::Debug for Group</vh></v>
<v t="ekr.20231101055917.164"><vh>struct BestFitParenthesize</vh></v>
<v t="ekr.20231101055917.165"><vh>impl BestFitParenthesize</vh></v>
<v t="ekr.20231101055917.167"><vh>impl Format for BestFitParenthesize</vh>
<v t="ekr.20231101055917.168"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.169"><vh>impl std::fmt::Debug for BestFitParenthesize</vh></v>
<v t="ekr.20231101055917.171"><vh>struct ConditionalGroup</vh></v>
<v t="ekr.20231101055917.172"><vh>impl Format for ConditionalGroup</vh></v>
<v t="ekr.20231101055917.174"><vh>impl std::fmt::Debug for ConditionalGroup</vh></v>
<v t="ekr.20231101055917.176"><vh>impl Format for ExpandParent</vh></v>
<v t="ekr.20231101055917.178"><vh>struct IfGroupBreaks</vh></v>
<v t="ekr.20231101055917.179"><vh>impl IfGroupBreaks</vh>
<v t="ekr.20231101055917.180"><vh>fn with_group_id</vh></v>
</v>
<v t="ekr.20231101055917.181"><vh>impl Format for IfGroupBreaks</vh></v>
<v t="ekr.20231101055917.183"><vh>impl std::fmt::Debug for IfGroupBreaks</vh>
<v t="ekr.20231101055917.184"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.185"><vh>struct IndentIfGroupBreaks</vh></v>
<v t="ekr.20231101055917.186"><vh>impl Format for IndentIfGroupBreaks</vh></v>
<v t="ekr.20231101055917.188"><vh>impl std::fmt::Debug for IndentIfGroupBreaks</vh></v>
<v t="ekr.20231101055917.190"><vh>struct FitsExpanded</vh></v>
<v t="ekr.20231101055917.191"><vh>impl FitsExpanded</vh></v>
<v t="ekr.20231101055917.193"><vh>impl Format for FitsExpanded</vh></v>
<v t="ekr.20231101055917.195"><vh>struct FormatWith</vh></v>
<v t="ekr.20231101055917.196"><vh>impl Format for FormatWith</vh></v>
<v t="ekr.20231101055917.198"><vh>impl std::fmt::Debug for FormatWith</vh></v>
<v t="ekr.20231101055917.200"><vh>struct FormatOnce</vh></v>
<v t="ekr.20231101055917.201"><vh>impl Format for FormatOnce</vh></v>
<v t="ekr.20231101055917.203"><vh>impl std::fmt::Debug for FormatOnce</vh></v>
<v t="ekr.20231101055917.205"><vh>struct JoinBuilder</vh></v>
<v t="ekr.20231101055917.206"><vh>impl JoinBuilder</vh>
<v t="ekr.20231101055917.207"><vh>fn entry</vh></v>
<v t="ekr.20231101055917.208"><vh>fn finish</vh></v>
</v>
<v t="ekr.20231101055917.209"><vh>struct FillBuilder</vh></v>
<v t="ekr.20231101055917.210"><vh>impl FillBuilder</vh>
<v t="ekr.20231101055917.211"><vh>fn entry</vh></v>
<v t="ekr.20231101055917.212"><vh>fn finish</vh></v>
</v>
<v t="ekr.20231101055917.213"><vh>struct BestFitting</vh></v>
<v t="ekr.20231101055917.214"><vh>impl BestFitting</vh>
<v t="ekr.20231101055917.215"><vh>fn with_mode</vh></v>
</v>
<v t="ekr.20231101055917.216"><vh>impl Format for BestFitting</vh>
<v t="ekr.20231101055917.217"><vh>fn fmt</vh></v>
</v>
</v>
<v t="ekr.20231101055917.218"><vh>src/diagnostics.rs</vh>
<v t="ekr.20231101055917.219"><vh>impl std::fmt::Display for FormatError</vh>
<v t="ekr.20231101055917.220"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.221"><vh>impl From for FormatError</vh></v>
<v t="ekr.20231101055917.223"><vh>impl From for FormatError</vh></v>
<v t="ekr.20231101055917.225"><vh>impl FormatError</vh></v>
<v t="ekr.20231101055917.227"><vh>impl std::fmt::Display for InvalidDocumentError</vh>
<v t="ekr.20231101055917.228"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.229"><vh>impl std::fmt::Display for PrintError</vh></v>
</v>
<v t="ekr.20231101055917.231"><vh>src/format_element.rs</vh>
<v t="ekr.20231101055917.232"><vh>impl FormatElement</vh></v>
<v t="ekr.20231101055917.234"><vh>impl std::fmt::Debug for FormatElement</vh>
<v t="ekr.20231101055917.235"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.236"><vh>impl LineMode</vh></v>
<v t="ekr.20231101055917.237"><vh>impl PrintMode</vh></v>
<v t="ekr.20231101055917.238"><vh>impl From for PrintMode</vh></v>
<v t="ekr.20231101055917.240"><vh>impl Interned</vh></v>
<v t="ekr.20231101055917.241"><vh>impl PartialEq for Interned</vh></v>
<v t="ekr.20231101055917.243"><vh>impl Hash for Interned</vh></v>
<v t="ekr.20231101055917.244"><vh>impl std::fmt::Debug for Interned</vh></v>
<v t="ekr.20231101055917.246"><vh>impl Deref for Interned</vh></v>
<v t="ekr.20231101055917.248"><vh>impl FormatElement</vh></v>
<v t="ekr.20231101055917.249"><vh>impl FormatElements for FormatElement</vh>
<v t="ekr.20231101055917.250"><vh>fn will_break</vh></v>
<v t="ekr.20231101055917.251"><vh>fn has_label</vh></v>
<v t="ekr.20231101055917.252"><vh>fn start_tag</vh></v>
<v t="ekr.20231101055917.253"><vh>fn end_tag</vh></v>
</v>
<v t="ekr.20231101055917.254"><vh>impl BestFittingVariants</vh>
<v t="ekr.20231101055917.255"><vh>fn most_expanded</vh></v>
<v t="ekr.20231101055917.256"><vh>fn as_slice</vh></v>
<v t="ekr.20231101055917.257"><vh>fn most_flat</vh></v>
</v>
<v t="ekr.20231101055917.258"><vh>impl Deref for BestFittingVariants</vh></v>
<v t="ekr.20231101055917.260"><vh>struct BestFittingVariantsIter</vh></v>
<v t="ekr.20231101055917.261"><vh>impl IntoIterator for &amp;'a BestFittingVariants</vh></v>
<v t="ekr.20231101055917.263"><vh>impl Iterator for BestFittingVariantsIter</vh>
<v t="ekr.20231101055917.264"><vh>fn next</vh></v>
<v t="ekr.20231101055917.265"><vh>fn last</vh></v>
</v>
<v t="ekr.20231101055917.266"><vh>impl DoubleEndedIterator for BestFittingVariantsIter</vh></v>
<v t="ekr.20231101055917.268"><vh>trait FormatElements</vh></v>
<v t="ekr.20231101055917.269"><vh>impl Width</vh></v>
<v t="ekr.20231101055917.270"><vh>impl TextWidth</vh>
<v t="ekr.20231101055917.271"><vh>fn from_text</vh></v>
</v>
<v t="ekr.20231101055917.272"><vh>mod tests</vh>
<v t="ekr.20231101055917.273"><vh>fn test_normalize_newlines</vh></v>
</v>
<v t="ekr.20231101055917.274"><vh>mod sizes</vh></v>
</v>
<v t="ekr.20231101055917.275"><vh>src/format_extensions.rs</vh>
<v t="ekr.20231101055917.276"><vh>trait MemoizeFormat</vh>
<v t="ekr.20231101055917.277"><vh>fn memoized</vh></v>
</v>
<v t="ekr.20231101055917.278"><vh>struct Memoized</vh></v>
<v t="ekr.20231101055917.279"><vh>impl Memoized</vh>
<v t="ekr.20231101055917.280"><vh>fn new</vh></v>
<v t="ekr.20231101055917.281"><vh>fn inspect</vh></v>
</v>
<v t="ekr.20231101055917.282"><vh>impl Format for Memoized</vh>
<v t="ekr.20231101055917.283"><vh>fn fmt</vh></v>
</v>
</v>
<v t="ekr.20231101055917.284"><vh>src/formatter.rs</vh>
<v t="ekr.20231101055917.285"><vh>struct Formatter</vh></v>
<v t="ekr.20231101055917.286"><vh>impl Formatter</vh>
<v t="ekr.20231101055917.287"><vh>fn new</vh></v>
<v t="ekr.20231101055917.288"><vh>fn options</vh></v>
<v t="ekr.20231101055917.289"><vh>fn context</vh></v>
<v t="ekr.20231101055917.290"><vh>fn context_mut</vh></v>
<v t="ekr.20231101055917.291"><vh>fn group_id</vh></v>
<v t="ekr.20231101055917.292"><vh>fn intern</vh></v>
<v t="ekr.20231101055917.293"><vh>fn intern_vec</vh></v>
</v>
<v t="ekr.20231101055917.294"><vh>impl Formatter</vh>
<v t="ekr.20231101055917.295"><vh>fn state_snapshot</vh></v>
<v t="ekr.20231101055917.296"><vh>fn restore_state_snapshot</vh></v>
</v>
<v t="ekr.20231101055917.297"><vh>impl Buffer for Formatter</vh>
<v t="ekr.20231101055917.298"><vh>fn write_element</vh></v>
<v t="ekr.20231101055917.299"><vh>fn elements</vh></v>
<v t="ekr.20231101055917.300"><vh>fn write_fmt</vh></v>
<v t="ekr.20231101055917.301"><vh>fn state</vh></v>
<v t="ekr.20231101055917.302"><vh>fn state_mut</vh></v>
<v t="ekr.20231101055917.303"><vh>fn snapshot</vh></v>
<v t="ekr.20231101055917.304"><vh>fn restore_snapshot</vh></v>
</v>
<v t="ekr.20231101055917.305"><vh>struct FormatterSnapshot</vh></v>
</v>
<v t="ekr.20231101055917.306"><vh>src/group_id.rs</vh>
<v t="ekr.20231101055917.307"><vh>struct DebugGroupId</vh></v>
<v t="ekr.20231101055917.308"><vh>impl DebugGroupId</vh></v>
<v t="ekr.20231101055917.310"><vh>impl std::fmt::Debug for DebugGroupId</vh></v>
<v t="ekr.20231101055917.312"><vh>struct ReleaseGroupId</vh></v>
<v t="ekr.20231101055917.313"><vh>impl ReleaseGroupId</vh></v>
<v t="ekr.20231101055917.315"><vh>impl From for u32</vh></v>
<v t="ekr.20231101055917.317"><vh>impl std::fmt::Debug for ReleaseGroupId</vh></v>
<v t="ekr.20231101055917.319"><vh>impl UniqueGroupIdBuilder</vh></v>
<v t="ekr.20231101055917.320"><vh>impl Default for UniqueGroupIdBuilder</vh></v>
</v>
<v t="ekr.20231101055917.322"><vh>src/lib.rs</vh>
<v t="ekr.20231101055917.323"><vh>impl IndentStyle</vh></v>
<v t="ekr.20231101055917.324"><vh>impl std::fmt::Display for IndentStyle</vh></v>
<v t="ekr.20231101055917.326"><vh>impl IndentWidth</vh></v>
<v t="ekr.20231101055917.327"><vh>impl Default for IndentWidth</vh></v>
<v t="ekr.20231101055917.329"><vh>impl TryFrom for IndentWidth</vh></v>
<v t="ekr.20231101055917.331"><vh>impl From for IndentWidth</vh></v>
<v t="ekr.20231101055917.333"><vh>impl LineWidth</vh></v>
<v t="ekr.20231101055917.334"><vh>impl Default for LineWidth</vh></v>
<v t="ekr.20231101055917.336"><vh>impl TryFrom for LineWidth</vh></v>
<v t="ekr.20231101055917.338"><vh>impl From for u16</vh></v>
<v t="ekr.20231101055917.340"><vh>impl From for u32</vh></v>
<v t="ekr.20231101055917.342"><vh>impl From for LineWidth</vh></v>
<v t="ekr.20231101055917.344"><vh>trait FormatContext</vh></v>
<v t="ekr.20231101055917.345"><vh>trait FormatOptions</vh></v>
<v t="ekr.20231101055917.346"><vh>struct SimpleFormatContext</vh></v>
<v t="ekr.20231101055917.347"><vh>impl SimpleFormatContext</vh>
<v t="ekr.20231101055917.348"><vh>fn new</vh></v>
<v t="ekr.20231101055917.349"><vh>fn with_source_code</vh></v>
</v>
<v t="ekr.20231101055917.350"><vh>impl FormatContext for SimpleFormatContext</vh>
<v t="ekr.20231101055917.351"><vh>fn options</vh></v>
<v t="ekr.20231101055917.352"><vh>fn source_code</vh></v>
</v>
<v t="ekr.20231101055917.353"><vh>struct SimpleFormatOptions</vh></v>
<v t="ekr.20231101055917.354"><vh>impl FormatOptions for SimpleFormatOptions</vh>
<v t="ekr.20231101055917.355"><vh>fn indent_style</vh></v>
<v t="ekr.20231101055917.356"><vh>fn indent_width</vh></v>
<v t="ekr.20231101055917.357"><vh>fn line_width</vh></v>
<v t="ekr.20231101055917.358"><vh>fn as_print_options</vh></v>
</v>
<v t="ekr.20231101055917.359"><vh>struct SourceMarker</vh></v>
<v t="ekr.20231101055917.360"><vh>struct Formatted</vh></v>
<v t="ekr.20231101055917.361"><vh>impl Formatted</vh>
<v t="ekr.20231101055917.362"><vh>fn new</vh></v>
<v t="ekr.20231101055917.363"><vh>fn context</vh></v>
<v t="ekr.20231101055917.364"><vh>fn document</vh></v>
<v t="ekr.20231101055917.365"><vh>fn into_document</vh></v>
</v>
<v t="ekr.20231101055917.366"><vh>impl Formatted</vh>
<v t="ekr.20231101055917.367"><vh>fn print</vh></v>
<v t="ekr.20231101055917.368"><vh>fn print_with_indent</vh></v>
<v t="ekr.20231101055917.369"><vh>fn create_printer</vh></v>
</v>
<v t="ekr.20231101055917.370"><vh>impl Display for Formatted</vh></v>
<v t="ekr.20231101055917.372"><vh>struct Printed</vh></v>
<v t="ekr.20231101055917.373"><vh>impl Printed</vh>
<v t="ekr.20231101055917.374"><vh>fn new</vh></v>
<v t="ekr.20231101055917.375"><vh>fn new_empty</vh></v>
<v t="ekr.20231101055917.376"><vh>fn range</vh></v>
<v t="ekr.20231101055917.377"><vh>fn sourcemap</vh></v>
<v t="ekr.20231101055917.378"><vh>fn into_sourcemap</vh></v>
<v t="ekr.20231101055917.379"><vh>fn take_sourcemap</vh></v>
<v t="ekr.20231101055917.380"><vh>fn as_code</vh></v>
<v t="ekr.20231101055917.381"><vh>fn into_code</vh></v>
<v t="ekr.20231101055917.382"><vh>fn verbatim</vh></v>
<v t="ekr.20231101055917.383"><vh>fn verbatim_ranges</vh></v>
<v t="ekr.20231101055917.384"><vh>fn take_verbatim_ranges</vh></v>
</v>
<v t="ekr.20231101055917.385"><vh>trait Format</vh></v>
<v t="ekr.20231101055917.386"><vh>impl Format for &amp;T</vh></v>
<v t="ekr.20231101055917.388"><vh>impl Format for &amp;mut T</vh></v>
<v t="ekr.20231101055917.390"><vh>impl Format for Option</vh></v>
<v t="ekr.20231101055917.392"><vh>impl Format for ()</vh></v>
<v t="ekr.20231101055917.394"><vh>trait FormatRule</vh></v>
<v t="ekr.20231101055917.395"><vh>trait FormatRuleWithOptions: FormatRule</vh></v>
<v t="ekr.20231101055917.396"><vh>trait FormatWithRule: Format</vh></v>
<v t="ekr.20231101055917.397"><vh>struct FormatRefWithRule</vh></v>
<v t="ekr.20231101055917.398"><vh>impl FormatRefWithRule</vh>
<v t="ekr.20231101055917.399"><vh>fn new</vh></v>
<v t="ekr.20231101055917.400"><vh>fn rule</vh></v>
</v>
<v t="ekr.20231101055917.401"><vh>impl FormatRefWithRule</vh></v>
<v t="ekr.20231101055917.403"><vh>impl FormatWithRule for FormatRefWithRule</vh></v>
<v t="ekr.20231101055917.405"><vh>impl Format for FormatRefWithRule</vh></v>
<v t="ekr.20231101055917.407"><vh>struct FormatOwnedWithRule</vh></v>
<v t="ekr.20231101055917.408"><vh>impl FormatOwnedWithRule</vh>
<v t="ekr.20231101055917.409"><vh>fn new</vh></v>
<v t="ekr.20231101055917.410"><vh>fn with_item</vh></v>
<v t="ekr.20231101055917.411"><vh>fn into_item</vh></v>
</v>
<v t="ekr.20231101055917.412"><vh>impl Format for FormatOwnedWithRule</vh></v>
<v t="ekr.20231101055917.414"><vh>impl FormatOwnedWithRule</vh></v>
<v t="ekr.20231101055917.416"><vh>impl FormatWithRule for FormatOwnedWithRule</vh></v>
<v t="ekr.20231101055917.418"><vh>struct FormatState</vh></v>
<v t="ekr.20231101055917.419"><vh>impl std::fmt::Debug for FormatState</vh></v>
<v t="ekr.20231101055917.421"><vh>impl FormatState</vh>
<v t="ekr.20231101055917.422"><vh>fn new</vh></v>
<v t="ekr.20231101055917.423"><vh>fn into_context</vh></v>
<v t="ekr.20231101055917.424"><vh>fn context</vh></v>
<v t="ekr.20231101055917.425"><vh>fn context_mut</vh></v>
<v t="ekr.20231101055917.426"><vh>fn group_id</vh></v>
</v>
</v>
<v t="ekr.20231101055917.427"><vh>src/macros.rs</vh>
<v t="ekr.20231101055917.428"><vh>mod tests</vh>
<v t="ekr.20231101055917.429"><vh>impl Format for TestFormat</vh></v>
<v t="ekr.20231101055917.431"><vh>fn test_single_element</vh></v>
<v t="ekr.20231101055917.432"><vh>fn test_multiple_elements</vh></v>
<v t="ekr.20231101055917.433"><vh>fn best_fitting_variants_print_as_lists</vh></v>
</v>
</v>
<v t="ekr.20231101055917.434"><vh>src/prelude.rs</vh></v>
<v t="ekr.20231101055917.435"><vh>src/source_code.rs</vh>
<v t="ekr.20231101055917.436"><vh>struct SourceCode</vh></v>
<v t="ekr.20231101055917.437"><vh>impl SourceCode</vh>
<v t="ekr.20231101055917.438"><vh>fn new</vh></v>
<v t="ekr.20231101055917.439"><vh>fn slice</vh></v>
<v t="ekr.20231101055917.440"><vh>fn as_str</vh></v>
</v>
<v t="ekr.20231101055917.441"><vh>impl Debug for SourceCode</vh></v>
<v t="ekr.20231101055917.443"><vh>struct SourceCodeSlice</vh></v>
<v t="ekr.20231101055917.444"><vh>impl SourceCodeSlice</vh></v>
<v t="ekr.20231101055917.445"><vh>impl Ranged for SourceCodeSlice</vh></v>
<v t="ekr.20231101055917.447"><vh>impl Debug for SourceCodeSlice</vh></v>
</v>
</v>
<v t="ekr.20231101055917.449"><vh>src/format_element</vh>
<v t="ekr.20231101055917.450"><vh>src/format_element/document.rs</vh>
<v t="ekr.20231101055917.451"><vh>struct Document</vh></v>
<v t="ekr.20231101055917.452"><vh>impl Document</vh>
<v t="ekr.20231101055917.453"><vh>fn expand_parent</vh></v>
</v>
<v t="ekr.20231101055917.454"><vh>impl From&gt; for Document</vh></v>
<v t="ekr.20231101055917.456"><vh>impl Deref for Document</vh></v>
<v t="ekr.20231101055917.458"><vh>struct DisplayDocument</vh></v>
<v t="ekr.20231101055917.459"><vh>impl std::fmt::Display for DisplayDocument</vh>
<v t="ekr.20231101055917.460"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.461"><vh>impl std::fmt::Debug for DisplayDocument</vh></v>
<v t="ekr.20231101055917.463"><vh>struct IrFormatContext</vh></v>
<v t="ekr.20231101055917.464"><vh>impl IrFormatContext</vh></v>
<v t="ekr.20231101055917.466"><vh>impl FormatContext for IrFormatContext</vh>
<v t="ekr.20231101055917.467"><vh>fn options</vh></v>
<v t="ekr.20231101055917.468"><vh>fn source_code</vh></v>
</v>
<v t="ekr.20231101055917.469"><vh>impl FormatOptions for IrFormatOptions</vh>
<v t="ekr.20231101055917.470"><vh>fn indent_style</vh></v>
<v t="ekr.20231101055917.471"><vh>fn indent_width</vh></v>
<v t="ekr.20231101055917.472"><vh>fn line_width</vh></v>
<v t="ekr.20231101055917.473"><vh>fn as_print_options</vh></v>
</v>
<v t="ekr.20231101055917.474"><vh>impl Format&gt; for &amp;[FormatElement]</vh>
<v t="ekr.20231101055917.475"><vh>fn fmt</vh>
<v t="ekr.20231101055917.476"><vh>fn write_escaped</vh></v>
</v>
</v>
<v t="ekr.20231101055917.477"><vh>impl Format&gt; for ContentArrayStart</vh>
<v t="ekr.20231101055917.478"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.479"><vh>impl Format&gt; for ContentArrayEnd</vh></v>
<v t="ekr.20231101055917.481"><vh>impl FormatElements for [FormatElement]</vh>
<v t="ekr.20231101055917.482"><vh>fn will_break</vh></v>
<v t="ekr.20231101055917.483"><vh>fn has_label</vh></v>
<v t="ekr.20231101055917.484"><vh>fn start_tag</vh></v>
<v t="ekr.20231101055917.485"><vh>fn end_tag</vh></v>
</v>
<v t="ekr.20231101055917.486"><vh>impl Format&gt; for Condition</vh>
<v t="ekr.20231101055917.487"><vh>fn fmt</vh></v>
</v>
<v t="ekr.20231101055917.488"><vh>mod tests</vh>
<v t="ekr.20231101055917.489"><vh>fn display_elements</vh></v>
<v t="ekr.20231101055917.490"><vh>fn escapes_quotes</vh></v>
<v t="ekr.20231101055917.491"><vh>fn display_elements_with_source_text_slice</vh></v>
<v t="ekr.20231101055917.492"><vh>fn display_invalid_document</vh></v>
</v>
</v>
<v t="ekr.20231101055917.493"><vh>src/format_element/tag.rs</vh>
<v t="ekr.20231101055917.494"><vh>impl Tag</vh></v>
<v t="ekr.20231101055917.495"><vh>impl GroupMode</vh></v>
<v t="ekr.20231101055917.496"><vh>struct FitsExpanded</vh></v>
<v t="ekr.20231101055917.497"><vh>impl FitsExpanded</vh>
<v t="ekr.20231101055917.498"><vh>fn new</vh></v>
<v t="ekr.20231101055917.499"><vh>fn with_condition</vh></v>
<v t="ekr.20231101055917.500"><vh>fn propagate_expand</vh></v>
</v>
<v t="ekr.20231101055917.501"><vh>struct Group</vh></v>
<v t="ekr.20231101055917.502"><vh>impl Group</vh>
<v t="ekr.20231101055917.503"><vh>fn new</vh></v>
<v t="ekr.20231101055917.504"><vh>fn with_id</vh></v>
<v t="ekr.20231101055917.505"><vh>fn with_mode</vh></v>
<v t="ekr.20231101055917.506"><vh>fn mode</vh></v>
<v t="ekr.20231101055917.507"><vh>fn propagate_expand</vh></v>
<v t="ekr.20231101055917.508"><vh>fn id</vh></v>
</v>
<v t="ekr.20231101055917.509"><vh>struct ConditionalGroup</vh></v>
<v t="ekr.20231101055917.510"><vh>impl ConditionalGroup</vh>
<v t="ekr.20231101055917.511"><vh>fn new</vh></v>
<v t="ekr.20231101055917.512"><vh>fn condition</vh></v>
<v t="ekr.20231101055917.513"><vh>fn propagate_expand</vh></v>
<v t="ekr.20231101055917.514"><vh>fn mode</vh></v>
</v>
<v t="ekr.20231101055917.515"><vh>struct Condition</vh></v>
<v t="ekr.20231101055917.516"><vh>impl Condition</vh>
<v t="ekr.20231101055917.517"><vh>fn if_fits_on_line</vh></v>
<v t="ekr.20231101055917.518"><vh>fn if_group_fits_on_line</vh></v>
<v t="ekr.20231101055917.519"><vh>fn if_breaks</vh></v>
<v t="ekr.20231101055917.520"><vh>fn if_group_breaks</vh></v>
<v t="ekr.20231101055917.521"><vh>fn with_group_id</vh></v>
</v>
<v t="ekr.20231101055917.522"><vh>impl Align</vh></v>
<v t="ekr.20231101055917.524"><vh>struct LabelId</vh></v>
<v t="ekr.20231101055917.525"><vh>impl PartialEq for LabelId</vh>
<v t="ekr.20231101055917.526"><vh>fn eq</vh></v>
</v>
<v t="ekr.20231101055917.527"><vh>impl LabelId</vh></v>
<v t="ekr.20231101055917.528"><vh>trait LabelDefinition</vh></v>
<v t="ekr.20231101055917.529"><vh>impl VerbatimKind</vh></v>
</v>
</v>
<v t="ekr.20231101055917.530"><vh>src/printer</vh>
<v t="ekr.20231101055917.531"><vh>src/printer/call_stack.rs</vh>
<v t="ekr.20231101055917.532"><vh>impl PrintElementArgs</vh></v>
<v t="ekr.20231101055917.533"><vh>impl Default for PrintElementArgs</vh></v>
<v t="ekr.20231101055917.535"><vh>fn pop</vh></v>
<v t="ekr.20231101055917.536"><vh>fn invalid_document_error</vh></v>
<v t="ekr.20231101055917.537"><vh>fn top</vh></v>
<v t="ekr.20231101055917.538"><vh>fn top_kind</vh></v>
<v t="ekr.20231101055917.539"><vh>fn push</vh></v>
<v t="ekr.20231101055917.540"><vh>impl PrintCallStack</vh></v>
<v t="ekr.20231101055917.541"><vh>impl CallStack for PrintCallStack</vh>
<v t="ekr.20231101055917.542"><vh>fn stack</vh></v>
<v t="ekr.20231101055917.543"><vh>fn stack_mut</vh></v>
</v>
<v t="ekr.20231101055917.544"><vh>impl FitsCallStack</vh></v>
<v t="ekr.20231101055917.545"><vh>impl CallStack for FitsCallStack</vh>
<v t="ekr.20231101055917.546"><vh>fn stack</vh></v>
<v t="ekr.20231101055917.547"><vh>fn stack_mut</vh></v>
</v>
</v>
<v t="ekr.20231101055917.548"><vh>src/printer/line_suffixes.rs</vh>
<v t="ekr.20231101055917.549"><vh>impl LineSuffixes</vh></v>
</v>
<v t="ekr.20231101055917.550"><vh>src/printer/mod.rs</vh>
<v t="ekr.20231101055917.551"><vh>struct Printer</vh></v>
<v t="ekr.20231101055917.552"><vh>impl Printer</vh>
<v t="ekr.20231101055917.553"><vh>fn new</vh></v>
<v t="ekr.20231101055917.554"><vh>fn print</vh></v>
<v t="ekr.20231101055917.555"><vh>fn print_with_indent</vh></v>
<v t="ekr.20231101055917.556"><vh>fn print_element</vh></v>
<v t="ekr.20231101055917.557"><vh>fn fits</vh></v>
<v t="ekr.20231101055917.558"><vh>fn flat_group_print_mode</vh></v>
<v t="ekr.20231101055917.559"><vh>fn print_text</vh></v>
<v t="ekr.20231101055917.560"><vh>fn push_marker</vh></v>
<v t="ekr.20231101055917.561"><vh>fn flush_line_suffixes</vh></v>
<v t="ekr.20231101055917.562"><vh>fn print_best_fitting</vh></v>
<v t="ekr.20231101055917.563"><vh>fn print_fill_entries</vh></v>
<v t="ekr.20231101055917.564"><vh>fn print_fill_item</vh></v>
<v t="ekr.20231101055917.565"><vh>fn print_fill_separator</vh></v>
<v t="ekr.20231101055917.566"><vh>fn print_entry</vh></v>
<v t="ekr.20231101055917.567"><vh>fn print_char</vh></v>
</v>
<v t="ekr.20231101055917.568"><vh>struct PrinterState</vh></v>
<v t="ekr.20231101055917.569"><vh>impl PrinterState</vh></v>
<v t="ekr.20231101055917.571"><vh>impl GroupModes</vh>
<v t="ekr.20231101055917.572"><vh>fn insert_print_mode</vh></v>
<v t="ekr.20231101055917.573"><vh>fn get_print_mode</vh></v>
</v>
<v t="ekr.20231101055917.574"><vh>impl Indention</vh>
<v t="ekr.20231101055917.575"><vh>fn level</vh></v>
<v t="ekr.20231101055917.576"><vh>fn align</vh></v>
<v t="ekr.20231101055917.577"><vh>fn increment_level</vh></v>
<v t="ekr.20231101055917.578"><vh>fn decrement</vh></v>
<v t="ekr.20231101055917.579"><vh>fn set_align</vh></v>
</v>
<v t="ekr.20231101055917.580"><vh>impl Default for Indention</vh></v>
<v t="ekr.20231101055917.582"><vh>struct FitsMeasurer</vh></v>
<v t="ekr.20231101055917.583"><vh>impl FitsMeasurer</vh>
<v t="ekr.20231101055917.584"><vh>fn new_flat</vh></v>
<v t="ekr.20231101055917.585"><vh>fn new</vh></v>
<v t="ekr.20231101055917.586"><vh>fn fill_item_fits</vh></v>
<v t="ekr.20231101055917.587"><vh>fn fill_separator_fits</vh></v>
<v t="ekr.20231101055917.588"><vh>fn fill_entry_fits</vh></v>
<v t="ekr.20231101055917.589"><vh>fn fits_element</vh></v>
<v t="ekr.20231101055917.590"><vh>fn fits_group</vh></v>
<v t="ekr.20231101055917.591"><vh>fn fits_text</vh></v>
<v t="ekr.20231101055917.592"><vh>fn finish</vh></v>
<v t="ekr.20231101055917.593"><vh>fn options</vh></v>
<v t="ekr.20231101055917.594"><vh>fn group_modes</vh></v>
<v t="ekr.20231101055917.595"><vh>fn group_modes_mut</vh></v>
</v>
<v t="ekr.20231101055917.596"><vh>impl From for Fits</vh></v>
<v t="ekr.20231101055917.598"><vh>struct FitsState</vh></v>
<v t="ekr.20231101055917.599"><vh>impl MeasureMode</vh></v>
<v t="ekr.20231101055917.600"><vh>impl From for MeasureMode</vh></v>
<v t="ekr.20231101055917.602"><vh>mod tests</vh>
<v t="ekr.20231101055917.603"><vh>fn format</vh></v>
<v t="ekr.20231101055917.604"><vh>fn format_with_options</vh></v>
<v t="ekr.20231101055917.605"><vh>fn it_prints_a_group_on_a_single_line_if_it_fits</vh></v>
<v t="ekr.20231101055917.606"><vh>fn it_tracks_the_indent_for_each_token</vh></v>
<v t="ekr.20231101055917.607"><vh>fn it_converts_line_endings</vh></v>
<v t="ekr.20231101055917.608"><vh>fn it_breaks_a_group_if_a_string_contains_a_newline</vh></v>
<v t="ekr.20231101055917.609"><vh>fn it_breaks_a_group_if_it_contains_a_hard_line_break</vh></v>
<v t="ekr.20231101055917.610"><vh>fn it_breaks_parent_groups_if_they_dont_fit_on_a_single_line</vh></v>
<v t="ekr.20231101055917.611"><vh>fn it_use_the_indent_character_specified_in_the_options</vh></v>
<v t="ekr.20231101055917.612"><vh>fn it_prints_consecutive_hard_lines_as_one</vh></v>
<v t="ekr.20231101055917.613"><vh>fn it_prints_consecutive_empty_lines_as_many</vh></v>
<v t="ekr.20231101055917.614"><vh>fn it_prints_consecutive_mixed_lines_as_many</vh></v>
<v t="ekr.20231101055917.615"><vh>fn test_fill_breaks</vh></v>
<v t="ekr.20231101055917.616"><vh>fn line_suffix_printed_at_end</vh></v>
<v t="ekr.20231101055917.617"><vh>fn line_suffix_with_reserved_width</vh></v>
<v t="ekr.20231101055917.618"><vh>fn conditional_with_group_id_in_fits</vh></v>
<v t="ekr.20231101055917.619"><vh>fn out_of_order_group_ids</vh></v>
<v t="ekr.20231101055917.620"><vh>struct FormatArrayElements</vh></v>
<v t="ekr.20231101055917.621"><vh>impl Format for FormatArrayElements</vh>
<v t="ekr.20231101055917.622"><vh>fn fmt</vh></v>
</v>
</v>
</v>
<v t="ekr.20231101055917.623"><vh>src/printer/queue.rs</vh>
<v t="ekr.20231101055917.624"><vh>fn top</vh></v>
<v t="ekr.20231101055917.625"><vh>fn push</vh></v>
<v t="ekr.20231101055917.626"><vh>fn skip_content</vh></v>
<v t="ekr.20231101055917.627"><vh>impl PrintQueue</vh></v>
<v t="ekr.20231101055917.628"><vh>impl Queue for PrintQueue</vh>
<v t="ekr.20231101055917.629"><vh>fn pop</vh></v>
<v t="ekr.20231101055917.630"><vh>fn top_with_interned</vh></v>
<v t="ekr.20231101055917.631"><vh>fn extend_back</vh></v>
<v t="ekr.20231101055917.632"><vh>fn pop_slice</vh></v>
</v>
<v t="ekr.20231101055917.633"><vh>impl FitsQueue</vh></v>
<v t="ekr.20231101055917.634"><vh>impl Queue for FitsQueue</vh>
<v t="ekr.20231101055917.635"><vh>fn pop</vh></v>
<v t="ekr.20231101055917.636"><vh>fn top_with_interned</vh></v>
<v t="ekr.20231101055917.637"><vh>fn extend_back</vh></v>
<v t="ekr.20231101055917.638"><vh>fn pop_slice</vh></v>
</v>
<v t="ekr.20231101055917.639"><vh>impl Iterator for QueueIterator</vh></v>
<v t="ekr.20231101055917.641"><vh>impl QueueContentIterator</vh></v>
<v t="ekr.20231101055917.643"><vh>impl Iterator for QueueContentIterator</vh>
<v t="ekr.20231101055917.644"><vh>fn next</vh></v>
</v>
<v t="ekr.20231101055917.645"><vh>impl FitsEndPredicate for AllPredicate</vh></v>
<v t="ekr.20231101055917.647"><vh>impl SingleEntryPredicate</vh></v>
<v t="ekr.20231101055917.648"><vh>impl Default for SingleEntryPredicate</vh></v>
<v t="ekr.20231101055917.650"><vh>impl FitsEndPredicate for SingleEntryPredicate</vh>
<v t="ekr.20231101055917.651"><vh>fn is_end</vh></v>
</v>
<v t="ekr.20231101055917.652"><vh>mod tests</vh>
<v t="ekr.20231101055917.653"><vh>fn extend_back_pop_last</vh></v>
<v t="ekr.20231101055917.654"><vh>fn extend_back_empty_queue</vh></v>
</v>
</v>
<v t="ekr.20231101055917.655"><vh>src/printer/stack.rs</vh>
<v t="ekr.20231101055917.656"><vh>impl Stack for Vec</vh>
<v t="ekr.20231101055917.657"><vh>fn pop</vh></v>
<v t="ekr.20231101055917.658"><vh>fn push</vh></v>
<v t="ekr.20231101055917.659"><vh>fn top</vh></v>
<v t="ekr.20231101055917.660"><vh>fn is_empty</vh></v>
</v>
<v t="ekr.20231101055917.661"><vh>impl StackedStack</vh></v>
<v t="ekr.20231101055917.662"><vh>impl Stack for StackedStack</vh>
<v t="ekr.20231101055917.663"><vh>fn pop</vh></v>
<v t="ekr.20231101055917.664"><vh>fn push</vh></v>
<v t="ekr.20231101055917.665"><vh>fn top</vh></v>
<v t="ekr.20231101055917.666"><vh>fn is_empty</vh></v>
</v>
<v t="ekr.20231101055917.667"><vh>mod tests</vh>
<v t="ekr.20231101055917.668"><vh>fn restore_consumed_stack</vh></v>
<v t="ekr.20231101055917.669"><vh>fn restore_partially_consumed_stack</vh></v>
<v t="ekr.20231101055917.670"><vh>fn restore_stack</vh></v>
</v>
</v>
<v t="ekr.20231101055917.672"><vh>src/printer/printer_options/mod.rs</vh>
<v t="ekr.20231101055917.673"><vh>struct PrinterOptions</vh></v>
<v t="ekr.20231101055917.674"><vh>impl From for PrinterOptions</vh></v>
<v t="ekr.20231101055917.676"><vh>impl PrinterOptions</vh>
<v t="ekr.20231101055917.677"><vh>fn with_line_width</vh></v>
<v t="ekr.20231101055917.678"><vh>fn with_indent</vh></v>
<v t="ekr.20231101055917.679"><vh>fn with_tab_width</vh></v>
</v>
<v t="ekr.20231101055917.680"><vh>impl PrintWidth</vh></v>
<v t="ekr.20231101055917.682"><vh>impl Default for PrintWidth</vh></v>
<v t="ekr.20231101055917.684"><vh>impl From for PrintWidth</vh></v>
<v t="ekr.20231101055917.686"><vh>impl From for u32</vh></v>
<v t="ekr.20231101055917.688"><vh>impl From for u16</vh></v>
<v t="ekr.20231101055917.690"><vh>impl SourceMapGeneration</vh></v>
<v t="ekr.20231101055917.691"><vh>impl LineEnding</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20231101055901.1"></t>
<t tx="ekr.20231101055901.2"></t>
<t tx="ekr.20231101055901.3">clean-rust
recursive-import
backup

# refresh-from-disk
# pylint
# show-plugin-handlers
# merge-node-with-next-node
# merge-node-with-prev-node
# beautify-files
</t>
<t tx="ekr.20231101055901.4">"""
Back up this .leo file.

os.environ['LEO_BACKUP'] must be the path to an existing (writable) directory.
"""
c.backup_helper(sub_dir='ekr-private')
</t>
<t tx="ekr.20231101055901.5">g.cls()
print('@button remove-copyright')
# h = '--- @edit files'
# root = g.findTopLevelNode(c, h)
root = c.lastTopLevel()
start_s = 'LilyPond is free software:'
end_s = 'If not, see &lt;http://www.gnu.org/licenses/&gt;.'
for p in root.subtree():
    s = p.b
    i = s.find(start_s)
    j = s.find(end_s)
    if -1 &lt; i &lt; j:
        s = s[:i] + s[j + len(end_s):]
        p.b = s
        print(f"Changed {p.h}")
print('done')</t>
<t tx="ekr.20231101055901.6">g.cls()
print('@button clean-comments')
root = c.lastTopLevel()
for p in root.subtree():
    s = p.b.replace('\n\n*/', '\n*/')
    if s != p.b:
        p.b = s
        print(f"Changed {p.h}")
print('done')</t>
<t tx="ekr.20231101055908.1">@language python
"""Recursively import all python files in a directory and clean the result."""
@tabwidth -4 # For a better match.
g.cls()

dir_ = r'C:\Repos\ruff\crates\ruff_formatter'
   
c.recursiveImport(
    dir_=dir_,
    kind = '@file', # '@auto', '@clean', '@nosent','@file',
    recursive = True,
    safe_at_file = True,
    theTypes = ['.rs',],
        # ['.codon', '.cpp', '.html', '.js', '.json', '.py', '.rs', '.svg', '.ts', '.tsx']
        # '.el', '.scm',], # Lisp.
    verbose = False,
)
if 1:
    last = c.lastTopLevel()
    last.expand()
    if last.hasChildren():
        last.firstChild().expand()
    c.redraw(last)
print('Done')</t>
<t tx="ekr.20231101055917.1"># C:/Repos/ruff/crates/ruff_formatter</t>
<t tx="ekr.20231101055917.100">impl&lt;Context&gt; Format&lt;Context&gt; for Line {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Line(self.mode));
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.102">impl std::fmt::Debug for Line {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("Line").field(&amp;self.mode).finish()
    }
}
</t>
<t tx="ekr.20231101055917.104">/// Creates a token that gets written as is to the output. A token must be ASCII only and is not allowed
/// to contain any line breaks or tab characters.
///
/// # Examples
///
/// ```
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [token("Hello World")])?;
///
/// assert_eq!(
///     "Hello World",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// Printing a string literal as a literal requires that the string literal is properly escaped and
/// enclosed in quotes (depending on the target language).
///
/// ```
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// // the tab must be encoded as \\t to not literally print a tab character ("Hello{tab}World" vs "Hello\tWorld")
/// let elements = format!(SimpleFormatContext::default(), [token("\"Hello\\tWorld\"")])?;
///
/// assert_eq!(r#""Hello\tWorld""#, elements.print()?.as_code());
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn token(text: &amp;'static str) -&gt; Token {
    debug_assert!(text.is_ascii(), "Token must be ASCII text only");
    debug_assert!(
        !text.contains(['\n', '\r', '\t']),
        "A token should not contain any newlines or tab characters"
    );

    Token { text }
}
</t>
<t tx="ekr.20231101055917.105">#[derive(Clone, Copy, Eq, PartialEq)]
pub struct Token {
    text: &amp;'static str,
}
</t>
<t tx="ekr.20231101055917.106">impl&lt;Context&gt; Format&lt;Context&gt; for Token {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Token { text: self.text });
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.108">impl std::fmt::Debug for Token {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        std::write!(f, "Token({})", self.text)
    }
}
</t>
<t tx="ekr.20231101055917.11">/// Formatting specific [`Iterator`] extensions
pub trait FormattedIterExt {
    /// Converts every item to an object that knows how to format it.
    fn formatted&lt;Context&gt;(self) -&gt; FormattedIter&lt;Self, Self::Item, Context&gt;
    where
        Self: Iterator + Sized,
        Self::Item: IntoFormat&lt;Context&gt;,
    {
        FormattedIter {
            inner: self,
            options: std::marker::PhantomData,
        }
    }
}
</t>
<t tx="ekr.20231101055917.110">/// Creates a source map entry from the passed source `position` to the position in the formatted output.
///
/// ## Examples
///
/// ```
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// // the tab must be encoded as \\t to not literally print a tab character ("Hello{tab}World" vs "Hello\tWorld")
/// use ruff_text_size::TextSize;
/// use ruff_formatter::SourceMarker;
///
///
/// let elements = format!(SimpleFormatContext::default(), [
///     source_position(TextSize::new(0)),
///     token("\"Hello "),
///     source_position(TextSize::new(8)),
///     token("'Ruff'"),
///     source_position(TextSize::new(14)),
///     token("\""),
///     source_position(TextSize::new(20))
/// ])?;
///
/// let printed = elements.print()?;
///
/// assert_eq!(printed.as_code(), r#""Hello 'Ruff'""#);
/// assert_eq!(printed.sourcemap(), [
///     SourceMarker { source: TextSize::new(0), dest: TextSize::new(0) },
///     SourceMarker { source: TextSize::new(0), dest: TextSize::new(7) },
///     SourceMarker { source: TextSize::new(8), dest: TextSize::new(7) },
///     SourceMarker { source: TextSize::new(8), dest: TextSize::new(13) },
///     SourceMarker { source: TextSize::new(14), dest: TextSize::new(13) },
///     SourceMarker { source: TextSize::new(14), dest: TextSize::new(14) },
///     SourceMarker { source: TextSize::new(20), dest: TextSize::new(14) },
/// ]);
///
/// # Ok(())
/// # }
/// ```
pub const fn source_position(position: TextSize) -&gt; SourcePosition {
    SourcePosition(position)
}

#[derive(Eq, PartialEq, Copy, Clone, Debug)]
pub struct SourcePosition(TextSize);

impl&lt;Context&gt; Format&lt;Context&gt; for SourcePosition {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::SourcePosition(self.0));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.112">/// Creates a text from a dynamic string with its optional start-position in the source document.
/// This is done by allocating a new string internally.
pub fn text(text: &amp;str, position: Option&lt;TextSize&gt;) -&gt; Text {
    debug_assert_no_newlines(text);

    Text { text, position }
}
</t>
<t tx="ekr.20231101055917.113">#[derive(Eq, PartialEq)]
pub struct Text&lt;'a&gt; {
    text: &amp;'a str,
    position: Option&lt;TextSize&gt;,
}
</t>
<t tx="ekr.20231101055917.114">impl&lt;Context&gt; Format&lt;Context&gt; for Text&lt;'_&gt;
where
    Context: FormatContext,
{
    @others
}
</t>
<t tx="ekr.20231101055917.115">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    if let Some(source_position) = self.position {
        f.write_element(FormatElement::SourcePosition(source_position));
    }

    f.write_element(FormatElement::Text {
        text: self.text.to_string().into_boxed_str(),
        text_width: TextWidth::from_text(self.text, f.options().indent_width()),
    });

    Ok(())
}
</t>
<t tx="ekr.20231101055917.116">impl std::fmt::Debug for Text&lt;'_&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        std::write!(f, "Text({})", self.text)
    }
}
</t>
<t tx="ekr.20231101055917.118">/// Emits a text as it is written in the source document. Optimized to avoid allocations.
pub const fn source_text_slice(range: TextRange) -&gt; SourceTextSliceBuilder {
    SourceTextSliceBuilder { range }
}

#[derive(Eq, PartialEq, Debug)]
pub struct SourceTextSliceBuilder {
    range: TextRange,
}
</t>
<t tx="ekr.20231101055917.119">impl&lt;Context&gt; Format&lt;Context&gt; for SourceTextSliceBuilder
where
    Context: FormatContext,
{
    @others
}
</t>
<t tx="ekr.20231101055917.12">impl&lt;I&gt; FormattedIterExt for I where I: std::iter::Iterator {}

pub struct FormattedIter&lt;Iter, Item, Context&gt;
where
    Iter: Iterator&lt;Item = Item&gt;,
{
    inner: Iter,
    options: std::marker::PhantomData&lt;Context&gt;,
}
</t>
<t tx="ekr.20231101055917.120">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    let source_code = f.context().source_code();
    let slice = source_code.slice(self.range);
    debug_assert_no_newlines(slice.text(source_code));

    let text_width = TextWidth::from_text(
        slice.text(source_code),
        f.context().options().indent_width(),
    );

    f.write_element(FormatElement::SourceCodeSlice { slice, text_width });

    Ok(())
}
</t>
<t tx="ekr.20231101055917.121">fn debug_assert_no_newlines(text: &amp;str) {
    debug_assert!(!text.contains('\r'), "The content '{text}' contains an unsupported '\\r' line terminator character but text must only use line feeds '\\n' as line separator. Use '\\n' instead of '\\r' and '\\r\\n' to insert a line break in strings.");
}
</t>
<t tx="ekr.20231101055917.122">/// Pushes some content to the end of the current line.
///
/// ## Examples
///
/// ```rust
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     token("a"),
///     line_suffix(&amp;token("c"), 0),
///     token("b")
/// ])?;
///
/// assert_eq!("abc", elements.print()?.as_code());
/// # Ok(())
/// # }
/// ```
///
/// Provide reserved width for the line suffix to include it during measurement.
/// ```rust
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatContext, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(10).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     // Breaks
///     group(&amp;format_args![
///         if_group_breaks(&amp;token("(")),
///         soft_block_indent(&amp;format_args![token("a"), line_suffix(&amp;token(" // a comment"), 13)]),
///         if_group_breaks(&amp;token(")"))
///         ]),
///
///     // Fits
///     group(&amp;format_args![
///         if_group_breaks(&amp;token("(")),
///         soft_block_indent(&amp;format_args![token("a"), line_suffix(&amp;token(" // a comment"), 0)]),
///         if_group_breaks(&amp;token(")"))
///     ]),
/// ])?;
/// # assert_eq!("(\n\ta // a comment\n)a // a comment", elements.print()?.as_code());
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn line_suffix&lt;Content, Context&gt;(inner: &amp;Content, reserved_width: u32) -&gt; LineSuffix&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    LineSuffix {
        content: Argument::new(inner),
        reserved_width,
    }
}

#[derive(Copy, Clone)]
pub struct LineSuffix&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    reserved_width: u32,
}
</t>
<t tx="ekr.20231101055917.123">impl&lt;Context&gt; Format&lt;Context&gt; for LineSuffix&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartLineSuffix {
            reserved_width: self.reserved_width,
        }));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndLineSuffix));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.125">impl&lt;Context&gt; std::fmt::Debug for LineSuffix&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("LineSuffix").field(&amp;"{{content}}").finish()
    }
}
</t>
<t tx="ekr.20231101055917.127">/// Inserts a boundary for line suffixes that forces the printer to print all pending line suffixes.
/// Helpful if a line suffix shouldn't pass a certain point.
///
/// ## Examples
///
/// Forces the line suffix "c" to be printed before the token `d`.
/// ```
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn  main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     token("a"),
///     line_suffix(&amp;token("c"), 0),
///     token("b"),
///     line_suffix_boundary(),
///     token("d")
/// ])?;
///
/// assert_eq!(
///     "abc\nd",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
pub const fn line_suffix_boundary() -&gt; LineSuffixBoundary {
    LineSuffixBoundary
}

#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub struct LineSuffixBoundary;

impl&lt;Context&gt; Format&lt;Context&gt; for LineSuffixBoundary {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::LineSuffixBoundary);
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.129">/// Marks some content with a label.
///
/// This does not directly influence how this content will be printed, but some
/// parts of the formatter may inspect the [labelled element](Tag::StartLabelled)
/// using [`FormatElements::has_label`].
///
/// ## Examples
///
/// ```rust
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, write, LineWidth};
///
/// #[derive(Debug, Copy, Clone)]
/// enum MyLabels {
///     Main
/// }
///
/// impl tag::LabelDefinition for MyLabels {
///     fn value(&amp;self) -&gt; u64 {
///         *self as u64
///     }
///
///     fn name(&amp;self) -&gt; &amp;'static str {
///         match self {
///             Self::Main =&gt; "Main"
///         }
///     }
/// }
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(
///     SimpleFormatContext::default(),
///     [format_with(|f| {
///         let mut recording = f.start_recording();
///         write!(recording, [
///             labelled(
///                 LabelId::of(MyLabels::Main),
///                 &amp;token("'I have a label'")
///             )
///         ])?;
///
///         let recorded = recording.stop();
///
///         let is_labelled = recorded.first().is_some_and( |element| element.has_label(LabelId::of(MyLabels::Main)));
///
///         if is_labelled {
///             write!(f, [token(" has label `Main`")])
///         } else {
///             write!(f, [token(" doesn't have label `Main`")])
///         }
///     })]
/// )?;
///
/// assert_eq!("'I have a label' has label `Main`", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
///
/// ## Alternatives
///
/// Use `Memoized.inspect(f)?.has_label(LabelId::of::&lt;SomeLabelId&gt;()` if you need to know if some content breaks that should
/// only be written later.
#[inline]
pub fn labelled&lt;Content, Context&gt;(label_id: LabelId, content: &amp;Content) -&gt; FormatLabelled&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    FormatLabelled {
        label_id,
        content: Argument::new(content),
    }
}

#[derive(Copy, Clone)]
pub struct FormatLabelled&lt;'a, Context&gt; {
    label_id: LabelId,
    content: Argument&lt;'a, Context&gt;,
}
</t>
<t tx="ekr.20231101055917.13">impl&lt;Iter, Item, Context&gt; std::iter::Iterator for FormattedIter&lt;Iter, Item, Context&gt;
where
    Iter: Iterator&lt;Item = Item&gt;,
    Item: IntoFormat&lt;Context&gt;,
{
    type Item = Item::Format;
    
    fn next(&amp;mut self) -&gt; Option&lt;Self::Item&gt; {
        Some(self.inner.next()?.into_format())
    }
}
</t>
<t tx="ekr.20231101055917.130">impl&lt;Context&gt; Format&lt;Context&gt; for FormatLabelled&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartLabelled(self.label_id)));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndLabelled));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.132">impl&lt;Context&gt; std::fmt::Debug for FormatLabelled&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("Label")
            .field(&amp;self.label_id)
            .field(&amp;"{{content}}")
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.134">/// Inserts a single space. Allows to separate different tokens.
///
/// # Examples
///
/// ```
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// // the tab must be encoded as \\t to not literally print a tab character ("Hello{tab}World" vs "Hello\tWorld")
/// let elements = format!(SimpleFormatContext::default(), [token("a"), space(), token("b")])?;
///
/// assert_eq!("a b", elements.print()?.as_code());
/// # Ok(())
/// # }
/// ```
#[inline]
pub const fn space() -&gt; Space {
    Space
}

#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub struct Space;

impl&lt;Context&gt; Format&lt;Context&gt; for Space {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Space);
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.136">/// It adds a level of indentation to the given content
///
/// It doesn't add any line breaks at the edges of the content, meaning that
/// the line breaks have to be manually added.
///
/// This helper should be used only in rare cases, instead you should rely more on
/// [`block_indent`] and [`soft_block_indent`]
///
/// # Examples
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let block = format!(SimpleFormatContext::default(), [
///     token("switch {"),
///     block_indent(&amp;format_args![
///         token("default:"),
///         indent(&amp;format_args![
///             // this is where we want to use a
///             hard_line_break(),
///             token("break;"),
///         ])
///     ]),
///     token("}"),
/// ])?;
///
/// assert_eq!(
///     "switch {\n\tdefault:\n\t\tbreak;\n}",
///     block.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn indent&lt;Content, Context&gt;(content: &amp;Content) -&gt; Indent&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    Indent {
        content: Argument::new(content),
    }
}

#[derive(Copy, Clone)]
pub struct Indent&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
}
</t>
<t tx="ekr.20231101055917.137">impl&lt;Context&gt; Format&lt;Context&gt; for Indent&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartIndent));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndIndent));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.139">impl&lt;Context&gt; std::fmt::Debug for Indent&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("Indent").field(&amp;"{{content}}").finish()
    }
}
</t>
<t tx="ekr.20231101055917.141">/// It reduces the indention for the given content depending on the closest [indent] or [align] parent element.
/// - [align] Undoes the spaces added by [align]
/// - [indent] Reduces the indention level by one
///
/// This is a No-op if the indention level is zero.
///
/// # Examples
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let block = format!(SimpleFormatContext::default(), [
///     token("root"),
///     align(2, &amp;format_args![
///         hard_line_break(),
///         token("aligned"),
///         dedent(&amp;format_args![
///             hard_line_break(),
///             token("not aligned"),
///         ]),
///         dedent(&amp;indent(&amp;format_args![
///             hard_line_break(),
///             token("Indented, not aligned")
///         ]))
///     ]),
///     dedent(&amp;format_args![
///         hard_line_break(),
///         token("Dedent on root level is a no-op.")
///     ])
/// ])?;
///
/// assert_eq!(
///     "root\n  aligned\nnot aligned\n\tIndented, not aligned\nDedent on root level is a no-op.",
///     block.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn dedent&lt;Content, Context&gt;(content: &amp;Content) -&gt; Dedent&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    Dedent {
        content: Argument::new(content),
        mode: DedentMode::Level,
    }
}

#[derive(Copy, Clone)]
pub struct Dedent&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    mode: DedentMode,
}
</t>
<t tx="ekr.20231101055917.142">impl&lt;Context&gt; Format&lt;Context&gt; for Dedent&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartDedent(self.mode)));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndDedent));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.144">impl&lt;Context&gt; std::fmt::Debug for Dedent&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("Dedent").field(&amp;"{{content}}").finish()
    }
}
</t>
<t tx="ekr.20231101055917.146">/// It resets the indent document so that the content will be printed at the start of the line.
///
/// # Examples
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let block = format!(SimpleFormatContext::default(), [
///     token("root"),
///     indent(&amp;format_args![
///         hard_line_break(),
///         token("indent level 1"),
///         indent(&amp;format_args![
///             hard_line_break(),
///             token("indent level 2"),
///             align(2, &amp;format_args![
///                 hard_line_break(),
///                 token("two space align"),
///                 dedent_to_root(&amp;format_args![
///                     hard_line_break(),
///                     token("starts at the beginning of the line")
///                 ]),
///             ]),
///             hard_line_break(),
///             token("end indent level 2"),
///         ])
///  ]),
/// ])?;
///
/// assert_eq!(
///     "root\n\tindent level 1\n\t\tindent level 2\n\t\t  two space align\nstarts at the beginning of the line\n\t\tend indent level 2",
///     block.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// ## Prettier
///
/// This resembles the behaviour of Prettier's `align(Number.NEGATIVE_INFINITY, content)` IR element.
#[inline]
pub fn dedent_to_root&lt;Content, Context&gt;(content: &amp;Content) -&gt; Dedent&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    Dedent {
        content: Argument::new(content),
        mode: DedentMode::Root,
    }
}

/// Aligns its content by indenting the content by `count` spaces.
///
/// [align] is a variant of `[indent]` that indents its content by a specified number of spaces rather than
/// using the configured indent character (tab or a specified number of spaces).
///
/// You should use [align] when you want to indent a content by a specific number of spaces.
/// Using [indent] is preferred in all other situations as it respects the users preferred indent character.
///
/// # Examples
///
/// ## Tab indention
///
/// ```
/// use std::num::NonZeroU8;
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let block = format!(SimpleFormatContext::default(), [
///     token("a"),
///     hard_line_break(),
///     token("?"),
///     space(),
///     align(2, &amp;format_args![
///         token("function () {"),
///         hard_line_break(),
///         token("}"),
///     ]),
///     hard_line_break(),
///     token(":"),
///     space(),
///     align(2, &amp;format_args![
///         token("function () {"),
///         block_indent(&amp;token("console.log('test');")),
///         token("}"),
///     ]),
///     token(";")
/// ])?;
///
/// assert_eq!(
///     "a\n? function () {\n  }\n: function () {\n\t\tconsole.log('test');\n  };",
///     block.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// You can see that:
///
/// - the printer indents the function's `}` by two spaces because it is inside of an `align`.
/// - the block `console.log` gets indented by two tabs.
///   This is because `align` increases the indention level by one (same as `indent`)
///   if you nest an `indent` inside an `align`.
///   Meaning that, `align &gt; ... &gt; indent` results in the same indention as `indent &gt; ... &gt; indent`.
///
/// ## Spaces indention
///
/// ```
/// use std::num::NonZeroU8;
/// use ruff_formatter::{format, format_args, IndentStyle, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// use ruff_formatter::IndentWidth;
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     indent_style: IndentStyle::Space,
///     indent_width: IndentWidth::try_from(4).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let block = format!(context, [
///     token("a"),
///     hard_line_break(),
///     token("?"),
///     space(),
///     align(2, &amp;format_args![
///         token("function () {"),
///         hard_line_break(),
///         token("}"),
///     ]),
///     hard_line_break(),
///     token(":"),
///     space(),
///     align(2, &amp;format_args![
///         token("function () {"),
///         block_indent(&amp;token("console.log('test');")),
///         token("}"),
///     ]),
///     token(";")
/// ])?;
///
/// assert_eq!(
///     "a\n? function () {\n  }\n: function () {\n      console.log('test');\n  };",
///     block.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// The printing of `align` differs if using spaces as indention sequence *and* it contains an `indent`.
/// You can see the difference when comparing the indention of the `console.log(...)` expression to the previous example:
///
/// - tab indention: Printer indents the expression with two tabs because the `align` increases the indention level.
/// - space indention: Printer indents the expression by 4 spaces (one indention level) **and** 2 spaces for the align.
pub fn align&lt;Content, Context&gt;(count: u8, content: &amp;Content) -&gt; Align&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    Align {
        count: NonZeroU8::new(count).expect("Alignment count must be a non-zero number."),
        content: Argument::new(content),
    }
}

#[derive(Copy, Clone)]
pub struct Align&lt;'a, Context&gt; {
    count: NonZeroU8,
    content: Argument&lt;'a, Context&gt;,
}
</t>
<t tx="ekr.20231101055917.147">impl&lt;Context&gt; Format&lt;Context&gt; for Align&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartAlign(tag::Align(self.count))));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndAlign));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.149">impl&lt;Context&gt; std::fmt::Debug for Align&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_struct("Align")
            .field("count", &amp;self.count)
            .field("content", &amp;"{{content}}")
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.15">impl&lt;Iter, Item, Context&gt; std::iter::FusedIterator for FormattedIter&lt;Iter, Item, Context&gt;
where
    Iter: std::iter::FusedIterator&lt;Item = Item&gt;,
    Item: IntoFormat&lt;Context&gt;,
{
}
</t>
<t tx="ekr.20231101055917.151">/// Inserts a hard line break before and after the content and increases the indention level for the content by one.
///
/// Block indents indent a block of code, such as in a function body, and therefore insert a line
/// break before and after the content.
///
/// Doesn't create an indention if the passed in content is [`FormatElement.is_empty`].
///
/// # Examples
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let block = format![
///     SimpleFormatContext::default(),
///     [
///         token("{"),
///         block_indent(&amp;format_args![
///             token("let a = 10;"),
///             hard_line_break(),
///             token("let c = a + 5;"),
///         ]),
///         token("}"),
///     ]
/// ]?;
///
/// assert_eq!(
///     "{\n\tlet a = 10;\n\tlet c = a + 5;\n}",
///     block.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn block_indent&lt;Context&gt;(content: &amp;impl Format&lt;Context&gt;) -&gt; BlockIndent&lt;Context&gt; {
    BlockIndent {
        content: Argument::new(content),
        mode: IndentMode::Block,
    }
}

/// Indents the content by inserting a line break before and after the content and increasing
/// the indention level for the content by one if the enclosing group doesn't fit on a single line.
/// Doesn't change the formatting if the enclosing group fits on a single line.
///
/// # Examples
///
/// Indents the content by one level and puts in new lines if the enclosing `Group` doesn't fit on a single line
///
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(10).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("'First string',"),
///             soft_line_break_or_space(),
///             token("'second string',"),
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[\n\t'First string',\n\t'second string',\n]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// Doesn't change the formatting if the enclosing `Group` fits on a single line
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("5,"),
///             soft_line_break_or_space(),
///             token("10"),
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[5, 10]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn soft_block_indent&lt;Context&gt;(content: &amp;impl Format&lt;Context&gt;) -&gt; BlockIndent&lt;Context&gt; {
    BlockIndent {
        content: Argument::new(content),
        mode: IndentMode::Soft,
    }
}

/// If the enclosing `Group` doesn't fit on a single line, inserts a line break and indent.
/// Otherwise, just inserts a space.
///
/// Line indents are used to break a single line of code, and therefore only insert a line
/// break before the content and not after the content.
///
/// # Examples
///
/// Indents the content by one level and puts in new lines if the enclosing `Group` doesn't
/// fit on a single line. Otherwise, just inserts a space.
///
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(10).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("name"),
///         space(),
///         token("="),
///         soft_line_indent_or_space(&amp;format_args![
///             token("firstName"),
///             space(),
///             token("+"),
///             space(),
///             token("lastName"),
///         ]),
///     ])
/// ])?;
///
/// assert_eq!(
///     "name =\n\tfirstName + lastName",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// Only adds a space if the enclosing `Group` fits on a single line
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("a"),
///         space(),
///         token("="),
///         soft_line_indent_or_space(&amp;token("10")),
///     ])
/// ])?;
///
/// assert_eq!(
///     "a = 10",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn soft_line_indent_or_space&lt;Context&gt;(content: &amp;impl Format&lt;Context&gt;) -&gt; BlockIndent&lt;Context&gt; {
    BlockIndent {
        content: Argument::new(content),
        mode: IndentMode::SoftLineOrSpace,
    }
}

#[derive(Copy, Clone)]
pub struct BlockIndent&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    mode: IndentMode,
}
</t>
<t tx="ekr.20231101055917.152">#[derive(Copy, Clone, Eq, PartialEq, Debug)]
enum IndentMode {
    Soft,
    Block,
    SoftSpace,
    SoftLineOrSpace,
}

impl&lt;Context&gt; Format&lt;Context&gt; for BlockIndent&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.153">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    let snapshot = f.snapshot();

    f.write_element(FormatElement::Tag(StartIndent));

    match self.mode {
        IndentMode::Soft =&gt; write!(f, [soft_line_break()])?,
        IndentMode::Block =&gt; write!(f, [hard_line_break()])?,
        IndentMode::SoftLineOrSpace | IndentMode::SoftSpace =&gt; {
            write!(f, [soft_line_break_or_space()])?;
        }
    }

    let is_empty = {
        let mut recording = f.start_recording();
        recording.write_fmt(Arguments::from(&amp;self.content))?;
        recording.stop().is_empty()
    };

    if is_empty {
        f.restore_snapshot(snapshot);
        return Ok(());
    }

    f.write_element(FormatElement::Tag(EndIndent));

    match self.mode {
        IndentMode::Soft =&gt; write!(f, [soft_line_break()]),
        IndentMode::Block =&gt; write!(f, [hard_line_break()]),
        IndentMode::SoftSpace =&gt; write!(f, [soft_line_break_or_space()]),
        IndentMode::SoftLineOrSpace =&gt; Ok(()),
    }
}
</t>
<t tx="ekr.20231101055917.154">impl&lt;Context&gt; std::fmt::Debug for BlockIndent&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        let name = match self.mode {
            IndentMode::Soft =&gt; "SoftBlockIndent",
            IndentMode::Block =&gt; "HardBlockIndent",
            IndentMode::SoftLineOrSpace =&gt; "SoftLineIndentOrSpace",
            IndentMode::SoftSpace =&gt; "SoftSpaceBlockIndent",
        };
    
        f.debug_tuple(name).field(&amp;"{{content}}").finish()
    }
}
</t>
<t tx="ekr.20231101055917.156">/// Adds spaces around the content if its enclosing group fits on a line, otherwise indents the content and separates it by line breaks.
///
/// # Examples
///
/// Adds line breaks and indents the content if the enclosing group doesn't fit on the line.
///
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(10).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("{"),
///         soft_space_or_block_indent(&amp;format_args![
///             token("aPropertyThatExceeds"),
///             token(":"),
///             space(),
///             token("'line width'"),
///         ]),
///         token("}")
///     ])
/// ])?;
///
/// assert_eq!(
///     "{\n\taPropertyThatExceeds: 'line width'\n}",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// Adds spaces around the content if the group fits on the line
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("{"),
///         soft_space_or_block_indent(&amp;format_args![
///             token("a"),
///             token(":"),
///             space(),
///             token("5"),
///         ]),
///         token("}")
///     ])
/// ])?;
///
/// assert_eq!(
///     "{ a: 5 }",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
pub fn soft_space_or_block_indent&lt;Context&gt;(content: &amp;impl Format&lt;Context&gt;) -&gt; BlockIndent&lt;Context&gt; {
    BlockIndent {
        content: Argument::new(content),
        mode: IndentMode::SoftSpace,
    }
}

/// Creates a logical `Group` around the content that should either consistently be printed on a single line
/// or broken across multiple lines.
///
/// The printer will try to print the content of the `Group` on a single line, ignoring all soft line breaks and
/// emitting spaces for soft line breaks or spaces. The printer tracks back if it isn't successful either
/// because it encountered a hard line break, or because printing the `Group` on a single line exceeds
/// the configured line width, and thus it must print all its content on multiple lines,
/// emitting line breaks for all line break kinds.
///
/// # Examples
///
/// `Group` that fits on a single line
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("1,"),
///             soft_line_break_or_space(),
///             token("2,"),
///             soft_line_break_or_space(),
///             token("3"),
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[1, 2, 3]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// The printer breaks the `Group` over multiple lines if its content doesn't fit on a single line
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(20).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("'Good morning! How are you today?',"),
///             soft_line_break_or_space(),
///             token("2,"),
///             soft_line_break_or_space(),
///             token("3"),
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[\n\t'Good morning! How are you today?',\n\t2,\n\t3\n]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn group&lt;Context&gt;(content: &amp;impl Format&lt;Context&gt;) -&gt; Group&lt;Context&gt; {
    Group {
        content: Argument::new(content),
        group_id: None,
        should_expand: false,
    }
}

#[derive(Copy, Clone)]
pub struct Group&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    group_id: Option&lt;GroupId&gt;,
    should_expand: bool,
}
</t>
<t tx="ekr.20231101055917.157">impl&lt;Context&gt; Group&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.158">#[must_use]
pub fn with_group_id(mut self, group_id: Option&lt;GroupId&gt;) -&gt; Self {
    self.group_id = group_id;
    self
}
</t>
<t tx="ekr.20231101055917.159">/// Changes the [`PrintMode`] of the group from [`Flat`](PrintMode::Flat) to [`Expanded`](PrintMode::Expanded).
/// The result is that any soft-line break gets printed as a regular line break.
///
/// This is useful for content rendered inside of a [`FormatElement::BestFitting`] that prints each variant
/// in [`PrintMode::Flat`] to change some content to be printed in [`Expanded`](PrintMode::Expanded) regardless.
/// See the documentation of the [`best_fitting`] macro for an example.
#[must_use]
pub fn should_expand(mut self, should_expand: bool) -&gt; Self {
    self.should_expand = should_expand;
    self
}
</t>
<t tx="ekr.20231101055917.16">impl&lt;Iter, Item, Context&gt; std::iter::ExactSizeIterator for FormattedIter&lt;Iter, Item, Context&gt;
where
    Iter: Iterator&lt;Item = Item&gt; + std::iter::ExactSizeIterator,
    Item: IntoFormat&lt;Context&gt;,
{
}
</t>
<t tx="ekr.20231101055917.160">impl&lt;Context&gt; Format&lt;Context&gt; for Group&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.161">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    let mode = if self.should_expand {
        GroupMode::Expand
    } else {
        GroupMode::Flat
    };

    f.write_element(FormatElement::Tag(StartGroup(
        tag::Group::new().with_id(self.group_id).with_mode(mode),
    )));

    Arguments::from(&amp;self.content).fmt(f)?;

    f.write_element(FormatElement::Tag(EndGroup));

    Ok(())
}
</t>
<t tx="ekr.20231101055917.162">impl&lt;Context&gt; std::fmt::Debug for Group&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_struct("Group")
            .field("group_id", &amp;self.group_id)
            .field("should_expand", &amp;self.should_expand)
            .field("content", &amp;"{{content}}")
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.164">/// Content that may get parenthesized if it exceeds the configured line width but only if the parenthesized
/// layout doesn't exceed the line width too, in which case it falls back to the flat layout.
///
/// This IR is identical to the following [`best_fitting`] layout but is implemented as custom IR for
/// best performance.
///
/// ```rust
/// # use ruff_formatter::prelude::*;
/// # use ruff_formatter::format_args;
///
/// let format_expression = format_with(|f: &amp;mut Formatter&lt;SimpleFormatContext&gt;| token("A long string").fmt(f));
/// let _ = best_fitting![
///     // ---------------------------------------------------------------------
///     // Variant 1:
///     // Try to fit the expression without any parentheses
///     group(&amp;format_expression),
///     // ---------------------------------------------------------------------
///     // Variant 2:
///     // Try to fit the expression by adding parentheses and indenting the expression.
///     group(&amp;format_args![
///         token("("),
///         soft_block_indent(&amp;format_expression),
///         token(")")
///     ])
///     .should_expand(true),
///     // ---------------------------------------------------------------------
///     // Variant 3: Fallback, no parentheses
///     // Expression doesn't fit regardless of adding the parentheses. Remove the parentheses again.
///     group(&amp;format_expression).should_expand(true)
/// ]
/// // Measure all lines, to avoid that the printer decides that this fits right after hitting
/// // the `(`.
/// .with_mode(BestFittingMode::AllLines)        ;
/// ```
///
/// The element breaks from left-to-right because it uses the unintended version as *expanded* layout, the same as the above showed best fitting example.
///
/// ## Examples
///
/// ### Content that fits into the configured line width.
///
/// ```rust
/// # use ruff_formatter::prelude::*;
/// # use ruff_formatter::{format, PrintResult, write};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
///     let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///         write!(f, [
///             token("aLongerVariableName = "),
///             best_fit_parenthesize(&amp;token("'a string that fits into the configured line width'"))
///         ])
///     })])?;
///
///     assert_eq!(formatted.print()?.as_code(), "aLongerVariableName = 'a string that fits into the configured line width'");
///     # Ok(())
/// # }
/// ```
///
/// ### Content that fits parenthesized
///
/// ```rust
/// # use ruff_formatter::prelude::*;
/// # use ruff_formatter::{format, PrintResult, write};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
///     let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///         write!(f, [
///             token("aLongerVariableName = "),
///             best_fit_parenthesize(&amp;token("'a string that exceeds configured line width but fits parenthesized'"))
///         ])
///     })])?;
///
///     assert_eq!(formatted.print()?.as_code(), "aLongerVariableName = (\n\t'a string that exceeds configured line width but fits parenthesized'\n)");
///     # Ok(())
/// # }
/// ```
///
/// ### Content that exceeds the line width, parenthesized or not
///
/// ```rust
/// # use ruff_formatter::prelude::*;
/// # use ruff_formatter::{format, PrintResult, write};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
///     let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///         write!(f, [
///             token("aLongerVariableName = "),
///             best_fit_parenthesize(&amp;token("'a string that exceeds the configured line width and even parenthesizing doesn't make it fit'"))
///         ])
///     })])?;
///
///     assert_eq!(formatted.print()?.as_code(), "aLongerVariableName = 'a string that exceeds the configured line width and even parenthesizing doesn't make it fit'");
///     # Ok(())
/// # }
/// ```
#[inline]
pub fn best_fit_parenthesize&lt;Context&gt;(
    content: &amp;impl Format&lt;Context&gt;,
) -&gt; BestFitParenthesize&lt;Context&gt; {
    BestFitParenthesize {
        content: Argument::new(content),
        group_id: None,
    }
}

#[derive(Copy, Clone)]
pub struct BestFitParenthesize&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    group_id: Option&lt;GroupId&gt;,
}
</t>
<t tx="ekr.20231101055917.165">impl&lt;Context&gt; BestFitParenthesize&lt;'_, Context&gt; {
    /// Optional ID that can be used in conditional content that supports [`Condition`] to gate content
    /// depending on whether the parentheses are rendered (flat: no parentheses, expanded: parentheses).
    #[must_use]
    pub fn with_group_id(mut self, group_id: Option&lt;GroupId&gt;) -&gt; Self {
        self.group_id = group_id;
        self
    }
}
</t>
<t tx="ekr.20231101055917.167">impl&lt;Context&gt; Format&lt;Context&gt; for BestFitParenthesize&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.168">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    f.write_element(FormatElement::Tag(StartBestFitParenthesize {
        id: self.group_id,
    }));

    Arguments::from(&amp;self.content).fmt(f)?;

    f.write_element(FormatElement::Tag(EndBestFitParenthesize));

    Ok(())
}
</t>
<t tx="ekr.20231101055917.169">impl&lt;Context&gt; std::fmt::Debug for BestFitParenthesize&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_struct("BestFitParenthesize")
            .field("group_id", &amp;self.group_id)
            .field("content", &amp;"{{content}}")
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.17">use super::{Buffer, Format, Formatter};
use crate::FormatResult;
use std::ffi::c_void;
use std::marker::PhantomData;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.171">/// Sets the `condition` for the group. The element will behave as a regular group if `condition` is met,
/// and as *ungrouped* content if the condition is not met.
///
/// ## Examples
///
/// Only expand before operators if the parentheses are necessary.
///
/// ```
/// # use ruff_formatter::prelude::*;
/// # use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// use ruff_formatter::Formatted;
/// let content = format_with(|f| {
///     let parentheses_id = f.group_id("parentheses");
///     group(&amp;format_args![
///         if_group_breaks(&amp;token("(")),
///         indent_if_group_breaks(&amp;format_args![
///             soft_line_break(),
///             conditional_group(&amp;format_args![
///                 token("'aaaaaaa'"),
///                 soft_line_break_or_space(),
///                 token("+"),
///                 space(),
///                 fits_expanded(&amp;conditional_group(&amp;format_args![
///                     token("["),
///                     soft_block_indent(&amp;format_args![
///                         token("'Good morning!',"),
///                         soft_line_break_or_space(),
///                         token("'How are you?'"),
///                     ]),
///                     token("]"),
///                 ], tag::Condition::if_group_fits_on_line(parentheses_id))),
///                 soft_line_break_or_space(),
///                 token("+"),
///                 space(),
///                 conditional_group(&amp;format_args![
///                     token("'bbbb'"),
///                     soft_line_break_or_space(),
///                     token("and"),
///                     space(),
///                     token("'c'")
///                 ], tag::Condition::if_group_fits_on_line(parentheses_id))
///             ], tag::Condition::if_breaks()),
///         ], parentheses_id),
///         soft_line_break(),
///         if_group_breaks(&amp;token(")"))
///     ])
///     .with_group_id(Some(parentheses_id))
///     .fmt(f)
/// });
///
/// let formatted = format!(SimpleFormatContext::default(), [content])?;
/// let document = formatted.into_document();
///
/// // All content fits
/// let all_fits = Formatted::new(document.clone(), SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(65).unwrap(),
///     ..SimpleFormatOptions::default()
/// }));
///
/// assert_eq!(
///     "'aaaaaaa' + ['Good morning!', 'How are you?'] + 'bbbb' and 'c'",
///     all_fits.print()?.as_code()
/// );
///
/// // The parentheses group fits, because it can expand the list,
/// let list_expanded = Formatted::new(document.clone(), SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(21).unwrap(),
///     ..SimpleFormatOptions::default()
/// }));
///
/// assert_eq!(
///     "'aaaaaaa' + [\n\t'Good morning!',\n\t'How are you?'\n] + 'bbbb' and 'c'",
///     list_expanded.print()?.as_code()
/// );
///
/// // It is necessary to split all groups to fit the content
/// let all_expanded = Formatted::new(document, SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(11).unwrap(),
///     ..SimpleFormatOptions::default()
/// }));
///
/// assert_eq!(
///     "(\n\t'aaaaaaa'\n\t+ [\n\t\t'Good morning!',\n\t\t'How are you?'\n\t]\n\t+ 'bbbb'\n\tand 'c'\n)",
///     all_expanded.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn conditional_group&lt;Content, Context&gt;(
    content: &amp;Content,
    condition: Condition,
) -&gt; ConditionalGroup&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    ConditionalGroup {
        content: Argument::new(content),
        condition,
    }
}

#[derive(Clone)]
pub struct ConditionalGroup&lt;'content, Context&gt; {
    content: Argument&lt;'content, Context&gt;,
    condition: Condition,
}
</t>
<t tx="ekr.20231101055917.172">impl&lt;Context&gt; Format&lt;Context&gt; for ConditionalGroup&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartConditionalGroup(
            tag::ConditionalGroup::new(self.condition),
        )));
        f.write_fmt(Arguments::from(&amp;self.content))?;
        f.write_element(FormatElement::Tag(EndConditionalGroup));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.174">impl&lt;Context&gt; std::fmt::Debug for ConditionalGroup&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_struct("ConditionalGroup")
            .field("condition", &amp;self.condition)
            .field("content", &amp;"{{content}}")
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.176">/// IR element that forces the parent group to print in expanded mode.
///
/// Has no effect if used outside of a group or element that introduce implicit groups (fill element).
///
/// ## Examples
///
/// ```
/// use ruff_formatter::{format, format_args, LineWidth};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("'Good morning! How are you today?',"),
///             soft_line_break_or_space(),
///             token("2,"),
///             expand_parent(), // Forces the parent to expand
///             soft_line_break_or_space(),
///             token("3"),
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[\n\t'Good morning! How are you today?',\n\t2,\n\t3\n]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// # Prettier
/// Equivalent to Prettier's `break_parent` IR element
pub const fn expand_parent() -&gt; ExpandParent {
    ExpandParent
}

#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub struct ExpandParent;

impl&lt;Context&gt; Format&lt;Context&gt; for ExpandParent {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::ExpandParent);
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.178">/// Adds a conditional content that is emitted only if it isn't inside an enclosing `Group` that
/// is printed on a single line. The element allows, for example, to insert a trailing comma after the last
/// array element only if the array doesn't fit on a single line.
///
/// The element has no special meaning if used outside of a `Group`. In that case, the content is always emitted.
///
/// If you're looking for a way to only print something if the `Group` fits on a single line see [`self::if_group_fits_on_line`].
///
/// # Examples
///
/// Omits the trailing comma for the last array element if the `Group` fits on a single line
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("1,"),
///             soft_line_break_or_space(),
///             token("2,"),
///             soft_line_break_or_space(),
///             token("3"),
///             if_group_breaks(&amp;token(","))
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[1, 2, 3]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// Prints the trailing comma for the last array element if the `Group` doesn't fit on a single line
/// ```
/// use ruff_formatter::{format_args, format, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(20).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("'A somewhat longer string to force a line break',"),
///             soft_line_break_or_space(),
///             token("2,"),
///             soft_line_break_or_space(),
///             token("3"),
///             if_group_breaks(&amp;token(","))
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[\n\t'A somewhat longer string to force a line break',\n\t2,\n\t3,\n]",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn if_group_breaks&lt;Content, Context&gt;(content: &amp;Content) -&gt; IfGroupBreaks&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    IfGroupBreaks {
        content: Argument::new(content),
        group_id: None,
        mode: PrintMode::Expanded,
    }
}

/// Adds a conditional content specific for `Group`s that fit on a single line. The content isn't
/// emitted for `Group`s spanning multiple lines.
///
/// See [`if_group_breaks`] if you're looking for a way to print content only for groups spanning multiple lines.
///
/// # Examples
///
/// Adds the trailing comma for the last array element if the `Group` fits on a single line
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("1,"),
///             soft_line_break_or_space(),
///             token("2,"),
///             soft_line_break_or_space(),
///             token("3"),
///             if_group_fits_on_line(&amp;token(","))
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[1, 2, 3,]",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// Omits the trailing comma for the last array element if the `Group` doesn't fit on a single line
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(20).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let formatted = format!(context, [
///     group(&amp;format_args![
///         token("["),
///         soft_block_indent(&amp;format_args![
///             token("'A somewhat longer string to force a line break',"),
///             soft_line_break_or_space(),
///             token("2,"),
///             soft_line_break_or_space(),
///             token("3"),
///             if_group_fits_on_line(&amp;token(","))
///         ]),
///         token("]"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "[\n\t'A somewhat longer string to force a line break',\n\t2,\n\t3\n]",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn if_group_fits_on_line&lt;Content, Context&gt;(flat_content: &amp;Content) -&gt; IfGroupBreaks&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    IfGroupBreaks {
        mode: PrintMode::Flat,
        group_id: None,
        content: Argument::new(flat_content),
    }
}

#[derive(Copy, Clone)]
pub struct IfGroupBreaks&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    group_id: Option&lt;GroupId&gt;,
    mode: PrintMode,
}
</t>
<t tx="ekr.20231101055917.179">impl&lt;Context&gt; IfGroupBreaks&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.18">/// Mono-morphed type to format an object. Used by the [`crate::format`!], [`crate::format_args`!], and
/// [`crate::write`!] macros.
///
/// This struct is similar to a dynamic dispatch (using `dyn Format`) because it stores a pointer to the value.
/// However, it doesn't store the pointer to `dyn Format`'s vtable, instead it statically resolves the function
/// pointer of `Format::format` and stores it in `formatter`.
pub struct Argument&lt;'fmt, Context&gt; {
    /// The value to format stored as a raw pointer where `lifetime` stores the value's lifetime.
    value: *const c_void,

    /// Stores the lifetime of the value. To get the most out of our dear borrow checker.
    lifetime: PhantomData&lt;&amp;'fmt ()&gt;,

    /// The function pointer to `value`'s `Format::format` method
    formatter: fn(*const c_void, &amp;mut Formatter&lt;'_, Context&gt;) -&gt; FormatResult&lt;()&gt;,
}
</t>
<t tx="ekr.20231101055917.180">/// Inserts some content that the printer only prints if the group with the specified `group_id`
/// is printed in multiline mode. The referred group must appear before this element in the document
/// but doesn't have to one of its ancestors.
///
/// # Examples
///
/// Prints the trailing comma if the array group doesn't fit. The `group_id` is necessary
/// because `fill` creates an implicit group around each item and tries to print the item in flat mode.
/// The item `[4]` in this example fits on a single line but the trailing comma should still be printed
///
/// ```
/// use ruff_formatter::{format, format_args, write, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(20).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let formatted = format!(context, [format_with(|f| {
///     let group_id = f.group_id("array");
///
///     write!(f, [
///         group(
///             &amp;format_args![
///                 token("["),
///                 soft_block_indent(&amp;format_with(|f| {
///                     f.fill()
///                         .entry(&amp;soft_line_break_or_space(), &amp;token("1,"))
///                         .entry(&amp;soft_line_break_or_space(), &amp;token("234568789,"))
///                         .entry(&amp;soft_line_break_or_space(), &amp;token("3456789,"))
///                         .entry(&amp;soft_line_break_or_space(), &amp;format_args!(
///                             token("["),
///                             soft_block_indent(&amp;token("4")),
///                             token("]"),
///                             if_group_breaks(&amp;token(",")).with_group_id(Some(group_id))
///                         ))
///                     .finish()
///                 })),
///                 token("]")
///             ],
///         ).with_group_id(Some(group_id))
///     ])
/// })])?;
///
/// assert_eq!(
///     "[\n\t1, 234568789,\n\t3456789, [4],\n]",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[must_use]
pub fn with_group_id(mut self, group_id: Option&lt;GroupId&gt;) -&gt; Self {
    self.group_id = group_id;
    self
}
</t>
<t tx="ekr.20231101055917.181">impl&lt;Context&gt; Format&lt;Context&gt; for IfGroupBreaks&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartConditionalContent(
            Condition::new(self.mode).with_group_id(self.group_id),
        )));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndConditionalContent));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.183">impl&lt;Context&gt; std::fmt::Debug for IfGroupBreaks&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.184">fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
    let name = match self.mode {
        PrintMode::Flat =&gt; "IfGroupFitsOnLine",
        PrintMode::Expanded =&gt; "IfGroupBreaks",
    };

    f.debug_struct(name)
        .field("group_id", &amp;self.group_id)
        .field("content", &amp;"{{content}}")
        .finish()
}
</t>
<t tx="ekr.20231101055917.185">/// Increases the indent level by one if the group with the specified id breaks.
///
/// This IR has the same semantics as using [`if_group_breaks`] and [`if_group_fits_on_line`] together.
///
/// ```
/// # use ruff_formatter::prelude::*;
/// # use ruff_formatter::write;
/// # let format = format_with(|f: &amp;mut Formatter&lt;SimpleFormatContext&gt;| {
/// let id = f.group_id("head");
///
/// write!(f, [
///     group(&amp;token("Head")).with_group_id(Some(id)),
///     if_group_breaks(&amp;indent(&amp;token("indented"))).with_group_id(Some(id)),
///     if_group_fits_on_line(&amp;token("indented")).with_group_id(Some(id))
/// ])
///
/// # });
/// ```
///
/// If you want to indent some content if the enclosing group breaks, use [`indent`].
///
/// Use [`if_group_breaks`] or [`if_group_fits_on_line`] if the fitting and breaking content differs more than just the
/// indention level.
///
/// # Examples
///
/// Indent the body of an arrow function if the group wrapping the signature breaks:
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions, write};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let content = format_with(|f| {
///     let group_id = f.group_id("header");
///
///     write!(f, [
///         group(&amp;token("(aLongHeaderThatBreaksForSomeReason) =&gt;")).with_group_id(Some(group_id)),
///         indent_if_group_breaks(&amp;format_args![hard_line_break(), token("a =&gt; b")], group_id)
///     ])
/// });
///
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(20).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let formatted = format!(context, [content])?;
///
/// assert_eq!(
///     "(aLongHeaderThatBreaksForSomeReason) =&gt;\n\ta =&gt; b",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// It doesn't add an indent if the group wrapping the signature doesn't break:
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions, write};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let content = format_with(|f| {
///     let group_id = f.group_id("header");
///
///     write!(f, [
///         group(&amp;token("(aLongHeaderThatBreaksForSomeReason) =&gt;")).with_group_id(Some(group_id)),
///         indent_if_group_breaks(&amp;format_args![hard_line_break(), token("a =&gt; b")], group_id)
///     ])
/// });
///
/// let formatted = format!(SimpleFormatContext::default(), [content])?;
///
/// assert_eq!(
///     "(aLongHeaderThatBreaksForSomeReason) =&gt;\na =&gt; b",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn indent_if_group_breaks&lt;Content, Context&gt;(
    content: &amp;Content,
    group_id: GroupId,
) -&gt; IndentIfGroupBreaks&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    IndentIfGroupBreaks {
        group_id,
        content: Argument::new(content),
    }
}

#[derive(Copy, Clone)]
pub struct IndentIfGroupBreaks&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    group_id: GroupId,
}
</t>
<t tx="ekr.20231101055917.186">impl&lt;Context&gt; Format&lt;Context&gt; for IndentIfGroupBreaks&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartIndentIfGroupBreaks(self.group_id)));
        Arguments::from(&amp;self.content).fmt(f)?;
        f.write_element(FormatElement::Tag(EndIndentIfGroupBreaks));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.188">impl&lt;Context&gt; std::fmt::Debug for IndentIfGroupBreaks&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_struct("IndentIfGroupBreaks")
            .field("group_id", &amp;self.group_id)
            .field("content", &amp;"{{content}}")
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.19">impl&lt;Context&gt; Clone for Argument&lt;'_, Context&gt; {
    fn clone(&amp;self) -&gt; Self {
        *self
    }
}
</t>
<t tx="ekr.20231101055917.190">/// Changes the definition of *fits* for `content`. It measures the width of all lines and allows
/// the content inside of the [`fits_expanded`] to exceed the configured line width. The content
/// coming before and after [`fits_expanded`] must fit into the configured line width.
///
/// The [`fits_expanded`] acts as a expands boundary similar to best fitting,
/// meaning that a [`hard_line_break`] will not cause the parent group to expand.
///
/// Useful in conjunction with a group with a condition.
///
/// ## Examples
/// The outer group with the binary expression remains *flat* regardless of the array expression that
/// spans multiple lines with items exceeding the configured line width.
///
/// ```
/// # use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions, write};
/// # use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let content = format_with(|f| {
///     let group_id = f.group_id("header");
///
///     write!(f, [
///         group(&amp;format_args![
///             token("a"),
///             soft_line_break_or_space(),
///             token("+"),
///             space(),
///             fits_expanded(&amp;group(&amp;format_args![
///                 token("["),
///                 soft_block_indent(&amp;format_args![
///                     token("a,"), space(), token("# comment"), expand_parent(), soft_line_break_or_space(),
///                     token("'A very long string that exceeds the configured line width of 80 characters but the enclosing binary expression still fits.'")
///                 ]),
///                 token("]")
///             ]))
///         ]),
///     ])
/// });
///
/// let formatted = format!(SimpleFormatContext::default(), [content])?;
///
/// assert_eq!(
///     "a + [\n\ta, # comment\n\t'A very long string that exceeds the configured line width of 80 characters but the enclosing binary expression still fits.'\n]",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
pub fn fits_expanded&lt;Content, Context&gt;(content: &amp;Content) -&gt; FitsExpanded&lt;Context&gt;
where
    Content: Format&lt;Context&gt;,
{
    FitsExpanded {
        content: Argument::new(content),
        condition: None,
    }
}

#[derive(Clone)]
pub struct FitsExpanded&lt;'a, Context&gt; {
    content: Argument&lt;'a, Context&gt;,
    condition: Option&lt;Condition&gt;,
}
</t>
<t tx="ekr.20231101055917.191">impl&lt;Context&gt; FitsExpanded&lt;'_, Context&gt; {
    /// Sets a `condition` to when the content should fit in expanded mode. The content uses the regular fits
    /// definition if the `condition` is not met.
    #[must_use]
    pub fn with_condition(mut self, condition: Option&lt;Condition&gt;) -&gt; Self {
        self.condition = condition;
        self
    }
}
</t>
<t tx="ekr.20231101055917.193">impl&lt;Context&gt; Format&lt;Context&gt; for FitsExpanded&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        f.write_element(FormatElement::Tag(StartFitsExpanded(
            tag::FitsExpanded::new().with_condition(self.condition),
        )));
        f.write_fmt(Arguments::from(&amp;self.content))?;
        f.write_element(FormatElement::Tag(EndFitsExpanded));
    
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.195">/// Utility for formatting some content with an inline lambda function.
#[derive(Copy, Clone)]
pub struct FormatWith&lt;Context, T&gt; {
    formatter: T,
    context: PhantomData&lt;Context&gt;,
}
</t>
<t tx="ekr.20231101055917.196">impl&lt;Context, T&gt; Format&lt;Context&gt; for FormatWith&lt;Context, T&gt;
where
    T: Fn(&amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt;,
{
    #[inline]
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        (self.formatter)(f)
    }
}
</t>
<t tx="ekr.20231101055917.198">impl&lt;Context, T&gt; std::fmt::Debug for FormatWith&lt;Context, T&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("FormatWith").field(&amp;"{{formatter}}").finish()
    }
}
</t>
<t tx="ekr.20231101055917.2">@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.200">/// Creates an object implementing `Format` that calls the passed closure to perform the formatting.
///
/// # Examples
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{SimpleFormatContext, format, write};
/// use ruff_text_size::TextSize;
///
/// struct MyFormat {
///     items: Vec&lt;&amp;'static str&gt;,
/// }
///
/// impl Format&lt;SimpleFormatContext&gt; for MyFormat {
///     fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
///         write!(f, [
///             token("("),
///             block_indent(&amp;format_with(|f| {
///                 let separator = space();
///                 let mut join = f.join_with(&amp;separator);
///
///                 for item in &amp;self.items {
///                     join.entry(&amp;format_with(|f| write!(f, [text(item, None)])));
///                 }
///                 join.finish()
///             })),
///             token(")")
///         ])
///     }
/// }
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [MyFormat { items: vec!["a", "b", "c"]}])?;
///
/// assert_eq!("(\n\ta b c\n)", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
pub const fn format_with&lt;Context, T&gt;(formatter: T) -&gt; FormatWith&lt;Context, T&gt;
where
    T: Fn(&amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt;,
{
    FormatWith {
        formatter,
        context: PhantomData,
    }
}

/// Creates an inline `Format` object that can only be formatted once.
///
/// This can be useful in situation where the borrow checker doesn't allow you to use [`format_with`]
/// because the code formatting the content consumes the value and cloning the value is too expensive.
/// An example of this is if you want to nest a `FormatElement` or non-cloneable `Iterator` inside of a
/// `block_indent` as shown can see in the examples section.
///
/// # Panics
///
/// Panics if the object gets formatted more than once.
///
/// # Example
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{SimpleFormatContext, format, write, Buffer};
///
/// struct MyFormat;
///
/// fn generate_values() -&gt; impl Iterator&lt;Item=Token&gt; {
///     vec![token("1"), token("2"), token("3"), token("4")].into_iter()
/// }
///
/// impl Format&lt;SimpleFormatContext&gt; for MyFormat {
///     fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
///         let mut values = generate_values();
///
///         let first = values.next();
///
///         // Formats the first item outside of the block and all other items inside of the block,
///         // separated by line breaks
///         write!(f, [
///             first,
///             block_indent(&amp;format_once(|f| {
///                 // Using format_with isn't possible here because the iterator gets consumed here
///                 f.join_with(&amp;hard_line_break()).entries(values).finish()
///             })),
///         ])
///     }
/// }
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [MyFormat])?;
///
/// assert_eq!("1\n\t2\n\t3\n\t4\n", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
///
/// Formatting the same value twice results in a panic.
///
/// ```should_panic
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{SimpleFormatContext, format, write, Buffer};
/// use ruff_text_size::TextSize;
///
/// let mut count = 0;
///
/// let value = format_once(|f| {
///     write!(f, [text(&amp;std::format!("Formatted {count}."), None)])
/// });
///
/// format!(SimpleFormatContext::default(), [value]).expect("Formatting once works fine");
///
/// // Formatting the value more than once panics
/// format!(SimpleFormatContext::default(), [value]);
/// ```
pub const fn format_once&lt;T, Context&gt;(formatter: T) -&gt; FormatOnce&lt;T, Context&gt;
where
    T: FnOnce(&amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt;,
{
    FormatOnce {
        formatter: Cell::new(Some(formatter)),
        context: PhantomData,
    }
}

pub struct FormatOnce&lt;T, Context&gt; {
    formatter: Cell&lt;Option&lt;T&gt;&gt;,
    context: PhantomData&lt;Context&gt;,
}
</t>
<t tx="ekr.20231101055917.201">impl&lt;T, Context&gt; Format&lt;Context&gt; for FormatOnce&lt;T, Context&gt;
where
    T: FnOnce(&amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt;,
{
    #[inline]
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        let formatter = self.formatter.take().expect("Tried to format a `format_once` at least twice. This is not allowed. You may want to use `format_with` or `format.memoized` instead.");
    
        (formatter)(f)
    }
}
</t>
<t tx="ekr.20231101055917.203">impl&lt;T, Context&gt; std::fmt::Debug for FormatOnce&lt;T, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("FormatOnce").field(&amp;"{{formatter}}").finish()
    }
}
</t>
<t tx="ekr.20231101055917.205">/// Builder to join together a sequence of content.
/// See [`Formatter::join`]
#[must_use = "must eventually call `finish()` on Format builders"]
pub struct JoinBuilder&lt;'fmt, 'buf, Separator, Context&gt; {
    result: FormatResult&lt;()&gt;,
    fmt: &amp;'fmt mut Formatter&lt;'buf, Context&gt;,
    with: Option&lt;Separator&gt;,
    has_elements: bool,
}
</t>
<t tx="ekr.20231101055917.206">impl&lt;'fmt, 'buf, Separator, Context&gt; JoinBuilder&lt;'fmt, 'buf, Separator, Context&gt;
where
    Separator: Format&lt;Context&gt;,
{
    @others
}
</t>
<t tx="ekr.20231101055917.207">/// Creates a new instance that joins the elements without a separator
pub(super) fn new(fmt: &amp;'fmt mut Formatter&lt;'buf, Context&gt;) -&gt; Self {
    Self {
        result: Ok(()),
        fmt,
        has_elements: false,
        with: None,
    }
}

/// Creates a new instance that prints the passed separator between every two entries.
pub(super) fn with_separator(fmt: &amp;'fmt mut Formatter&lt;'buf, Context&gt;, with: Separator) -&gt; Self {
    Self {
        result: Ok(()),
        fmt,
        has_elements: false,
        with: Some(with),
    }
}

/// Adds a new entry to the join output.
pub fn entry(&amp;mut self, entry: &amp;dyn Format&lt;Context&gt;) -&gt; &amp;mut Self {
    self.result = self.result.and_then(|()| {
        if let Some(with) = &amp;self.with {
            if self.has_elements {
                with.fmt(self.fmt)?;
            }
        }
        self.has_elements = true;

        entry.fmt(self.fmt)
    });

    self
}
</t>
<t tx="ekr.20231101055917.208">/// Adds the contents of an iterator of entries to the join output.
pub fn entries&lt;F, I&gt;(&amp;mut self, entries: I) -&gt; &amp;mut Self
where
    F: Format&lt;Context&gt;,
    I: IntoIterator&lt;Item = F&gt;,
{
    for entry in entries {
        self.entry(&amp;entry);
    }

    self
}

/// Finishes the output and returns any error encountered.
pub fn finish(&amp;mut self) -&gt; FormatResult&lt;()&gt; {
    self.result
}
</t>
<t tx="ekr.20231101055917.209">/// Builder to fill as many elements as possible on a single line.
#[must_use = "must eventually call `finish()` on Format builders"]
pub struct FillBuilder&lt;'fmt, 'buf, Context&gt; {
    result: FormatResult&lt;()&gt;,
    fmt: &amp;'fmt mut Formatter&lt;'buf, Context&gt;,
    empty: bool,
}
</t>
<t tx="ekr.20231101055917.21">impl&lt;Context&gt; Copy for Argument&lt;'_, Context&gt; {}

impl&lt;'fmt, Context&gt; Argument&lt;'fmt, Context&gt; {
    /// Called by the [ruff_formatter::format_args] macro. Creates a mono-morphed value for formatting
    /// an object.
    #[doc(hidden)]
    #[inline]
    pub fn new&lt;F: Format&lt;Context&gt;&gt;(value: &amp;'fmt F) -&gt; Self {
        #[inline]
        fn formatter&lt;F: Format&lt;Context&gt;, Context&gt;(
            ptr: *const c_void,
            fmt: &amp;mut Formatter&lt;Context&gt;,
        ) -&gt; FormatResult&lt;()&gt; {
            // SAFETY: Safe because the 'fmt lifetime is captured by the 'lifetime' field.
            #[allow(unsafe_code)]
            F::fmt(unsafe { &amp;*ptr.cast::&lt;F&gt;() }, fmt)
        }

        Self {
            value: (value as *const F).cast::&lt;std::ffi::c_void&gt;(),
            lifetime: PhantomData,
            formatter: formatter::&lt;F, Context&gt;,
        }
    }

    /// Formats the value stored by this argument using the given formatter.
    #[inline]
    pub(super) fn format(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        (self.formatter)(self.value, f)
    }
}
</t>
<t tx="ekr.20231101055917.210">impl&lt;'a, 'buf, Context&gt; FillBuilder&lt;'a, 'buf, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.211">pub(crate) fn new(fmt: &amp;'a mut Formatter&lt;'buf, Context&gt;) -&gt; Self {
    fmt.write_element(FormatElement::Tag(StartFill));

    Self {
        result: Ok(()),
        fmt,
        empty: true,
    }
}

/// Adds an iterator of entries to the fill output. Uses the passed `separator` to separate any two items.
pub fn entries&lt;F, I&gt;(&amp;mut self, separator: &amp;dyn Format&lt;Context&gt;, entries: I) -&gt; &amp;mut Self
where
    F: Format&lt;Context&gt;,
    I: IntoIterator&lt;Item = F&gt;,
{
    for entry in entries {
        self.entry(separator, &amp;entry);
    }

    self
}

/// Adds a new entry to the fill output. The `separator` isn't written if this is the first element in the list.
pub fn entry(
    &amp;mut self,
    separator: &amp;dyn Format&lt;Context&gt;,
    entry: &amp;dyn Format&lt;Context&gt;,
) -&gt; &amp;mut Self {
    self.result = self.result.and_then(|()| {
        if self.empty {
            self.empty = false;
        } else {
            self.fmt.write_element(FormatElement::Tag(StartEntry));
            separator.fmt(self.fmt)?;
            self.fmt.write_element(FormatElement::Tag(EndEntry));
        }

        self.fmt.write_element(FormatElement::Tag(StartEntry));
        entry.fmt(self.fmt)?;
        self.fmt.write_element(FormatElement::Tag(EndEntry));
        Ok(())
    });

    self
}
</t>
<t tx="ekr.20231101055917.212">/// Finishes the output and returns any error encountered
pub fn finish(&amp;mut self) -&gt; FormatResult&lt;()&gt; {
    if self.result.is_ok() {
        self.fmt.write_element(FormatElement::Tag(EndFill));
    }
    self.result
}
</t>
<t tx="ekr.20231101055917.213">/// The first variant is the most flat, and the last is the most expanded variant.
/// See [`best_fitting!`] macro for a more in-detail documentation
#[derive(Copy, Clone)]
pub struct BestFitting&lt;'a, Context&gt; {
    variants: Arguments&lt;'a, Context&gt;,
    mode: BestFittingMode,
}
</t>
<t tx="ekr.20231101055917.214">impl&lt;'a, Context&gt; BestFitting&lt;'a, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.215">/// Creates a new best fitting IR with the given variants. The method itself isn't unsafe
/// but it is to discourage people from using it because the printer will panic if
/// the slice doesn't contain at least the least and most expanded variants.
///
/// You're looking for a way to create a `BestFitting` object, use the `best_fitting![least_expanded, most_expanded]` macro.
///
/// ## Safety

/// The slice must contain at least two variants.
#[allow(unsafe_code)]
pub unsafe fn from_arguments_unchecked(variants: Arguments&lt;'a, Context&gt;) -&gt; Self {
    assert!(
        variants.0.len() &gt;= 2,
        "Requires at least the least expanded and most expanded variants"
    );

    Self {
        variants,
        mode: BestFittingMode::default(),
    }
}

/// Changes the mode used by this best fitting element to determine whether a variant fits.
///
/// ## Examples
///
/// ### All Lines
///
/// ```
/// use ruff_formatter::{Formatted, LineWidth, format, format_args, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(
///     SimpleFormatContext::default(),
///     [
///         best_fitting!(
///             // Everything fits on a single line
///             format_args!(
///                 group(&amp;format_args![
///                     token("["),
///                         soft_block_indent(&amp;format_args![
///                         token("1,"),
///                         soft_line_break_or_space(),
///                         token("2,"),
///                         soft_line_break_or_space(),
///                         token("3"),
///                     ]),
///                     token("]")
///                 ]),
///                 space(),
///                 token("+"),
///                 space(),
///                 token("aVeryLongIdentifier")
///             ),
///
///             // Breaks after `[` and prints each elements on a single line
///             // The group is necessary because the variant, by default is printed in flat mode and a
///             // hard line break indicates that the content doesn't fit.
///             format_args!(
///                 token("["),
///                 group(&amp;block_indent(&amp;format_args![token("1,"), hard_line_break(), token("2,"), hard_line_break(), token("3")])).should_expand(true),
///                 token("]"),
///                 space(),
///                 token("+"),
///                 space(),
///                 token("aVeryLongIdentifier")
///             ),
///
///             // Adds parentheses and indents the body, breaks after the operator
///             format_args!(
///                 token("("),
///                 block_indent(&amp;format_args![
///                     token("["),
///                     block_indent(&amp;format_args![
///                         token("1,"),
///                         hard_line_break(),
///                         token("2,"),
///                         hard_line_break(),
///                         token("3"),
///                     ]),
///                     token("]"),
///                     hard_line_break(),
///                     token("+"),
///                     space(),
///                     token("aVeryLongIdentifier")
///                 ]),
///                 token(")")
///             )
///         ).with_mode(BestFittingMode::AllLines)
///     ]
/// )?;
///
/// let document = formatted.into_document();
///
/// // Takes the first variant if everything fits on a single line
/// assert_eq!(
///     "[1, 2, 3] + aVeryLongIdentifier",
///     Formatted::new(document.clone(), SimpleFormatContext::default())
///         .print()?
///         .as_code()
/// );
///
/// // It takes the second if the first variant doesn't fit on a single line. The second variant
/// // has some additional line breaks to make sure inner groups don't break
/// assert_eq!(
///     "[\n\t1,\n\t2,\n\t3\n] + aVeryLongIdentifier",
///     Formatted::new(document.clone(), SimpleFormatContext::new(SimpleFormatOptions { line_width: 23.try_into().unwrap(), ..SimpleFormatOptions::default() }))
///         .print()?
///         .as_code()
/// );
///
/// // Prints the last option as last resort
/// assert_eq!(
///     "(\n\t[\n\t\t1,\n\t\t2,\n\t\t3\n\t]\n\t+ aVeryLongIdentifier\n)",
///     Formatted::new(document.clone(), SimpleFormatContext::new(SimpleFormatOptions { line_width: 22.try_into().unwrap(), ..SimpleFormatOptions::default() }))
///         .print()?
///         .as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[must_use]
pub fn with_mode(mut self, mode: BestFittingMode) -&gt; Self {
    self.mode = mode;
    self
}
</t>
<t tx="ekr.20231101055917.216">impl&lt;Context&gt; Format&lt;Context&gt; for BestFitting&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.217">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    let variants = self.variants.items();

    let mut buffer = VecBuffer::with_capacity(variants.len() * 8, f.state_mut());

    for variant in variants {
        buffer.write_element(FormatElement::Tag(StartBestFittingEntry));
        buffer.write_fmt(Arguments::from(variant))?;
        buffer.write_element(FormatElement::Tag(EndBestFittingEntry));
    }

    // SAFETY: The constructor guarantees that there are always at least two variants. It's, therefore,
    // safe to call into the unsafe `from_vec_unchecked` function
    #[allow(unsafe_code)]
    let element = unsafe {
        FormatElement::BestFitting {
            variants: BestFittingVariants::from_vec_unchecked(buffer.into_vec()),
            mode: self.mode,
        }
    };

    f.write_element(element);

    Ok(())
}
</t>
<t tx="ekr.20231101055917.218">use crate::prelude::TagKind;
use crate::GroupId;
use ruff_text_size::TextRange;
use std::error::Error;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.219">#[derive(Debug, PartialEq, Eq, Copy, Clone)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
/// Series of errors encountered during formatting
pub enum FormatError {
    /// In case a node can't be formatted because it either misses a require child element or
    /// a child is present that should not (e.g. a trailing comma after a rest element).
    SyntaxError { message: &amp;'static str },
    /// In case range formatting failed because the provided range was larger
    /// than the formatted syntax tree
    RangeError { input: TextRange, tree: TextRange },

    /// In case printing the document failed because it has an invalid structure.
    InvalidDocument(InvalidDocumentError),

    /// Formatting failed because some content encountered a situation where a layout
    /// choice by an enclosing [crate::Format] resulted in a poor layout for a child [crate::Format].
    ///
    /// It's up to an enclosing [crate::Format] to handle the error and pick another layout.
    /// This error should not be raised if there's no outer [crate::Format] handling the poor layout error,
    /// avoiding that formatting of the whole document fails.
    PoorLayout,
}

impl std::fmt::Display for FormatError {
    @others
}
</t>
<t tx="ekr.20231101055917.22">/// Sequence of objects that should be formatted in the specified order.
///
/// The [`format_args!`] macro will safely create an instance of this structure.
///
/// You can use the `Arguments&lt;a&gt;` that [`format_args!`] return in `Format` context as seen below.
/// It will call the `format` function for each of its objects.
///
/// ```rust
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, format_args};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [
///     format_args!(token("a"), space(), token("b"))
/// ])?;
///
/// assert_eq!("a b", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
pub struct Arguments&lt;'fmt, Context&gt;(pub &amp;'fmt [Argument&lt;'fmt, Context&gt;]);

impl&lt;'fmt, Context&gt; Arguments&lt;'fmt, Context&gt; {
    #[doc(hidden)]
    #[inline]
    pub fn new(arguments: &amp;'fmt [Argument&lt;'fmt, Context&gt;]) -&gt; Self {
        Self(arguments)
    }
    /// Returns the arguments
    #[inline]
    #[allow(clippy::trivially_copy_pass_by_ref)] // Bug in Clippy? Sizeof Arguments is 16
    pub(super) fn items(&amp;self) -&gt; &amp;'fmt [Argument&lt;'fmt, Context&gt;] {
        self.0
    }
}
</t>
<t tx="ekr.20231101055917.220">fn fmt(&amp;self, fmt: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
    match self {
        FormatError::SyntaxError {message} =&gt; {
            std::write!(fmt, "syntax error: {message}")
        },
        FormatError::RangeError { input, tree } =&gt; std::write!(
            fmt,
            "formatting range {input:?} is larger than syntax tree {tree:?}"
        ),
        FormatError::InvalidDocument(error) =&gt; std::write!(fmt, "Invalid document: {error}\n\n This is an internal Rome error. Please report if necessary."),
        FormatError::PoorLayout =&gt; {
            std::write!(fmt, "Poor layout: The formatter wasn't able to pick a good layout for your document. This is an internal Rome error. Please report if necessary.")
        }
    }
}
</t>
<t tx="ekr.20231101055917.221">impl Error for FormatError {}

impl From&lt;PrintError&gt; for FormatError {
    fn from(error: PrintError) -&gt; Self {
        FormatError::from(&amp;error)
    }
}
</t>
<t tx="ekr.20231101055917.223">impl From&lt;&amp;PrintError&gt; for FormatError {
    fn from(error: &amp;PrintError) -&gt; Self {
        match error {
            PrintError::InvalidDocument(reason) =&gt; FormatError::InvalidDocument(*reason),
        }
    }
}
</t>
<t tx="ekr.20231101055917.225">impl FormatError {
    pub fn syntax_error(message: &amp;'static str) -&gt; Self {
        Self::SyntaxError { message }
    }
}
</t>
<t tx="ekr.20231101055917.227">#[derive(Debug, Copy, Clone, Eq, PartialEq)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub enum InvalidDocumentError {
    /// Mismatching start/end kinds
    ///
    /// ```plain
    /// StartIndent
    /// ...
    /// EndGroup
    /// ```
    StartEndTagMismatch {
        start_kind: TagKind,
        end_kind: TagKind,
    },

    /// End tag without a corresponding start tag.
    ///
    /// ```plain
    /// Text
    /// EndGroup
    /// ```
    StartTagMissing {
        kind: TagKind,
    },

    /// Expected a specific start tag but instead is:
    /// - at the end of the document
    /// - at another start tag
    /// - at an end tag
    ExpectedStart {
        expected_start: TagKind,
        actual: ActualStart,
    },

    UnknownGroupId {
        group_id: GroupId,
    },
}

#[derive(Debug, Copy, Clone, Eq, PartialEq)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub enum ActualStart {
    /// The actual element is not a tag.
    Content,

    /// The actual element was a start tag of another kind.
    Start(TagKind),

    /// The actual element is an end tag instead of a start tag.
    End(TagKind),

    /// Reached the end of the document
    EndOfDocument,
}

impl std::fmt::Display for InvalidDocumentError {
    @others
}
</t>
<t tx="ekr.20231101055917.228">fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
    match self {
        InvalidDocumentError::StartEndTagMismatch {
            start_kind,
            end_kind,
        } =&gt; {
            std::write!(
                f,
                "Expected end tag of kind {start_kind:?} but found {end_kind:?}."
            )
        }
        InvalidDocumentError::StartTagMissing { kind } =&gt; {
            std::write!(f, "End tag of kind {kind:?} without matching start tag.")
        }
        InvalidDocumentError::ExpectedStart {
            expected_start,
            actual,
        } =&gt; {
            match actual {
                ActualStart::EndOfDocument =&gt; {
                    std::write!(f, "Expected start tag of kind {expected_start:?} but at the end of document.")
                }
                ActualStart::Start(start) =&gt; {
                    std::write!(f, "Expected start tag of kind {expected_start:?} but found start tag of kind {start:?}.")
                }
                ActualStart::End(end) =&gt; {
                    std::write!(f, "Expected start tag of kind {expected_start:?} but found end tag of kind {end:?}.")
                }
                ActualStart::Content =&gt; {
                    std::write!(f, "Expected start tag of kind {expected_start:?} but found non-tag element.")
                }
            }
        }
        InvalidDocumentError::UnknownGroupId { group_id } =&gt; {
            std::write!(f, "Encountered unknown group id {group_id:?}. Ensure that the group with the id {group_id:?} exists and that the group is a parent of or comes before the element referring to it.")
        }
    }
}
</t>
<t tx="ekr.20231101055917.229">#[derive(Debug, Clone, Eq, PartialEq)]
pub enum PrintError {
    InvalidDocument(InvalidDocumentError),
}

impl Error for PrintError {}

impl std::fmt::Display for PrintError {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        match self {
            PrintError::InvalidDocument(inner) =&gt; {
                std::write!(f, "Invalid document: {inner}")
            }
        }
    }
}
</t>
<t tx="ekr.20231101055917.231">@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.232">pub mod document;
pub mod tag;

use std::borrow::Cow;
use std::hash::{Hash, Hasher};
use std::iter::FusedIterator;
use std::num::NonZeroU32;
use std::ops::Deref;
use std::rc::Rc;
use unicode_width::UnicodeWidthChar;

use crate::format_element::tag::{GroupMode, LabelId, Tag};
use crate::source_code::SourceCodeSlice;
use crate::{IndentWidth, TagKind};
use ruff_text_size::TextSize;

/// Language agnostic IR for formatting source code.
///
/// Use the helper functions like [`crate::builders::space`], [`crate::builders::soft_line_break`] etc. defined in this file to create elements.
#[derive(Clone, Eq, PartialEq)]
pub enum FormatElement {
    /// A space token, see [crate::builders::space] for documentation.
    Space,

    /// A new line, see [crate::builders::soft_line_break], [crate::builders::hard_line_break], and [crate::builders::soft_line_break_or_space] for documentation.
    Line(LineMode),

    /// Forces the parent group to print in expanded mode.
    ExpandParent,

    /// Indicates the position of the elements coming after this element in the source document.
    /// The printer will create a source map entry from this position in the source document to the
    /// formatted position.
    SourcePosition(TextSize),

    /// A ASCII only Token that contains no line breaks or tab characters.
    Token { text: &amp;'static str },

    /// An arbitrary text that can contain tabs, newlines, and unicode characters.
    Text {
        /// There's no need for the text to be mutable, using `Box&lt;str&gt;` safes 8 bytes over `String`.
        text: Box&lt;str&gt;,
        text_width: TextWidth,
    },

    /// Text that gets emitted as it is in the source code. Optimized to avoid any allocations.
    SourceCodeSlice {
        slice: SourceCodeSlice,
        text_width: TextWidth,
    },

    /// Prevents that line suffixes move past this boundary. Forces the printer to print any pending
    /// line suffixes, potentially by inserting a hard line break.
    LineSuffixBoundary,

    /// An interned format element. Useful when the same content must be emitted multiple times to avoid
    /// deep cloning the IR when using the `best_fitting!` macro or `if_group_fits_on_line` and `if_group_breaks`.
    Interned(Interned),

    /// A list of different variants representing the same content. The printer picks the best fitting content.
    /// Line breaks inside of a best fitting don't propagate to parent groups.
    BestFitting {
        variants: BestFittingVariants,
        mode: BestFittingMode,
    },

    /// A [Tag] that marks the start/end of some content to which some special formatting is applied.
    Tag(Tag),
}

impl FormatElement {
    pub fn tag_kind(&amp;self) -&gt; Option&lt;TagKind&gt; {
        if let FormatElement::Tag(tag) = self {
            Some(tag.kind())
        } else {
            None
        }
    }
}
</t>
<t tx="ekr.20231101055917.234">impl std::fmt::Debug for FormatElement {
    @others
}
</t>
<t tx="ekr.20231101055917.235">fn fmt(&amp;self, fmt: &amp;mut std::fmt::Formatter) -&gt; std::fmt::Result {
    match self {
        FormatElement::Space =&gt; write!(fmt, "Space"),
        FormatElement::Line(mode) =&gt; fmt.debug_tuple("Line").field(mode).finish(),
        FormatElement::ExpandParent =&gt; write!(fmt, "ExpandParent"),
        FormatElement::Token { text } =&gt; fmt.debug_tuple("Token").field(text).finish(),
        FormatElement::Text { text, .. } =&gt; fmt.debug_tuple("DynamicText").field(text).finish(),
        FormatElement::SourceCodeSlice { slice, text_width } =&gt; fmt
            .debug_tuple("Text")
            .field(slice)
            .field(text_width)
            .finish(),
        FormatElement::LineSuffixBoundary =&gt; write!(fmt, "LineSuffixBoundary"),
        FormatElement::BestFitting { variants, mode } =&gt; fmt
            .debug_struct("BestFitting")
            .field("variants", variants)
            .field("mode", &amp;mode)
            .finish(),
        FormatElement::Interned(interned) =&gt; fmt.debug_list().entries(&amp;**interned).finish(),
        FormatElement::Tag(tag) =&gt; fmt.debug_tuple("Tag").field(tag).finish(),
        FormatElement::SourcePosition(position) =&gt; {
            fmt.debug_tuple("SourcePosition").field(position).finish()
        }
    }
}
</t>
<t tx="ekr.20231101055917.236">#[derive(Debug, Clone, Copy, Eq, PartialEq)]
pub enum LineMode {
    /// See [crate::builders::soft_line_break_or_space] for documentation.
    SoftOrSpace,
    /// See [crate::builders::soft_line_break] for documentation.
    Soft,
    /// See [crate::builders::hard_line_break] for documentation.
    Hard,
    /// See [crate::builders::empty_line] for documentation.
    Empty,
}

impl LineMode {
    pub const fn is_hard(&amp;self) -&gt; bool {
        matches!(self, LineMode::Hard)
    }
}
</t>
<t tx="ekr.20231101055917.237">#[derive(Debug, Clone, Copy, Eq, PartialEq)]
pub enum PrintMode {
    /// Omits any soft line breaks
    Flat,
    /// Prints soft line breaks as line breaks
    Expanded,
}

impl PrintMode {
    pub const fn is_flat(&amp;self) -&gt; bool {
        matches!(self, PrintMode::Flat)
    }

    pub const fn is_expanded(&amp;self) -&gt; bool {
        matches!(self, PrintMode::Expanded)
    }
}
</t>
<t tx="ekr.20231101055917.238">impl From&lt;GroupMode&gt; for PrintMode {
    fn from(value: GroupMode) -&gt; Self {
        match value {
            GroupMode::Flat =&gt; PrintMode::Flat,
            GroupMode::Expand | GroupMode::Propagated =&gt; PrintMode::Expanded,
        }
    }
}
</t>
<t tx="ekr.20231101055917.24">impl&lt;Context&gt; Copy for Arguments&lt;'_, Context&gt; {}

impl&lt;Context&gt; Clone for Arguments&lt;'_, Context&gt; {
    fn clone(&amp;self) -&gt; Self {
        *self
    }
}
</t>
<t tx="ekr.20231101055917.240">#[derive(Clone)]
pub struct Interned(Rc&lt;[FormatElement]&gt;);

impl Interned {
    pub(super) fn new(content: Vec&lt;FormatElement&gt;) -&gt; Self {
        Self(content.into())
    }
}
</t>
<t tx="ekr.20231101055917.241">impl PartialEq for Interned {
    fn eq(&amp;self, other: &amp;Interned) -&gt; bool {
        Rc::ptr_eq(&amp;self.0, &amp;other.0)
    }
}
</t>
<t tx="ekr.20231101055917.243">impl Eq for Interned {}

impl Hash for Interned {
    fn hash&lt;H&gt;(&amp;self, hasher: &amp;mut H)
    where
        H: Hasher,
    {
        Rc::as_ptr(&amp;self.0).hash(hasher);
    }
}
</t>
<t tx="ekr.20231101055917.244">impl std::fmt::Debug for Interned {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        self.0.fmt(f)
    }
}
</t>
<t tx="ekr.20231101055917.246">impl Deref for Interned {
    type Target = [FormatElement];
    
    fn deref(&amp;self) -&gt; &amp;Self::Target {
        &amp;self.0
    }
}
</t>
<t tx="ekr.20231101055917.248">const LINE_SEPARATOR: char = '\u{2028}';
const PARAGRAPH_SEPARATOR: char = '\u{2029}';
pub const LINE_TERMINATORS: [char; 3] = ['\r', LINE_SEPARATOR, PARAGRAPH_SEPARATOR];

/// Replace the line terminators matching the provided list with "\n"
/// since its the only line break type supported by the printer
pub fn normalize_newlines&lt;const N: usize&gt;(text: &amp;str, terminators: [char; N]) -&gt; Cow&lt;str&gt; {
    let mut result = String::new();
    let mut last_end = 0;

    for (start, part) in text.match_indices(terminators) {
        result.push_str(&amp;text[last_end..start]);
        result.push('\n');

        last_end = start + part.len();
        // If the current character is \r and the
        // next is \n, skip over the entire sequence
        if part == "\r" &amp;&amp; text[last_end..].starts_with('\n') {
            last_end += 1;
        }
    }

    // If the result is empty no line terminators were matched,
    // return the entire input text without allocating a new String
    if result.is_empty() {
        Cow::Borrowed(text)
    } else {
        result.push_str(&amp;text[last_end..text.len()]);
        Cow::Owned(result)
    }
}

impl FormatElement {
    /// Returns `true` if self is a [`FormatElement::Tag`]
    pub const fn is_tag(&amp;self) -&gt; bool {
        matches!(self, FormatElement::Tag(_))
    }

    /// Returns `true` if self is a [`FormatElement::Tag`] and [`Tag::is_start`] is `true`.
    pub const fn is_start_tag(&amp;self) -&gt; bool {
        match self {
            FormatElement::Tag(tag) =&gt; tag.is_start(),
            _ =&gt; false,
        }
    }

    /// Returns `true` if self is a [`FormatElement::Tag`] and [`Tag::is_end`] is `true`.
    pub const fn is_end_tag(&amp;self) -&gt; bool {
        match self {
            FormatElement::Tag(tag) =&gt; tag.is_end(),
            _ =&gt; false,
        }
    }

    pub const fn is_text(&amp;self) -&gt; bool {
        matches!(
            self,
            FormatElement::SourceCodeSlice { .. }
                | FormatElement::Text { .. }
                | FormatElement::Token { .. }
        )
    }

    pub const fn is_space(&amp;self) -&gt; bool {
        matches!(self, FormatElement::Space)
    }
}
</t>
<t tx="ekr.20231101055917.249">impl FormatElements for FormatElement {
    @others
}
</t>
<t tx="ekr.20231101055917.250">fn will_break(&amp;self) -&gt; bool {
    match self {
        FormatElement::ExpandParent =&gt; true,
        FormatElement::Tag(Tag::StartGroup(group)) =&gt; !group.mode().is_flat(),
        FormatElement::Line(line_mode) =&gt; matches!(line_mode, LineMode::Hard | LineMode::Empty),
        FormatElement::Text { text_width, .. } =&gt; text_width.is_multiline(),
        FormatElement::SourceCodeSlice { text_width, .. } =&gt; text_width.is_multiline(),
        FormatElement::Interned(interned) =&gt; interned.will_break(),
        // Traverse into the most flat version because the content is guaranteed to expand when even
        // the most flat version contains some content that forces a break.
        FormatElement::BestFitting {
            variants: best_fitting,
            ..
        } =&gt; best_fitting.most_flat().will_break(),
        FormatElement::LineSuffixBoundary
        | FormatElement::Space
        | FormatElement::Tag(_)
        | FormatElement::Token { .. }
        | FormatElement::SourcePosition(_) =&gt; false,
    }
}
</t>
<t tx="ekr.20231101055917.251">fn has_label(&amp;self, label_id: LabelId) -&gt; bool {
    match self {
        FormatElement::Tag(Tag::StartLabelled(actual)) =&gt; *actual == label_id,
        FormatElement::Interned(interned) =&gt; interned.deref().has_label(label_id),
        _ =&gt; false,
    }
}
</t>
<t tx="ekr.20231101055917.252">fn start_tag(&amp;self, _: TagKind) -&gt; Option&lt;&amp;Tag&gt; {
    None
}
</t>
<t tx="ekr.20231101055917.253">fn end_tag(&amp;self, kind: TagKind) -&gt; Option&lt;&amp;Tag&gt; {
    match self {
        FormatElement::Tag(tag) if tag.kind() == kind &amp;&amp; tag.is_end() =&gt; Some(tag),
        _ =&gt; None,
    }
}
</t>
<t tx="ekr.20231101055917.254">/// Mode used to determine if any variant (except the most expanded) fits for [`BestFittingVariants`].
#[repr(u8)]
#[derive(Copy, Clone, Debug, Eq, PartialEq, Default)]
pub enum BestFittingMode {
    /// The variant fits if the content up to the first hard or a soft line break inside a [`Group`] with
    /// [`PrintMode::Expanded`] fits on the line. The default mode.
    ///
    /// [`Group`]: tag::Group
    #[default]
    FirstLine,

    /// A variant fits if all lines fit into the configured print width. A line ends if by any
    /// hard or a soft line break inside a [`Group`] with [`PrintMode::Expanded`].
    /// The content doesn't fit if there's any hard line break  outside a [`Group`] with [`PrintMode::Expanded`]
    /// (a hard line break in content that should be considered in [`PrintMode::Flat`].
    ///
    /// Use this mode with caution as it requires measuring all content of the variant which is more
    /// expensive than using [`BestFittingMode::FirstLine`].
    ///
    /// [`Group`]: tag::Group
    AllLines,
}

/// The different variants for this element.
/// The first element is the one that takes up the most space horizontally (the most flat),
/// The last element takes up the least space horizontally (but most horizontal space).
#[derive(Clone, Eq, PartialEq, Debug)]
pub struct BestFittingVariants(Box&lt;[FormatElement]&gt;);

impl BestFittingVariants {
    @others
}
</t>
<t tx="ekr.20231101055917.255">/// Creates a new best fitting IR with the given variants. The method itself isn't unsafe
/// but it is to discourage people from using it because the printer will panic if
/// the slice doesn't contain at least the least and most expanded variants.
///
/// You're looking for a way to create a `BestFitting` object, use the `best_fitting![least_expanded, most_expanded]` macro.
///
/// ## Safety
/// The slice must contain at least two variants.
#[doc(hidden)]
#[allow(unsafe_code)]
pub unsafe fn from_vec_unchecked(variants: Vec&lt;FormatElement&gt;) -&gt; Self {
    debug_assert!(
        variants
            .iter()
            .filter(|element| matches!(element, FormatElement::Tag(Tag::StartBestFittingEntry)))
            .count()
            &gt;= 2,
        "Requires at least the least expanded and most expanded variants"
    );

    Self(variants.into_boxed_slice())
}

/// Returns the most expanded variant
pub fn most_expanded(&amp;self) -&gt; &amp;[FormatElement] {
    self.into_iter().last().unwrap()
}
</t>
<t tx="ekr.20231101055917.256">pub fn as_slice(&amp;self) -&gt; &amp;[FormatElement] {
    &amp;self.0
}
</t>
<t tx="ekr.20231101055917.257">/// Returns the least expanded variant
pub fn most_flat(&amp;self) -&gt; &amp;[FormatElement] {
    self.into_iter().next().unwrap()
}
</t>
<t tx="ekr.20231101055917.258">impl Deref for BestFittingVariants {
    type Target = [FormatElement];
    
    fn deref(&amp;self) -&gt; &amp;Self::Target {
        self.as_slice()
    }
}
</t>
<t tx="ekr.20231101055917.26">impl&lt;Context&gt; Format&lt;Context&gt; for Arguments&lt;'_, Context&gt; {
    #[inline]
    fn fmt(&amp;self, formatter: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        formatter.write_fmt(*self)
    }
}
</t>
<t tx="ekr.20231101055917.260">pub struct BestFittingVariantsIter&lt;'a&gt; {
    elements: &amp;'a [FormatElement],
}
</t>
<t tx="ekr.20231101055917.261">impl&lt;'a&gt; IntoIterator for &amp;'a BestFittingVariants {
    type Item = &amp;'a [FormatElement];
    type IntoIter = BestFittingVariantsIter&lt;'a&gt;;
    
    fn into_iter(self) -&gt; Self::IntoIter {
        BestFittingVariantsIter { elements: &amp;self.0 }
    }
}
</t>
<t tx="ekr.20231101055917.263">impl&lt;'a&gt; Iterator for BestFittingVariantsIter&lt;'a&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.264">type Item = &amp;'a [FormatElement];

fn next(&amp;mut self) -&gt; Option&lt;Self::Item&gt; {
    match self.elements.first()? {
        FormatElement::Tag(Tag::StartBestFittingEntry) =&gt; {
            let end = self
                .elements
                .iter()
                .position(|element| {
                    matches!(element, FormatElement::Tag(Tag::EndBestFittingEntry))
                })
                .map_or(self.elements.len(), |position| position + 1);

            let (variant, rest) = self.elements.split_at(end);
            self.elements = rest;

            Some(variant)
        }
        _ =&gt; None,
    }
}
</t>
<t tx="ekr.20231101055917.265">fn last(mut self) -&gt; Option&lt;Self::Item&gt;
where
    Self: Sized,
{
    self.next_back()
}
</t>
<t tx="ekr.20231101055917.266">impl&lt;'a&gt; DoubleEndedIterator for BestFittingVariantsIter&lt;'a&gt; {
    fn next_back(&amp;mut self) -&gt; Option&lt;Self::Item&gt; {
        let start_position = self.elements.iter().rposition(|element| {
            matches!(element, FormatElement::Tag(Tag::StartBestFittingEntry))
        })?;
    
        let (rest, variant) = self.elements.split_at(start_position);
        self.elements = rest;
        Some(variant)
    }
}
</t>
<t tx="ekr.20231101055917.268">impl FusedIterator for BestFittingVariantsIter&lt;'_&gt; {}

pub trait FormatElements {
    /// Returns true if this [`FormatElement`] is guaranteed to break across multiple lines by the printer.
    /// This is the case if this format element recursively contains a:
    /// - [`crate::builders::empty_line`] or [`crate::builders::hard_line_break`]
    /// - A token containing '\n'
    ///
    /// Use this with caution, this is only a heuristic and the printer may print the element over multiple
    /// lines if this element is part of a group and the group doesn't fit on a single line.
    fn will_break(&amp;self) -&gt; bool;

    /// Returns true if the element has the given label.
    fn has_label(&amp;self, label: LabelId) -&gt; bool;

    /// Returns the start tag of `kind` if:
    /// - the last element is an end tag of `kind`.
    /// - there's a matching start tag in this document (may not be true if this slice is an interned element and the `start` is in the document storing the interned element).
    fn start_tag(&amp;self, kind: TagKind) -&gt; Option&lt;&amp;Tag&gt;;

    /// Returns the end tag if:
    /// - the last element is an end tag of `kind`
    fn end_tag(&amp;self, kind: TagKind) -&gt; Option&lt;&amp;Tag&gt;;
}
</t>
<t tx="ekr.20231101055917.269">/// New-type wrapper for a single-line text unicode width.
/// Mainly to prevent access to the inner value.
///
/// ## Representation
///
/// Represents the width by adding 1 to the actual width so that the width can be represented by a [`NonZeroU32`],
/// allowing [`TextWidth`] or [`Option&lt;Width&gt;`] fit in 4 bytes rather than 8.
///
/// This means that 2^32 can not be precisely represented and instead has the same value as 2^32-1.
/// This imprecision shouldn't matter in practice because either text are longer than any configured line width
/// and thus, the text should break.
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub struct Width(NonZeroU32);

impl Width {
    pub(crate) const fn new(width: u32) -&gt; Self {
        Width(NonZeroU32::MIN.saturating_add(width))
    }

    pub const fn value(self) -&gt; u32 {
        self.0.get() - 1
    }
}
</t>
<t tx="ekr.20231101055917.270">/// The pre-computed unicode width of a text if it is a single-line text or a marker
/// that it is a multiline text if it contains a line feed.
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub enum TextWidth {
    Width(Width),
    Multiline,
}

impl TextWidth {
    @others
    pub const fn width(self) -&gt; Option&lt;Width&gt; {
        match self {
            TextWidth::Width(width) =&gt; Some(width),
            TextWidth::Multiline =&gt; None,
        }
    }

    pub(crate) const fn is_multiline(self) -&gt; bool {
        matches!(self, TextWidth::Multiline)
    }
}
</t>
<t tx="ekr.20231101055917.271">pub fn from_text(text: &amp;str, indent_width: IndentWidth) -&gt; TextWidth {
    let mut width = 0u32;

    for c in text.chars() {
        let char_width = match c {
            '\t' =&gt; indent_width.value(),
            '\n' =&gt; return TextWidth::Multiline,
            #[allow(clippy::cast_possible_truncation)]
            c =&gt; c.width().unwrap_or(0) as u32,
        };
        width += char_width;
    }

    Self::Width(Width::new(width))
}
</t>
<t tx="ekr.20231101055917.272">#[cfg(test)]
mod tests {
    @others
}
</t>
<t tx="ekr.20231101055917.273">use crate::format_element::{normalize_newlines, LINE_TERMINATORS};

#[test]
fn test_normalize_newlines() {
    assert_eq!(normalize_newlines("a\nb", LINE_TERMINATORS), "a\nb");
    assert_eq!(normalize_newlines("a\n\n\nb", LINE_TERMINATORS), "a\n\n\nb");
    assert_eq!(normalize_newlines("a\rb", LINE_TERMINATORS), "a\nb");
    assert_eq!(normalize_newlines("a\r\nb", LINE_TERMINATORS), "a\nb");
    assert_eq!(
        normalize_newlines("a\r\n\r\n\r\nb", LINE_TERMINATORS),
        "a\n\n\nb"
    );
    assert_eq!(normalize_newlines("a\u{2028}b", LINE_TERMINATORS), "a\nb");
    assert_eq!(normalize_newlines("a\u{2029}b", LINE_TERMINATORS), "a\nb");
}
</t>
<t tx="ekr.20231101055917.274">#[cfg(target_pointer_width = "64")]
mod sizes {
    // Increasing the size of FormatElement has serious consequences on runtime performance and memory footprint.
    // Is there a more efficient way to encode the data to avoid increasing its size? Can the information
    // be recomputed at a later point in time?
    // You reduced the size of a format element? Excellent work!

    use super::{BestFittingVariants, Interned, TextWidth};
    use static_assertions::assert_eq_size;

    assert_eq_size!(ruff_text_size::TextRange, [u8; 8]);
    assert_eq_size!(TextWidth, [u8; 4]);
    assert_eq_size!(super::tag::VerbatimKind, [u8; 8]);
    assert_eq_size!(Interned, [u8; 16]);
    assert_eq_size!(BestFittingVariants, [u8; 16]);

    #[cfg(not(debug_assertions))]
    assert_eq_size!(crate::SourceCodeSlice, [u8; 8]);

    #[cfg(not(debug_assertions))]
    assert_eq_size!(super::Tag, [u8; 16]);

    #[cfg(not(debug_assertions))]
    assert_eq_size!(super::FormatElement, [u8; 24]);
}
</t>
<t tx="ekr.20231101055917.275">use crate::prelude::*;
use std::cell::OnceCell;
use std::marker::PhantomData;

use crate::Buffer;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.276">/// Utility trait that allows memorizing the output of a [`Format`].
/// Useful to avoid re-formatting the same object twice.
pub trait MemoizeFormat&lt;Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.277">/// Returns a formattable object that memoizes the result of `Format` by cloning.
/// Mainly useful if the same sub-tree can appear twice in the formatted output because it's
/// used inside of `if_group_breaks` or `if_group_fits_single_line`.
///
/// ```
/// use std::cell::Cell;
/// use ruff_formatter::{format, write};
/// use ruff_formatter::prelude::*;
/// use ruff_text_size::{Ranged, TextSize};
///
/// struct MyFormat {
///   value: Cell&lt;u64&gt;
/// }
///
/// impl MyFormat {
///     pub fn new() -&gt; Self {
///         Self { value: Cell::new(1) }
///     }
/// }
///
/// impl Format&lt;SimpleFormatContext&gt; for MyFormat {
///     fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
///         let value = self.value.get();
///         self.value.set(value + 1);
///
///         write!(f, [text(&amp;std::format!("Formatted {value} times."), None)])
///     }
/// }
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let normal = MyFormat::new();
///
/// // Calls `format` every time the object gets formatted
/// assert_eq!(
///     "Formatted 1 times. Formatted 2 times.",
///     format!(SimpleFormatContext::default(), [normal, space(), normal])?.print()?.as_code()
/// );
///
/// // Memoized memoizes the result and calls `format` only once.
/// let memoized = normal.memoized();
/// assert_eq!(
///     "Formatted 3 times. Formatted 3 times.",
///     format![SimpleFormatContext::default(), [memoized, space(), memoized]]?.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
fn memoized(self) -&gt; Memoized&lt;Self, Context&gt;
where
    Self: Sized + Format&lt;Context&gt;,
{
    Memoized::new(self)
}
</t>
<t tx="ekr.20231101055917.278">impl&lt;T, Context&gt; MemoizeFormat&lt;Context&gt; for T where T: Format&lt;Context&gt; {}

/// Memoizes the output of its inner [`Format`] to avoid re-formatting a potential expensive object.
#[derive(Debug)]
pub struct Memoized&lt;F, Context&gt; {
    inner: F,
    memory: OnceCell&lt;FormatResult&lt;Option&lt;FormatElement&gt;&gt;&gt;,
    options: PhantomData&lt;Context&gt;,
}
</t>
<t tx="ekr.20231101055917.279">impl&lt;F, Context&gt; Memoized&lt;F, Context&gt;
where
    F: Format&lt;Context&gt;,
{
    @others
}
</t>
<t tx="ekr.20231101055917.28">impl&lt;Context&gt; std::fmt::Debug for Arguments&lt;'_, Context&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.write_str("Arguments[...]")
    }
}
</t>
<t tx="ekr.20231101055917.280">fn new(inner: F) -&gt; Self {
    Self {
        inner,
        memory: OnceCell::new(),
        options: PhantomData,
    }
}
</t>
<t tx="ekr.20231101055917.281">/// Gives access to the memoized content.
///
/// Performs the formatting if the content hasn't been formatted at this point.
///
/// # Example
///
/// Inspect if some memoized content breaks.
///
/// ```rust
/// use std::cell::Cell;
/// use ruff_formatter::{format, write};
/// use ruff_formatter::prelude::*;
/// use ruff_text_size::{Ranged, TextSize};
///
/// #[derive(Default)]
/// struct Counter {
///   value: Cell&lt;u64&gt;
/// }
///
/// impl Format&lt;SimpleFormatContext&gt; for Counter {
///     fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
///         let current = self.value.get();
///
///         write!(f, [
///             token("Count:"),
///             space(),
///             text(&amp;std::format!("{current}"), None),
///             hard_line_break()
///         ])?;
///
///         self.value.set(current + 1);
///         Ok(())
///     }
/// }
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let content = format_with(|f| {
///     let mut counter = Counter::default().memoized();
///     let counter_content = counter.inspect(f)?;
///
///     if counter_content.will_break() {
///         write!(f, [token("Counter:"), block_indent(&amp;counter)])
///     } else {
///         write!(f, [token("Counter:"), counter])
///     }?;
///
///     write!(f, [counter])
/// });
///
///
/// let formatted = format!(SimpleFormatContext::default(), [content])?;
/// assert_eq!("Counter:\n\tCount: 0\nCount: 0\n", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
pub fn inspect(&amp;mut self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;&amp;[FormatElement]&gt; {
    let result = self.memory.get_or_init(|| f.intern(&amp;self.inner));

    match result.as_ref() {
        Ok(Some(FormatElement::Interned(interned))) =&gt; Ok(&amp;**interned),
        Ok(Some(other)) =&gt; Ok(std::slice::from_ref(other)),
        Ok(None) =&gt; Ok(&amp;[]),
        Err(error) =&gt; Err(*error),
    }
}
</t>
<t tx="ekr.20231101055917.282">impl&lt;F, Context&gt; Format&lt;Context&gt; for Memoized&lt;F, Context&gt;
where
    F: Format&lt;Context&gt;,
{
    @others
}
</t>
<t tx="ekr.20231101055917.283">fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    let result = self.memory.get_or_init(|| f.intern(&amp;self.inner));

    match result {
        Ok(Some(elements)) =&gt; {
            f.write_element(elements.clone());

            Ok(())
        }
        Ok(None) =&gt; Ok(()),
        Err(err) =&gt; Err(*err),
    }
}
</t>
<t tx="ekr.20231101055917.284">use crate::buffer::BufferSnapshot;
use crate::builders::{FillBuilder, JoinBuilder};
use crate::prelude::*;
use crate::{Arguments, Buffer, FormatContext, FormatState, GroupId, VecBuffer};

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.285">/// Handles the formatting of a CST and stores the context how the CST should be formatted (user preferences).
/// The formatter is passed to the [Format] implementation of every node in the CST so that they
/// can use it to format their children.
pub struct Formatter&lt;'buf, Context&gt; {
    pub(super) buffer: &amp;'buf mut dyn Buffer&lt;Context = Context&gt;,
}
</t>
<t tx="ekr.20231101055917.286">impl&lt;'buf, Context&gt; Formatter&lt;'buf, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.287">/// Creates a new context that uses the given formatter context
pub fn new(buffer: &amp;'buf mut (dyn Buffer&lt;Context = Context&gt; + 'buf)) -&gt; Self {
    Self { buffer }
}
</t>
<t tx="ekr.20231101055917.288">/// Returns the format options
pub fn options(&amp;self) -&gt; &amp;Context::Options
where
    Context: FormatContext,
{
    self.context().options()
}
</t>
<t tx="ekr.20231101055917.289">/// Returns the Context specifying how to format the current CST
pub fn context(&amp;self) -&gt; &amp;Context {
    self.state().context()
}
</t>
<t tx="ekr.20231101055917.290">/// Returns a mutable reference to the context.
pub fn context_mut(&amp;mut self) -&gt; &amp;mut Context {
    self.state_mut().context_mut()
}
</t>
<t tx="ekr.20231101055917.291">/// Creates a new group id that is unique to this document. The passed debug name is used in the
/// [`std::fmt::Debug`] of the document if this is a debug build.
/// The name is unused for production builds and has no meaning on the equality of two group ids.
pub fn group_id(&amp;self, debug_name: &amp;'static str) -&gt; GroupId {
    self.state().group_id(debug_name)
}
</t>
<t tx="ekr.20231101055917.292">/// Joins multiple [Format] together without any separator
///
/// ## Examples
///
/// ```rust
/// use ruff_formatter::format;
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///     f.join()
///         .entry(&amp;token("a"))
///         .entry(&amp;space())
///         .entry(&amp;token("+"))
///         .entry(&amp;space())
///         .entry(&amp;token("b"))
///         .finish()
/// })])?;
///
/// assert_eq!(
///     "a + b",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
pub fn join&lt;'a&gt;(&amp;'a mut self) -&gt; JoinBuilder&lt;'a, 'buf, (), Context&gt; {
    JoinBuilder::new(self)
}

/// Joins the objects by placing the specified separator between every two items.
///
/// ## Examples
///
/// Joining different tokens by separating them with a comma and a space.
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///     f.join_with(&amp;format_args!(token(","), space()))
///         .entry(&amp;token("1"))
///         .entry(&amp;token("2"))
///         .entry(&amp;token("3"))
///         .entry(&amp;token("4"))
///         .finish()
/// })])?;
///
/// assert_eq!(
///     "1, 2, 3, 4",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
pub fn join_with&lt;'a, Joiner&gt;(
    &amp;'a mut self,
    joiner: Joiner,
) -&gt; JoinBuilder&lt;'a, 'buf, Joiner, Context&gt;
where
    Joiner: Format&lt;Context&gt;,
{
    JoinBuilder::with_separator(self, joiner)
}

/// Concatenates a list of [`crate::Format`] objects with spaces and line breaks to fit
/// them on as few lines as possible. Each element introduces a conceptual group. The printer
/// first tries to print the item in flat mode but then prints it in expanded mode if it doesn't fit.
///
/// ## Examples
///
/// ```rust
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, format_args};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///     f.fill()
///         .entry(&amp;soft_line_break_or_space(), &amp;token("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))
///         .entry(&amp;soft_line_break_or_space(), &amp;token("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"))
///         .entry(&amp;soft_line_break_or_space(), &amp;token("cccccccccccccccccccccccccccccc"))
///         .entry(&amp;soft_line_break_or_space(), &amp;token("dddddddddddddddddddddddddddddd"))
///         .finish()
/// })])?;
///
/// assert_eq!(
///     "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\ncccccccccccccccccccccccccccccc dddddddddddddddddddddddddddddd",
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// ```rust
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, format_args};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let entries = vec![
///     token("&lt;b&gt;Important: &lt;/b&gt;"),
///     token("Please do not commit memory bugs such as segfaults, buffer overflows, etc. otherwise you "),
///     token("&lt;em&gt;will&lt;/em&gt;"),
///     token(" be reprimanded")
/// ];
///
/// let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///     f.fill().entries(&amp;soft_line_break(), entries.iter()).finish()
/// })])?;
///
/// assert_eq!(
///     &amp;std::format!("&lt;b&gt;Important: &lt;/b&gt;\nPlease do not commit memory bugs such as segfaults, buffer overflows, etc. otherwise you \n&lt;em&gt;will&lt;/em&gt; be reprimanded"),
///     formatted.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
pub fn fill&lt;'a&gt;(&amp;'a mut self) -&gt; FillBuilder&lt;'a, 'buf, Context&gt; {
    FillBuilder::new(self)
}

/// Formats `content` into an interned element without writing it to the formatter's buffer.
pub fn intern(&amp;mut self, content: &amp;dyn Format&lt;Context&gt;) -&gt; FormatResult&lt;Option&lt;FormatElement&gt;&gt; {
    let mut buffer = VecBuffer::new(self.state_mut());
    crate::write!(&amp;mut buffer, [content])?;
    let elements = buffer.into_vec();

    Ok(self.intern_vec(elements))
}
</t>
<t tx="ekr.20231101055917.293">pub fn intern_vec(&amp;mut self, mut elements: Vec&lt;FormatElement&gt;) -&gt; Option&lt;FormatElement&gt; {
    match elements.len() {
        0 =&gt; None,
        // Doesn't get cheaper than calling clone, use the element directly
        // SAFETY: Safe because of the `len == 1` check in the match arm.
        1 =&gt; Some(elements.pop().unwrap()),
        _ =&gt; Some(FormatElement::Interned(Interned::new(elements))),
    }
}
</t>
<t tx="ekr.20231101055917.294">impl&lt;Context&gt; Formatter&lt;'_, Context&gt;
where
    Context: FormatContext,
{
    @others
}
</t>
<t tx="ekr.20231101055917.295">/// Take a snapshot of the state of the formatter
#[inline]
pub fn state_snapshot(&amp;self) -&gt; FormatterSnapshot {
    FormatterSnapshot {
        buffer: self.buffer.snapshot(),
    }
}
</t>
<t tx="ekr.20231101055917.296">#[inline]
/// Restore the state of the formatter to a previous snapshot
pub fn restore_state_snapshot(&amp;mut self, snapshot: FormatterSnapshot) {
    self.buffer.restore_snapshot(snapshot.buffer);
}
</t>
<t tx="ekr.20231101055917.297">impl&lt;Context&gt; Buffer for Formatter&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.298">type Context = Context;

#[inline]
fn write_element(&amp;mut self, element: FormatElement) {
    self.buffer.write_element(element);
}
</t>
<t tx="ekr.20231101055917.299">fn elements(&amp;self) -&gt; &amp;[FormatElement] {
    self.buffer.elements()
}
</t>
<t tx="ekr.20231101055917.3">/// Used to get an object that knows how to format this object.
pub trait AsFormat&lt;Context&gt; {
    type Format&lt;'a&gt;: ruff_formatter::Format&lt;Context&gt;
    where
        Self: 'a;

    /// Returns an object that is able to format this object.
    fn format(&amp;self) -&gt; Self::Format&lt;'_&gt;;
}
</t>
<t tx="ekr.20231101055917.30">impl&lt;'fmt, Context&gt; From&lt;&amp;'fmt Argument&lt;'fmt, Context&gt;&gt; for Arguments&lt;'fmt, Context&gt; {
    fn from(argument: &amp;'fmt Argument&lt;'fmt, Context&gt;) -&gt; Self {
        Arguments::new(std::slice::from_ref(argument))
    }
}
</t>
<t tx="ekr.20231101055917.300">#[inline]
fn write_fmt(&amp;mut self, arguments: Arguments&lt;Self::Context&gt;) -&gt; FormatResult&lt;()&gt; {
    for argument in arguments.items() {
        argument.format(self)?;
    }
    Ok(())
}
</t>
<t tx="ekr.20231101055917.301">fn state(&amp;self) -&gt; &amp;FormatState&lt;Self::Context&gt; {
    self.buffer.state()
}
</t>
<t tx="ekr.20231101055917.302">fn state_mut(&amp;mut self) -&gt; &amp;mut FormatState&lt;Self::Context&gt; {
    self.buffer.state_mut()
}
</t>
<t tx="ekr.20231101055917.303">fn snapshot(&amp;self) -&gt; BufferSnapshot {
    self.buffer.snapshot()
}
</t>
<t tx="ekr.20231101055917.304">fn restore_snapshot(&amp;mut self, snapshot: BufferSnapshot) {
    self.buffer.restore_snapshot(snapshot);
}
</t>
<t tx="ekr.20231101055917.305">/// Snapshot of the formatter state  used to handle backtracking if
/// errors are encountered in the formatting process and the formatter
/// has to fallback to printing raw tokens
///
/// In practice this only saves the set of printed tokens in debug
/// mode and compiled to nothing in release mode
pub struct FormatterSnapshot {
    buffer: BufferSnapshot,
}
</t>
<t tx="ekr.20231101055917.306">use std::num::NonZeroU32;
use std::sync::atomic::{AtomicU32, Ordering};

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.307">#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Clone, Copy, Eq, PartialEq, Hash)]
pub struct DebugGroupId {
    value: NonZeroU32,
    #[cfg_attr(feature = "serde", serde(skip))]
    name: &amp;'static str,
}
</t>
<t tx="ekr.20231101055917.308">impl DebugGroupId {
    #[allow(unused)]
    fn new(value: NonZeroU32, debug_name: &amp;'static str) -&gt; Self {
        Self {
            value,
            name: debug_name,
        }
    }
}
</t>
<t tx="ekr.20231101055917.310">impl std::fmt::Debug for DebugGroupId {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        write!(f, "#{}-{}", self.name, self.value)
    }
}
</t>
<t tx="ekr.20231101055917.312">/// Unique identification for a group.
///
/// See [`crate::Formatter::group_id`] on how to get a unique id.
#[repr(transparent)]
#[derive(Clone, Copy, Eq, PartialEq, Hash)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub struct ReleaseGroupId {
    value: NonZeroU32,
}
</t>
<t tx="ekr.20231101055917.313">impl ReleaseGroupId {
    /// Creates a new unique group id with the given debug name (only stored in debug builds)
    #[allow(unused)]
    fn new(value: NonZeroU32, _: &amp;'static str) -&gt; Self {
        Self { value }
    }
}
</t>
<t tx="ekr.20231101055917.315">impl From&lt;GroupId&gt; for u32 {
    fn from(id: GroupId) -&gt; Self {
        id.value.get()
    }
}
</t>
<t tx="ekr.20231101055917.317">impl std::fmt::Debug for ReleaseGroupId {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        write!(f, "#{}", self.value)
    }
}
</t>
<t tx="ekr.20231101055917.319">#[cfg(not(debug_assertions))]
pub type GroupId = ReleaseGroupId;
#[cfg(debug_assertions)]
pub type GroupId = DebugGroupId;

/// Builder to construct unique group ids that are unique if created with the same builder.
pub(super) struct UniqueGroupIdBuilder {
    next_id: AtomicU32,
}

impl UniqueGroupIdBuilder {
    /// Creates a new unique group id with the given debug name.
    pub(crate) fn group_id(&amp;self, debug_name: &amp;'static str) -&gt; GroupId {
        let id = self.next_id.fetch_add(1, Ordering::Relaxed);
        let id = NonZeroU32::new(id).unwrap_or_else(|| panic!("Group ID counter overflowed"));

        GroupId::new(id, debug_name)
    }
}
</t>
<t tx="ekr.20231101055917.32">#[cfg(test)]
mod tests {
    @others
}
</t>
<t tx="ekr.20231101055917.320">impl Default for UniqueGroupIdBuilder {
    fn default() -&gt; Self {
        UniqueGroupIdBuilder {
            // Start with 1 because `GroupId` wraps a `NonZeroU32` to reduce memory usage.
            next_id: AtomicU32::new(1),
        }
    }
}
</t>
<t tx="ekr.20231101055917.322">@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.323">//! Infrastructure for code formatting
//!
//! This module defines [`FormatElement`], an IR to format code documents and provides a means to print
//! such a document to a string. Objects that know how to format themselves implement the [Format] trait.
//!
//! ## Formatting Traits
//!
//! * [`Format`]: Implemented by objects that can be formatted.
//! * [`FormatRule`]: Rule that knows how to format an object of another type. Useful in the situation where
//!  it's necessary to implement [Format] on an object from another crate. This module defines the
//!  [`FormatRefWithRule`] and [`FormatOwnedWithRule`] structs to pass an item with its corresponding rule.
//! * [`FormatWithRule`] implemented by objects that know how to format another type. Useful for implementing
//!  some reusable formatting logic inside of this module if the type itself doesn't implement [Format]
//!
//! ## Formatting Macros
//!
//! This crate defines two macros to construct the IR. These are inspired by Rust's `fmt` macros
//! * [`format!`]: Formats a formatable object
//! * [`format_args!`]: Concatenates a sequence of Format objects.
//! * [`write!`]: Writes a sequence of formatable objects into an output buffer.

mod arguments;
mod buffer;
mod builders;
pub mod diagnostics;
pub mod format_element;
mod format_extensions;
pub mod formatter;
pub mod group_id;
pub mod macros;
pub mod prelude;
pub mod printer;
mod source_code;

use crate::formatter::Formatter;
use crate::group_id::UniqueGroupIdBuilder;
use crate::prelude::TagKind;
use std::fmt::{Debug, Display};
use std::marker::PhantomData;
use std::num::{NonZeroU16, NonZeroU8, TryFromIntError};

use crate::format_element::document::Document;
use crate::printer::{Printer, PrinterOptions, SourceMapGeneration};
pub use arguments::{Argument, Arguments};
pub use buffer::{
    Buffer, BufferExtensions, BufferSnapshot, Inspect, RemoveSoftLinesBuffer, VecBuffer,
};
pub use builders::BestFitting;
pub use source_code::{SourceCode, SourceCodeSlice};

pub use crate::diagnostics::{ActualStart, FormatError, InvalidDocumentError, PrintError};
pub use format_element::{normalize_newlines, FormatElement, LINE_TERMINATORS};
pub use group_id::GroupId;
use ruff_macros::CacheKey;
use ruff_text_size::{TextRange, TextSize};

#[derive(Debug, Eq, PartialEq, Clone, Copy, Hash, CacheKey)]
#[cfg_attr(
    feature = "serde",
    derive(serde::Serialize, serde::Deserialize),
    serde(rename_all = "kebab-case")
)]
#[cfg_attr(feature = "schemars", derive(schemars::JsonSchema))]
#[derive(Default)]
pub enum IndentStyle {
    /// Use tabs to indent code.
    #[default]
    Tab,
    /// Use [`IndentWidth`] spaces to indent code.
    Space,
}

impl IndentStyle {
    /// Returns `true` if this is an [`IndentStyle::Tab`].
    pub const fn is_tab(&amp;self) -&gt; bool {
        matches!(self, IndentStyle::Tab)
    }

    /// Returns `true` if this is an [`IndentStyle::Space`].
    pub const fn is_space(&amp;self) -&gt; bool {
        matches!(self, IndentStyle::Space)
    }
}
</t>
<t tx="ekr.20231101055917.324">impl std::fmt::Display for IndentStyle {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        match self {
            IndentStyle::Tab =&gt; std::write!(f, "tab"),
            IndentStyle::Space =&gt; std::write!(f, "space"),
        }
    }
}
</t>
<t tx="ekr.20231101055917.326">/// The visual width of a indentation.
///
/// Determines the visual width of a tab character (`\t`) and the number of
/// spaces per indent when using [`IndentStyle::Space`].
#[derive(Clone, Copy, Debug, Eq, PartialEq, CacheKey)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[cfg_attr(feature = "schemars", derive(schemars::JsonSchema))]
pub struct IndentWidth(NonZeroU8);

impl IndentWidth {
    /// Return the numeric value for this [`LineWidth`]
    pub const fn value(&amp;self) -&gt; u32 {
        self.0.get() as u32
    }
}
</t>
<t tx="ekr.20231101055917.327">impl Default for IndentWidth {
    fn default() -&gt; Self {
        Self(NonZeroU8::new(2).unwrap())
    }
}
</t>
<t tx="ekr.20231101055917.329">impl TryFrom&lt;u8&gt; for IndentWidth {
    type Error = TryFromIntError;
    
    fn try_from(value: u8) -&gt; Result&lt;Self, Self::Error&gt; {
        NonZeroU8::try_from(value).map(Self)
    }
}
</t>
<t tx="ekr.20231101055917.33">use crate::format_element::tag::Tag;
use crate::prelude::*;
use crate::{format_args, write, FormatState, VecBuffer};

#[test]
fn test_nesting() {
    let mut context = FormatState::new(SimpleFormatContext::default());
    let mut buffer = VecBuffer::new(&amp;mut context);

    write!(
        &amp;mut buffer,
        [
            token("function"),
            space(),
            token("a"),
            space(),
            group(&amp;format_args!(token("("), token(")")))
        ]
    )
    .unwrap();

    assert_eq!(
        buffer.into_vec(),
        vec![
            FormatElement::Token { text: "function" },
            FormatElement::Space,
            FormatElement::Token { text: "a" },
            FormatElement::Space,
            // Group
            FormatElement::Tag(Tag::StartGroup(tag::Group::new())),
            FormatElement::Token { text: "(" },
            FormatElement::Token { text: ")" },
            FormatElement::Tag(Tag::EndGroup)
        ]
    );
}
</t>
<t tx="ekr.20231101055917.331">impl From&lt;NonZeroU8&gt; for IndentWidth {
    fn from(value: NonZeroU8) -&gt; Self {
        Self(value)
    }
}
</t>
<t tx="ekr.20231101055917.333">/// The maximum visual width to which the formatter should try to limit a line.
#[derive(Clone, Copy, Debug, Eq, PartialEq, CacheKey)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[cfg_attr(feature = "schemars", derive(schemars::JsonSchema))]
pub struct LineWidth(NonZeroU16);

impl LineWidth {
    /// Return the numeric value for this [`LineWidth`]
    pub const fn value(&amp;self) -&gt; u16 {
        self.0.get()
    }
}
</t>
<t tx="ekr.20231101055917.334">impl Default for LineWidth {
    fn default() -&gt; Self {
        Self(NonZeroU16::new(80).unwrap())
    }
}
</t>
<t tx="ekr.20231101055917.336">impl TryFrom&lt;u16&gt; for LineWidth {
    type Error = TryFromIntError;
    
    fn try_from(value: u16) -&gt; Result&lt;LineWidth, Self::Error&gt; {
        NonZeroU16::try_from(value).map(LineWidth)
    }
}
</t>
<t tx="ekr.20231101055917.338">impl From&lt;LineWidth&gt; for u16 {
    fn from(value: LineWidth) -&gt; Self {
        value.0.get()
    }
}
</t>
<t tx="ekr.20231101055917.34">use super::{write, Arguments, FormatElement};
use crate::format_element::Interned;
use crate::prelude::LineMode;
use crate::{FormatResult, FormatState};
use rustc_hash::FxHashMap;
use std::any::{Any, TypeId};
use std::fmt::Debug;
use std::ops::{Deref, DerefMut};

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.340">impl From&lt;LineWidth&gt; for u32 {
    fn from(value: LineWidth) -&gt; Self {
        u32::from(value.0.get())
    }
}
</t>
<t tx="ekr.20231101055917.342">impl From&lt;NonZeroU16&gt; for LineWidth {
    fn from(value: NonZeroU16) -&gt; Self {
        Self(value)
    }
}
</t>
<t tx="ekr.20231101055917.344">/// Context object storing data relevant when formatting an object.
pub trait FormatContext {
    type Options: FormatOptions;

    /// Returns the formatting options
    fn options(&amp;self) -&gt; &amp;Self::Options;

    /// Returns the source code from the document that gets formatted.
    fn source_code(&amp;self) -&gt; SourceCode;
}
</t>
<t tx="ekr.20231101055917.345">/// Options customizing how the source code should be formatted.
pub trait FormatOptions {
    /// The indent style.
    fn indent_style(&amp;self) -&gt; IndentStyle;

    /// The visual width of an indent
    fn indent_width(&amp;self) -&gt; IndentWidth;

    /// What's the max width of a line. Defaults to 80.
    fn line_width(&amp;self) -&gt; LineWidth;

    /// Derives the print options from the these format options
    fn as_print_options(&amp;self) -&gt; PrinterOptions;
}
</t>
<t tx="ekr.20231101055917.346">#[derive(Debug, Default, Eq, PartialEq)]
pub struct SimpleFormatContext {
    options: SimpleFormatOptions,
    source_code: String,
}
</t>
<t tx="ekr.20231101055917.347">impl SimpleFormatContext {
    @others
}
</t>
<t tx="ekr.20231101055917.348">pub fn new(options: SimpleFormatOptions) -&gt; Self {
    Self {
        options,
        source_code: String::new(),
    }
}
</t>
<t tx="ekr.20231101055917.349">#[must_use]
pub fn with_source_code(mut self, code: &amp;str) -&gt; Self {
    self.source_code = String::from(code);
    self
}
</t>
<t tx="ekr.20231101055917.35">/// A trait for writing or formatting into [`FormatElement`]-accepting buffers or streams.
pub trait Buffer {
    @others
    /// Returns the formatting state relevant for this formatting session.
    fn state(&amp;self) -&gt; &amp;FormatState&lt;Self::Context&gt;;

    /// Returns the mutable formatting state relevant for this formatting session.
    fn state_mut(&amp;mut self) -&gt; &amp;mut FormatState&lt;Self::Context&gt;;

    /// Takes a snapshot of the Buffers state, excluding the formatter state.
    fn snapshot(&amp;self) -&gt; BufferSnapshot;

    /// Restores the snapshot buffer
    ///
    /// ## Panics
    /// If the passed snapshot id is a snapshot of another buffer OR
    /// if the snapshot is restored out of order
    fn restore_snapshot(&amp;mut self, snapshot: BufferSnapshot);
}
</t>
<t tx="ekr.20231101055917.350">impl FormatContext for SimpleFormatContext {
    @others
}
</t>
<t tx="ekr.20231101055917.351">type Options = SimpleFormatOptions;

fn options(&amp;self) -&gt; &amp;Self::Options {
    &amp;self.options
}
</t>
<t tx="ekr.20231101055917.352">fn source_code(&amp;self) -&gt; SourceCode {
    SourceCode::new(&amp;self.source_code)
}
</t>
<t tx="ekr.20231101055917.353">#[derive(Debug, Default, Eq, PartialEq, Clone)]
pub struct SimpleFormatOptions {
    pub indent_style: IndentStyle,
    pub indent_width: IndentWidth,
    pub line_width: LineWidth,
}
</t>
<t tx="ekr.20231101055917.354">impl FormatOptions for SimpleFormatOptions {
    @others
}
</t>
<t tx="ekr.20231101055917.355">fn indent_style(&amp;self) -&gt; IndentStyle {
    self.indent_style
}
</t>
<t tx="ekr.20231101055917.356">fn indent_width(&amp;self) -&gt; IndentWidth {
    self.indent_width
}
</t>
<t tx="ekr.20231101055917.357">fn line_width(&amp;self) -&gt; LineWidth {
    self.line_width
}
</t>
<t tx="ekr.20231101055917.358">fn as_print_options(&amp;self) -&gt; PrinterOptions {
    PrinterOptions {
        line_width: self.line_width,
        indent_style: self.indent_style,
        indent_width: self.indent_width,
        source_map_generation: SourceMapGeneration::Enabled,
        ..PrinterOptions::default()
    }
}
</t>
<t tx="ekr.20231101055917.359">/// Lightweight sourcemap marker between source and output tokens
#[derive(Debug, Copy, Clone, Eq, PartialEq)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[cfg_attr(feature = "schemars", derive(schemars::JsonSchema))]
pub struct SourceMarker {
    /// Position of the marker in the original source
    pub source: TextSize,
    /// Position of the marker in the output code
    pub dest: TextSize,
}
</t>
<t tx="ekr.20231101055917.36">/// The context used during formatting
type Context;

/// Writes a [`crate::FormatElement`] into this buffer, returning whether the write succeeded.
///
/// # Errors
/// This function will return an instance of [`crate::FormatError`] on error.
///
/// # Examples
///
/// ```
/// use ruff_formatter::{Buffer, FormatElement, FormatState, SimpleFormatContext, VecBuffer};
///
/// let mut state = FormatState::new(SimpleFormatContext::default());
/// let mut buffer = VecBuffer::new(&amp;mut state);
///
/// buffer.write_element(FormatElement::Token { text: "test"});
///
/// assert_eq!(buffer.into_vec(), vec![FormatElement::Token { text: "test" }]);
/// ```
fn write_element(&amp;mut self, element: FormatElement);

/// Returns a slice containing all elements written into this buffer.
///
/// Prefer using [BufferExtensions::start_recording] over accessing [Buffer::elements] directly.
#[doc(hidden)]
fn elements(&amp;self) -&gt; &amp;[FormatElement];

/// Glue for usage of the [`write!`] macro with implementors of this trait.
///
/// This method should generally not be invoked manually, but rather through the [`write!`] macro itself.
///
/// # Examples
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{Buffer, FormatState, SimpleFormatContext, VecBuffer, format_args};
///
/// let mut state = FormatState::new(SimpleFormatContext::default());
/// let mut buffer = VecBuffer::new(&amp;mut state);
///
/// buffer.write_fmt(format_args!(token("Hello World"))).unwrap();
///
/// assert_eq!(buffer.into_vec(), vec![FormatElement::Token{ text: "Hello World" }]);
/// ```
fn write_fmt(mut self: &amp;mut Self, arguments: Arguments&lt;Self::Context&gt;) -&gt; FormatResult&lt;()&gt; {
    write(&amp;mut self, arguments)
}
</t>
<t tx="ekr.20231101055917.360">#[derive(Debug, Clone, Eq, PartialEq)]
pub struct Formatted&lt;Context&gt; {
    document: Document,
    context: Context,
}
</t>
<t tx="ekr.20231101055917.361">impl&lt;Context&gt; Formatted&lt;Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.362">pub fn new(document: Document, context: Context) -&gt; Self {
    Self { document, context }
}
</t>
<t tx="ekr.20231101055917.363">/// Returns the context used during formatting.
pub fn context(&amp;self) -&gt; &amp;Context {
    &amp;self.context
}
</t>
<t tx="ekr.20231101055917.364">/// Returns the formatted document.
pub fn document(&amp;self) -&gt; &amp;Document {
    &amp;self.document
}
</t>
<t tx="ekr.20231101055917.365">/// Consumes `self` and returns the formatted document.
pub fn into_document(self) -&gt; Document {
    self.document
}
</t>
<t tx="ekr.20231101055917.366">impl&lt;Context&gt; Formatted&lt;Context&gt;
where
    Context: FormatContext,
{
    @others
}
</t>
<t tx="ekr.20231101055917.367">pub fn print(&amp;self) -&gt; PrintResult&lt;Printed&gt; {
    let printer = self.create_printer();
    printer.print(&amp;self.document)
}
</t>
<t tx="ekr.20231101055917.368">pub fn print_with_indent(&amp;self, indent: u16) -&gt; PrintResult&lt;Printed&gt; {
    let printer = self.create_printer();
    printer.print_with_indent(&amp;self.document, indent)
}
</t>
<t tx="ekr.20231101055917.369">fn create_printer(&amp;self) -&gt; Printer {
    let source_code = self.context.source_code();
    let print_options = self.context.options().as_print_options();

    Printer::new(source_code, print_options)
}
</t>
<t tx="ekr.20231101055917.37">/// Snapshot of a buffer state that can be restored at a later point.
///
/// Used in cases where the formatting of an object fails but a parent formatter knows an alternative
/// strategy on how to format the object that might succeed.
#[derive(Debug)]
pub enum BufferSnapshot {
    /// Stores an absolute position of a buffers state, for example, the offset of the last written element.
    Position(usize),

    /// Generic structure for custom buffers that need to store more complex data. Slightly more
    /// expensive because it requires allocating the buffer state on the heap.
    Any(Box&lt;dyn Any&gt;),
}

impl BufferSnapshot {
    @others
    /// Unwraps the any value.
    ///
    /// # Panics
    ///
    /// If `self` is not a [`BufferSnapshot::Any`].
    pub fn unwrap_any&lt;T: 'static&gt;(self) -&gt; T {
        match self {
            BufferSnapshot::Position(_) =&gt; {
                panic!("Tried to unwrap Position snapshot as Any snapshot.")
            }
            BufferSnapshot::Any(value) =&gt; match value.downcast::&lt;T&gt;() {
                Ok(snapshot) =&gt; *snapshot,
                Err(err) =&gt; {
                    panic!(
                        "Tried to unwrap snapshot of type {:?} as {:?}",
                        (*err).type_id(),
                        TypeId::of::&lt;T&gt;()
                    )
                }
            },
        }
    }
}
</t>
<t tx="ekr.20231101055917.370">impl&lt;Context&gt; Display for Formatted&lt;Context&gt;
where
    Context: FormatContext,
{
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        std::fmt::Display::fmt(&amp;self.document.display(self.context.source_code()), f)
    }
}
</t>
<t tx="ekr.20231101055917.372">pub type PrintResult&lt;T&gt; = Result&lt;T, PrintError&gt;;

#[derive(Debug, Clone, Eq, PartialEq)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[cfg_attr(feature = "schemars", derive(schemars::JsonSchema))]
pub struct Printed {
    code: String,
    range: Option&lt;TextRange&gt;,
    sourcemap: Vec&lt;SourceMarker&gt;,
    verbatim_ranges: Vec&lt;TextRange&gt;,
}
</t>
<t tx="ekr.20231101055917.373">impl Printed {
    @others
}
</t>
<t tx="ekr.20231101055917.374">pub fn new(
    code: String,
    range: Option&lt;TextRange&gt;,
    sourcemap: Vec&lt;SourceMarker&gt;,
    verbatim_source: Vec&lt;TextRange&gt;,
) -&gt; Self {
    Self {
        code,
        range,
        sourcemap,
        verbatim_ranges: verbatim_source,
    }
}
</t>
<t tx="ekr.20231101055917.375">/// Construct an empty formatter result
pub fn new_empty() -&gt; Self {
    Self {
        code: String::new(),
        range: None,
        sourcemap: Vec::new(),
        verbatim_ranges: Vec::new(),
    }
}
</t>
<t tx="ekr.20231101055917.376">/// Range of the input source file covered by this formatted code,
/// or None if the entire file is covered in this instance
pub fn range(&amp;self) -&gt; Option&lt;TextRange&gt; {
    self.range
}
</t>
<t tx="ekr.20231101055917.377">/// Returns a list of [`SourceMarker`] mapping byte positions
/// in the output string to the input source code.
/// It's not guaranteed that the markers are sorted by source position.
pub fn sourcemap(&amp;self) -&gt; &amp;[SourceMarker] {
    &amp;self.sourcemap
}
</t>
<t tx="ekr.20231101055917.378">/// Returns a list of [`SourceMarker`] mapping byte positions
/// in the output string to the input source code, consuming the result
pub fn into_sourcemap(self) -&gt; Vec&lt;SourceMarker&gt; {
    self.sourcemap
}
</t>
<t tx="ekr.20231101055917.379">/// Takes the list of [`SourceMarker`] mapping byte positions in the output string
/// to the input source code.
pub fn take_sourcemap(&amp;mut self) -&gt; Vec&lt;SourceMarker&gt; {
    std::mem::take(&amp;mut self.sourcemap)
}
</t>
<t tx="ekr.20231101055917.38">/// Creates a new buffer snapshot that points to the specified position.
pub const fn position(index: usize) -&gt; Self {
    Self::Position(index)
}

/// Unwraps the position value.
///
/// # Panics
///
/// If self is not a [`BufferSnapshot::Position`]
pub fn unwrap_position(&amp;self) -&gt; usize {
    match self {
        BufferSnapshot::Position(index) =&gt; *index,
        BufferSnapshot::Any(_) =&gt; panic!("Tried to unwrap Any snapshot as a position."),
    }
}
</t>
<t tx="ekr.20231101055917.380">/// Access the resulting code, borrowing the result
pub fn as_code(&amp;self) -&gt; &amp;str {
    &amp;self.code
}
</t>
<t tx="ekr.20231101055917.381">/// Access the resulting code, consuming the result
pub fn into_code(self) -&gt; String {
    self.code
}
</t>
<t tx="ekr.20231101055917.382">/// The text in the formatted code that has been formatted as verbatim.
pub fn verbatim(&amp;self) -&gt; impl Iterator&lt;Item = (TextRange, &amp;str)&gt; {
    self.verbatim_ranges
        .iter()
        .map(|range| (*range, &amp;self.code[*range]))
}
</t>
<t tx="ekr.20231101055917.383">/// Ranges of the formatted code that have been formatted as verbatim.
pub fn verbatim_ranges(&amp;self) -&gt; &amp;[TextRange] {
    &amp;self.verbatim_ranges
}
</t>
<t tx="ekr.20231101055917.384">/// Takes the ranges of nodes that have been formatted as verbatim, replacing them with an empty list.
pub fn take_verbatim_ranges(&amp;mut self) -&gt; Vec&lt;TextRange&gt; {
    std::mem::take(&amp;mut self.verbatim_ranges)
}
</t>
<t tx="ekr.20231101055917.385">/// Public return type of the formatter
pub type FormatResult&lt;F&gt; = Result&lt;F, FormatError&gt;;

/// Formatting trait for types that can create a formatted representation. The `ruff_formatter` equivalent
/// to [`std::fmt::Display`].
///
/// ## Example
/// Implementing `Format` for a custom struct
///
/// ```
/// use ruff_formatter::{format, write, IndentStyle};
/// use ruff_formatter::prelude::*;
/// use ruff_text_size::TextSize;
///
/// struct Paragraph(String);
///
/// impl Format&lt;SimpleFormatContext&gt; for Paragraph {
///     fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
///         write!(f, [
///             text(&amp;self.0, None),
///             hard_line_break(),
///         ])
///     }
/// }
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let paragraph = Paragraph(String::from("test"));
/// let formatted = format!(SimpleFormatContext::default(), [paragraph])?;
///
/// assert_eq!("test\n", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
pub trait Format&lt;Context&gt; {
    /// Formats the object using the given formatter.
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt;;
}
</t>
<t tx="ekr.20231101055917.386">impl&lt;T, Context&gt; Format&lt;Context&gt; for &amp;T
where
    T: ?Sized + Format&lt;Context&gt;,
{
    #[inline]
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        Format::fmt(&amp;**self, f)
    }
}
</t>
<t tx="ekr.20231101055917.388">impl&lt;T, Context&gt; Format&lt;Context&gt; for &amp;mut T
where
    T: ?Sized + Format&lt;Context&gt;,
{
    #[inline]
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        Format::fmt(&amp;**self, f)
    }
}
</t>
<t tx="ekr.20231101055917.39">/// Implements the `[Buffer]` trait for all mutable references of objects implementing [Buffer].
impl&lt;W: Buffer&lt;Context = Context&gt; + ?Sized, Context&gt; Buffer for &amp;mut W {
    @others
}
</t>
<t tx="ekr.20231101055917.390">impl&lt;T, Context&gt; Format&lt;Context&gt; for Option&lt;T&gt;
where
    T: Format&lt;Context&gt;,
{
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        match self {
            Some(value) =&gt; value.fmt(f),
            None =&gt; Ok(()),
        }
    }
}
</t>
<t tx="ekr.20231101055917.392">impl&lt;Context&gt; Format&lt;Context&gt; for () {
    #[inline]
    fn fmt(&amp;self, _: &amp;mut Formatter&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
        // Intentionally left empty
        Ok(())
    }
}
</t>
<t tx="ekr.20231101055917.394">/// Rule that knows how to format an object of type `T`.
///
/// Implementing [Format] on the object itself is preferred over implementing [`FormatRule`] but
/// this isn't possible inside of a dependent crate for external type.
///
/// For example, the `ruff_js_formatter` crate isn't able to implement [Format] on `JsIfStatement`
/// because both the [Format] trait and `JsIfStatement` are external types (Rust's orphan rule).
///
/// That's why the `ruff_js_formatter` crate must define a new-type that implements the formatting
/// of `JsIfStatement`.
pub trait FormatRule&lt;T, C&gt; {
    fn fmt(&amp;self, item: &amp;T, f: &amp;mut Formatter&lt;C&gt;) -&gt; FormatResult&lt;()&gt;;
}
</t>
<t tx="ekr.20231101055917.395">/// Rule that supports customizing how it formats an object of type `T`.
pub trait FormatRuleWithOptions&lt;T, C&gt;: FormatRule&lt;T, C&gt; {
    type Options;

    /// Returns a new rule that uses the given options to format an object.
    #[must_use]
    fn with_options(self, options: Self::Options) -&gt; Self;
}
</t>
<t tx="ekr.20231101055917.396">/// Trait for an object that formats an object with a specified rule.
///
/// Gives access to the underlying item.
///
/// Useful in situation where a type itself doesn't implement [Format] (e.g. because of Rust's orphan rule)
/// but you want to implement some common formatting logic.
///
/// ## Examples
///
/// This can be useful if you want to format a `SyntaxNode` inside `ruff_formatter`.. `SyntaxNode` doesn't implement [Format]
/// itself but the language specific crate implements `AsFormat` and `IntoFormat` for it and the returned [Format]
/// implement [`FormatWithRule`].
///
/// ```ignore
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, Formatted, FormatWithRule};
/// use ruff_rowan::{Language, SyntaxNode};
/// fn format_node&lt;L: Language, F: FormatWithRule&lt;SimpleFormatContext, Item=SyntaxNode&lt;L&gt;&gt;&gt;(node: F) -&gt; FormatResult&lt;Formatted&lt;SimpleFormatContext&gt;&gt; {
///     let formatted = format!(SimpleFormatContext::default(), [node]);
///     let syntax = node.item();
///     // Do something with syntax
///     formatted;
/// }
/// ```
pub trait FormatWithRule&lt;Context&gt;: Format&lt;Context&gt; {
    type Item;

    /// Returns the associated item
    fn item(&amp;self) -&gt; &amp;Self::Item;
}
</t>
<t tx="ekr.20231101055917.397">/// Formats the referenced `item` with the specified rule.
#[derive(Debug, Copy, Clone)]
pub struct FormatRefWithRule&lt;'a, T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    item: &amp;'a T,
    rule: R,
    context: PhantomData&lt;C&gt;,
}
</t>
<t tx="ekr.20231101055917.398">impl&lt;'a, T, R, C&gt; FormatRefWithRule&lt;'a, T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    @others
}
</t>
<t tx="ekr.20231101055917.399">pub fn new(item: &amp;'a T, rule: R) -&gt; Self {
    Self {
        item,
        rule,
        context: PhantomData,
    }
}
</t>
<t tx="ekr.20231101055917.4">/// Implement [`AsFormat`] for references to types that implement [`AsFormat`].
impl&lt;T, C&gt; AsFormat&lt;C&gt; for &amp;T
where
    T: AsFormat&lt;C&gt;,
{
    type Format&lt;'a&gt; = T::Format&lt;'a&gt; where Self: 'a;
    
    fn format(&amp;self) -&gt; Self::Format&lt;'_&gt; {
        AsFormat::format(&amp;**self)
    }
}
</t>
<t tx="ekr.20231101055917.40">type Context = Context;

fn write_element(&amp;mut self, element: FormatElement) {
    (**self).write_element(element);
}
</t>
<t tx="ekr.20231101055917.400">pub fn rule(&amp;self) -&gt; &amp;R {
    &amp;self.rule
}
</t>
<t tx="ekr.20231101055917.401">impl&lt;T, R, O, C&gt; FormatRefWithRule&lt;'_, T, R, C&gt;
where
    R: FormatRuleWithOptions&lt;T, C, Options = O&gt;,
{
    #[must_use]
    pub fn with_options(mut self, options: O) -&gt; Self {
        self.rule = self.rule.with_options(options);
        self
    }
}
</t>
<t tx="ekr.20231101055917.403">impl&lt;T, R, C&gt; FormatWithRule&lt;C&gt; for FormatRefWithRule&lt;'_, T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    type Item = T;
    
    fn item(&amp;self) -&gt; &amp;Self::Item {
        self.item
    }
}
</t>
<t tx="ekr.20231101055917.405">impl&lt;T, R, C&gt; Format&lt;C&gt; for FormatRefWithRule&lt;'_, T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    #[inline]
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;C&gt;) -&gt; FormatResult&lt;()&gt; {
        self.rule.fmt(self.item, f)
    }
}
</t>
<t tx="ekr.20231101055917.407">/// Formats the `item` with the specified rule.
#[derive(Debug, Clone)]
pub struct FormatOwnedWithRule&lt;T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    item: T,
    rule: R,
    context: PhantomData&lt;C&gt;,
}
</t>
<t tx="ekr.20231101055917.408">impl&lt;T, R, C&gt; FormatOwnedWithRule&lt;T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    @others
}
</t>
<t tx="ekr.20231101055917.409">pub fn new(item: T, rule: R) -&gt; Self {
    Self {
        item,
        rule,
        context: PhantomData,
    }
}
</t>
<t tx="ekr.20231101055917.41">fn elements(&amp;self) -&gt; &amp;[FormatElement] {
    (**self).elements()
}
</t>
<t tx="ekr.20231101055917.410">#[must_use]
pub fn with_item(mut self, item: T) -&gt; Self {
    self.item = item;
    self
}
</t>
<t tx="ekr.20231101055917.411">pub fn into_item(self) -&gt; T {
    self.item
}
</t>
<t tx="ekr.20231101055917.412">impl&lt;T, R, C&gt; Format&lt;C&gt; for FormatOwnedWithRule&lt;T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    #[inline]
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;C&gt;) -&gt; FormatResult&lt;()&gt; {
        self.rule.fmt(&amp;self.item, f)
    }
}
</t>
<t tx="ekr.20231101055917.414">impl&lt;T, R, O, C&gt; FormatOwnedWithRule&lt;T, R, C&gt;
where
    R: FormatRuleWithOptions&lt;T, C, Options = O&gt;,
{
    #[must_use]
    pub fn with_options(mut self, options: O) -&gt; Self {
        self.rule = self.rule.with_options(options);
        self
    }
}
</t>
<t tx="ekr.20231101055917.416">impl&lt;T, R, C&gt; FormatWithRule&lt;C&gt; for FormatOwnedWithRule&lt;T, R, C&gt;
where
    R: FormatRule&lt;T, C&gt;,
{
    type Item = T;
    
    fn item(&amp;self) -&gt; &amp;Self::Item {
        &amp;self.item
    }
}
</t>
<t tx="ekr.20231101055917.418">/// The `write` function takes a target buffer and an `Arguments` struct that can be precompiled with the `format_args!` macro.
///
/// The arguments will be formatted in-order into the output buffer provided.
///
/// # Examples
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{VecBuffer, format_args, FormatState, write, Formatted};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let mut state = FormatState::new(SimpleFormatContext::default());
/// let mut buffer = VecBuffer::new(&amp;mut state);
///
/// write!(&amp;mut buffer, [format_args!(token("Hello World"))])?;
///
/// let formatted = Formatted::new(Document::from(buffer.into_vec()), SimpleFormatContext::default());
///
/// assert_eq!("Hello World", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
///
/// Please note that using [`write!`] might be preferable. Example:
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{VecBuffer, format_args, FormatState, write, Formatted};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let mut state = FormatState::new(SimpleFormatContext::default());
/// let mut buffer = VecBuffer::new(&amp;mut state);
///
/// write!(&amp;mut buffer, [token("Hello World")])?;
///
/// let formatted = Formatted::new(Document::from(buffer.into_vec()), SimpleFormatContext::default());
///
/// assert_eq!("Hello World", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
#[inline]
pub fn write&lt;Context&gt;(
    output: &amp;mut dyn Buffer&lt;Context = Context&gt;,
    args: Arguments&lt;Context&gt;,
) -&gt; FormatResult&lt;()&gt; {
    let mut f = Formatter::new(output);

    f.write_fmt(args)
}

/// The `format` function takes an [`Arguments`] struct and returns the resulting formatting IR.
///
/// The [`Arguments`] instance can be created with the [`format_args!`].
///
/// # Examples
///
/// Basic usage:
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, format_args};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [&amp;format_args!(token("test"))])?;
/// assert_eq!("test", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
///
/// Please note that using [`format!`] might be preferable. Example:
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [token("test")])?;
/// assert_eq!("test", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
pub fn format&lt;Context&gt;(
    context: Context,
    arguments: Arguments&lt;Context&gt;,
) -&gt; FormatResult&lt;Formatted&lt;Context&gt;&gt;
where
    Context: FormatContext,
{
    let source_length = context.source_code().as_str().len();
    // Use a simple heuristic to guess the number of expected format elements.
    // See [#6612](https://github.com/astral-sh/ruff/pull/6612) for more details on how the formula was determined. Changes to our formatter, or supporting
    // more languages may require fine tuning the formula.
    let estimated_buffer_size = source_length / 2;
    let mut state = FormatState::new(context);
    let mut buffer = VecBuffer::with_capacity(estimated_buffer_size, &amp;mut state);

    buffer.write_fmt(arguments)?;

    let mut document = Document::from(buffer.into_vec());
    document.propagate_expand();

    Ok(Formatted::new(document, state.into_context()))
}

/// This structure stores the state that is relevant for the formatting of the whole document.
///
/// This structure is different from [`crate::Formatter`] in that the formatting infrastructure
/// creates a new [`crate::Formatter`] for every [`crate::write`!] call, whereas this structure stays alive
/// for the whole process of formatting a root with [`crate::format`!].
pub struct FormatState&lt;Context&gt; {
    context: Context,

    group_id_builder: UniqueGroupIdBuilder,
}
</t>
<t tx="ekr.20231101055917.419">#[allow(clippy::missing_fields_in_debug)]
impl&lt;Context&gt; std::fmt::Debug for FormatState&lt;Context&gt;
where
    Context: std::fmt::Debug,
{
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter) -&gt; std::fmt::Result {
        f.debug_struct("FormatState")
            .field("context", &amp;self.context)
            .finish()
    }
}
</t>
<t tx="ekr.20231101055917.42">fn write_fmt(&amp;mut self, args: Arguments&lt;Context&gt;) -&gt; FormatResult&lt;()&gt; {
    (**self).write_fmt(args)
}
</t>
<t tx="ekr.20231101055917.421">impl&lt;Context&gt; FormatState&lt;Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.422">/// Creates a new state with the given language specific context
pub fn new(context: Context) -&gt; Self {
    Self {
        context,
        group_id_builder: UniqueGroupIdBuilder::default(),
    }
}
</t>
<t tx="ekr.20231101055917.423">pub fn into_context(self) -&gt; Context {
    self.context
}
</t>
<t tx="ekr.20231101055917.424">/// Returns the context specifying how to format the current CST
pub fn context(&amp;self) -&gt; &amp;Context {
    &amp;self.context
}
</t>
<t tx="ekr.20231101055917.425">/// Returns a mutable reference to the context
pub fn context_mut(&amp;mut self) -&gt; &amp;mut Context {
    &amp;mut self.context
}
</t>
<t tx="ekr.20231101055917.426">/// Creates a new group id that is unique to this document. The passed debug name is used in the
/// [`std::fmt::Debug`] of the document if this is a debug build.
/// The name is unused for production builds and has no meaning on the equality of two group ids.
pub fn group_id(&amp;self, debug_name: &amp;'static str) -&gt; GroupId {
    self.group_id_builder.group_id(debug_name)
}
</t>
<t tx="ekr.20231101055917.427">@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.428">/// Constructs the parameters for other formatting macros.
///
/// This macro functions by taking a list of objects implementing [`crate::Format`]. It will canonicalize the
/// arguments into a single type.
///
/// This macro produces a value of type [`crate::Arguments`]. This value can be passed to
/// the macros within [crate]. All other formatting macros ([`format!`](crate::format!),
/// [`write!`](crate::write!)) are proxied through this one. This macro avoids heap allocations.
///
/// You can use the [`Arguments`] value that `format_args!` returns in  `Format` contexts
/// as seen below.
///
/// ```rust
/// use ruff_formatter::{SimpleFormatContext, format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [
///     format_args!(token("Hello World"))
/// ])?;
///
/// assert_eq!("Hello World", formatted.print()?.as_code());
/// # Ok(())
/// # }
/// ```
///
/// [`Format`]: crate::Format
/// [`Arguments`]: crate::Arguments
#[macro_export]
macro_rules! format_args {
    ($($value:expr),+ $(,)?) =&gt; {
        $crate::Arguments::new(&amp;[
            $(
                $crate::Argument::new(&amp;$value)
            ),+
        ])
    }
}

/// Writes formatted data into a buffer.
///
/// This macro accepts a 'buffer' and a list of format arguments. Each argument will be formatted
/// and the result will be passed to the buffer. The writer may be any value with a `write_fmt` method;
/// generally this comes from an implementation of the [`crate::Buffer`] trait.
///
/// # Examples
///
/// ```rust
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{Buffer, FormatState, SimpleFormatContext, VecBuffer, write};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let mut state = FormatState::new(SimpleFormatContext::default());
/// let mut buffer = VecBuffer::new(&amp;mut state);
/// write!(&amp;mut buffer, [token("Hello"), space()])?;
/// write!(&amp;mut buffer, [token("World")])?;
///
/// assert_eq!(
///     buffer.into_vec(),
///     vec![
///         FormatElement::Token { text: "Hello" },
///         FormatElement::Space,
///         FormatElement::Token { text: "World" },
///     ]
///  );
/// #  Ok(())
/// # }
/// ```
#[macro_export]
macro_rules! write {
    ($dst:expr, [$($arg:expr),+ $(,)?]) =&gt; {{
        let result = $dst.write_fmt($crate::format_args!($($arg),+));
        result
    }}
}

/// Writes formatted data into the given buffer and prints all written elements for a quick and dirty debugging.
///
/// An example:
///
/// ```rust
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{FormatState, VecBuffer};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let mut state = FormatState::new(SimpleFormatContext::default());
/// let mut buffer = VecBuffer::new(&amp;mut state);
///
/// dbg_write!(buffer, [token("Hello")])?;
/// // ^-- prints: [src/main.rs:7][0] = StaticToken("Hello")
///
/// assert_eq!(buffer.into_vec(), vec![FormatElement::Token { text: "Hello" }]);
/// # Ok(())
/// # }
/// ```
///
/// Note that the macro is intended as debugging tool and therefore you should avoid having
/// uses of it in version control for long periods (other than in tests and similar). Format output
/// from production code is better done with `[write!]`
#[macro_export]
macro_rules! dbg_write {
    ($dst:expr, [$($arg:expr),+ $(,)?]) =&gt; {{
        use $crate::BufferExtensions;
        let mut count = 0;
        let mut inspect = $dst.inspect(|element: &amp;FormatElement| {
            std::eprintln!(
                "[{}:{}][{}] = {element:#?}",
                std::file!(), std::line!(), count
            );
            count += 1;
        });
        let result = inspect.write_fmt($crate::format_args!($($arg),+));
        result
    }}
}

/// Creates the Format IR for a value.
///
/// The first argument `format!` receives is the [`crate::FormatContext`] that specify how elements must be formatted.
/// Additional parameters passed get formatted by using their [`crate::Format`] implementation.
///
///
/// ## Examples
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::format;
///
/// let formatted = format!(SimpleFormatContext::default(), [token("("), token("a"), token(")")]).unwrap();
///
/// assert_eq!(
///     formatted.into_document(),
///     Document::from(vec![
///         FormatElement::Token { text: "(" },
///         FormatElement::Token { text: "a" },
///         FormatElement::Token { text: ")" },
///     ])
/// );
/// ```
#[macro_export]
macro_rules! format {
    ($context:expr, [$($arg:expr),+ $(,)?]) =&gt; {{
        ($crate::format($context, $crate::format_args!($($arg),+)))
    }}
}

/// Provides multiple different alternatives and the printer picks the first one that fits.
/// Use this as last resort because it requires that the printer must try all variants in the worst case.
/// The passed variants must be in the following order:
/// - First: The variant that takes up most space horizontally
/// - Last: The variant that takes up the least space horizontally by splitting the content over multiple lines.
///
/// ## Examples
///
/// ```
/// use ruff_formatter::{Formatted, LineWidth, format, format_args, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(
///     SimpleFormatContext::default(),
///     [
///         token("aVeryLongIdentifier"),
///         best_fitting!(
///             // Everything fits on a single line
///             format_args!(
///                 token("("),
///                 group(&amp;format_args![
///                     token("["),
///                         soft_block_indent(&amp;format_args![
///                         token("1,"),
///                         soft_line_break_or_space(),
///                         token("2,"),
///                         soft_line_break_or_space(),
///                         token("3"),
///                     ]),
///                     token("]")
///                 ]),
///                 token(")")
///             ),
///
///             // Breaks after `[`, but prints all elements on a single line
///             format_args!(
///                 token("("),
///                 token("["),
///                 block_indent(&amp;token("1, 2, 3")),
///                 token("]"),
///                 token(")"),
///             ),
///
///             // Breaks after `[` and prints each element on a single line
///             format_args!(
///                 token("("),
///                 block_indent(&amp;format_args![
///                     token("["),
///                     block_indent(&amp;format_args![
///                         token("1,"),
///                         hard_line_break(),
///                         token("2,"),
///                         hard_line_break(),
///                         token("3"),
///                     ]),
///                     token("]"),
///                 ]),
///                 token(")")
///             )
///         )
///     ]
/// )?;
///
/// let document = formatted.into_document();
///
/// // Takes the first variant if everything fits on a single line
/// assert_eq!(
///     "aVeryLongIdentifier([1, 2, 3])",
///     Formatted::new(document.clone(), SimpleFormatContext::default())
///         .print()?
///         .as_code()
/// );
///
/// // It takes the second if the first variant doesn't fit on a single line. The second variant
/// // has some additional line breaks to make sure inner groups don't break
/// assert_eq!(
///     "aVeryLongIdentifier([\n\t1, 2, 3\n])",
///     Formatted::new(document.clone(), SimpleFormatContext::new(SimpleFormatOptions { line_width: 21.try_into().unwrap(), ..SimpleFormatOptions::default() }))
///         .print()?
///         .as_code()
/// );
///
/// // Prints the last option as last resort
/// assert_eq!(
///     "aVeryLongIdentifier(\n\t[\n\t\t1,\n\t\t2,\n\t\t3\n\t]\n)",
///     Formatted::new(document.clone(), SimpleFormatContext::new(SimpleFormatOptions { line_width: 20.try_into().unwrap(), ..SimpleFormatOptions::default() }))
///         .print()?
///         .as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// ### Enclosing group with `should_expand: true`
///
/// ```
/// use ruff_formatter::{Formatted, LineWidth, format, format_args, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(
///     SimpleFormatContext::default(),
///     [
///         best_fitting!(
///             // Prints the method call on the line but breaks the array.
///             format_args!(
///                 token("expect(a).toMatch("),
///                 group(&amp;format_args![
///                     token("["),
///                     soft_block_indent(&amp;format_args![
///                         token("1,"),
///                         soft_line_break_or_space(),
///                         token("2,"),
///                         soft_line_break_or_space(),
///                         token("3"),
///                     ]),
///                     token("]")
///                 ]).should_expand(true),
///                 token(")")
///             ),
///
///             // Breaks after `(`
///            format_args!(
///                 token("expect(a).toMatch("),
///                 group(&amp;soft_block_indent(
///                     &amp;group(&amp;format_args![
///                         token("["),
///                         soft_block_indent(&amp;format_args![
///                             token("1,"),
///                             soft_line_break_or_space(),
///                             token("2,"),
///                             soft_line_break_or_space(),
///                             token("3"),
///                         ]),
///                         token("]")
///                     ]).should_expand(true),
///                 )).should_expand(true),
///                 token(")")
///             ),
///         )
///     ]
/// )?;
///
/// let document = formatted.into_document();
///
/// assert_eq!(
///     "expect(a).toMatch([\n\t1,\n\t2,\n\t3\n])",
///     Formatted::new(document.clone(), SimpleFormatContext::default())
///         .print()?
///         .as_code()
/// );
///
/// # Ok(())
/// # }
/// ```
///
/// The first variant fits because all its content up to the first line break fit on the line without exceeding
/// the configured print width.
///
/// ## Complexity
/// Be mindful of using this IR element as it has a considerable performance penalty:
/// - There are multiple representation for the same content. This results in increased memory usage
///   and traversal time in the printer.
/// - The worst case complexity is that the printer tires each variant. This can result in quadratic
///   complexity if used in nested structures.
///
/// ## Behavior
/// This IR is similar to Prettier's `conditionalGroup`. The printer measures each variant, except the [`MostExpanded`], in [`Flat`] mode
/// to find the first variant that fits and prints this variant in [`Flat`] mode. If no variant fits, then
/// the printer falls back to printing the [`MostExpanded`] variant in [`Expanded`] mode.
///
/// The definition of *fits* differs to groups in that the printer only tests if it is possible to print
/// the content up to the first non-soft line break without exceeding the configured print width.
/// This definition differs from groups as that non-soft line breaks make group expand.
///
/// [`crate::BestFitting`] acts as a "break" boundary, meaning that it is considered to fit
///
///
/// [`Flat`]: crate::format_element::PrintMode::Flat
/// [`Expanded`]: crate::format_element::PrintMode::Expanded
/// [`MostExpanded`]: crate::format_element::BestFittingVariants::most_expanded
#[macro_export]
macro_rules! best_fitting {
    ($least_expanded:expr, $($tail:expr),+ $(,)?) =&gt; {{
        #[allow(unsafe_code)]
        unsafe {
            $crate::BestFitting::from_arguments_unchecked($crate::format_args!($least_expanded, $($tail),+))
        }
    }}
}

#[cfg(test)]
mod tests {
    @others
}
</t>
<t tx="ekr.20231101055917.429">use crate::prelude::*;
use crate::{write, FormatState, SimpleFormatOptions, VecBuffer};

struct TestFormat;

impl Format&lt;SimpleFormatContext&gt; for TestFormat {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
        write!(f, [token("test")])
    }
}
</t>
<t tx="ekr.20231101055917.43">fn state(&amp;self) -&gt; &amp;FormatState&lt;Self::Context&gt; {
    (**self).state()
}
</t>
<t tx="ekr.20231101055917.431">#[test]
fn test_single_element() {
    let mut state = FormatState::new(SimpleFormatContext::default());
    let mut buffer = VecBuffer::new(&amp;mut state);

    write![&amp;mut buffer, [TestFormat]].unwrap();

    assert_eq!(
        buffer.into_vec(),
        vec![FormatElement::Token { text: "test" }]
    );
}
</t>
<t tx="ekr.20231101055917.432">#[test]
fn test_multiple_elements() {
    let mut state = FormatState::new(SimpleFormatContext::default());
    let mut buffer = VecBuffer::new(&amp;mut state);

    write![
        &amp;mut buffer,
        [token("a"), space(), token("simple"), space(), TestFormat]
    ]
    .unwrap();

    assert_eq!(
        buffer.into_vec(),
        vec![
            FormatElement::Token { text: "a" },
            FormatElement::Space,
            FormatElement::Token { text: "simple" },
            FormatElement::Space,
            FormatElement::Token { text: "test" }
        ]
    );
}
</t>
<t tx="ekr.20231101055917.433">#[test]
fn best_fitting_variants_print_as_lists() {
    use crate::prelude::*;
    use crate::{format, format_args, Formatted};

    // The second variant below should be selected when printing at a width of 30
    let formatted_best_fitting = format!(
        SimpleFormatContext::default(),
        [
            token("aVeryLongIdentifier"),
            soft_line_break_or_space(),
            best_fitting![
                format_args![token(
                    "Something that will not fit on a line with 30 character print width."
                )],
                format_args![group(&amp;format_args![
                    token("Start"),
                    soft_line_break(),
                    group(&amp;soft_block_indent(&amp;format_args![
                        token("1,"),
                        soft_line_break_or_space(),
                        token("2,"),
                        soft_line_break_or_space(),
                        token("3"),
                    ])),
                    soft_line_break_or_space(),
                    soft_block_indent(&amp;format_args![
                        token("1,"),
                        soft_line_break_or_space(),
                        token("2,"),
                        soft_line_break_or_space(),
                        group(&amp;format_args!(
                            token("A,"),
                            soft_line_break_or_space(),
                            token("B")
                        )),
                        soft_line_break_or_space(),
                        token("3")
                    ]),
                    soft_line_break_or_space(),
                    token("End")
                ])
                .should_expand(true)],
                format_args!(token("Most"), hard_line_break(), token("Expanded"))
            ]
        ]
    )
    .unwrap();

    // This matches the IR above except that the `best_fitting` was replaced with
    // the contents of its second variant.
    let formatted_normal_list = format!(
        SimpleFormatContext::default(),
        [
            token("aVeryLongIdentifier"),
            soft_line_break_or_space(),
            format_args![
                token("Start"),
                soft_line_break(),
                &amp;group(&amp;soft_block_indent(&amp;format_args![
                    token("1,"),
                    soft_line_break_or_space(),
                    token("2,"),
                    soft_line_break_or_space(),
                    token("3"),
                ])),
                soft_line_break_or_space(),
                &amp;soft_block_indent(&amp;format_args![
                    token("1,"),
                    soft_line_break_or_space(),
                    token("2,"),
                    soft_line_break_or_space(),
                    group(&amp;format_args!(
                        token("A,"),
                        soft_line_break_or_space(),
                        token("B")
                    )),
                    soft_line_break_or_space(),
                    token("3")
                ]),
                soft_line_break_or_space(),
                token("End")
            ],
        ]
    )
    .unwrap();

    let best_fitting_code = Formatted::new(
        formatted_best_fitting.into_document(),
        SimpleFormatContext::new(SimpleFormatOptions {
            line_width: 30.try_into().unwrap(),
            ..SimpleFormatOptions::default()
        }),
    )
    .print()
    .expect("Document to be valid")
    .as_code()
    .to_string();

    let normal_list_code = Formatted::new(
        formatted_normal_list.into_document(),
        SimpleFormatContext::new(SimpleFormatOptions {
            line_width: 30.try_into().unwrap(),
            ..SimpleFormatOptions::default()
        }),
    )
    .print()
    .expect("Document to be valid")
    .as_code()
    .to_string();

    // The variant that "fits" will print its contents as if it were a normal list
    // outside of a BestFitting element.
    assert_eq!(best_fitting_code, normal_list_code);
}
</t>
<t tx="ekr.20231101055917.434">pub use crate::builders::*;
pub use crate::format_element::document::Document;
pub use crate::format_element::tag::{LabelId, Tag, TagKind};
pub use crate::format_element::*;
pub use crate::format_extensions::{MemoizeFormat, Memoized};
pub use crate::formatter::Formatter;
pub use crate::printer::PrinterOptions;

pub use crate::{
    best_fitting, dbg_write, format, format_args, write, Buffer as _, BufferExtensions, Format,
    Format as _, FormatResult, FormatRule, FormatWithRule as _, SimpleFormatContext,
};
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.435">use std::fmt::{Debug, Formatter};

use ruff_text_size::{Ranged, TextRange};

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.436">/// The source code of a document that gets formatted
#[derive(Copy, Clone, Eq, PartialEq, Ord, PartialOrd, Default)]
pub struct SourceCode&lt;'a&gt; {
    text: &amp;'a str,
}
</t>
<t tx="ekr.20231101055917.437">impl&lt;'a&gt; SourceCode&lt;'a&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.438">pub fn new(text: &amp;'a str) -&gt; Self {
    Self { text }
}
</t>
<t tx="ekr.20231101055917.439">pub fn slice(self, range: TextRange) -&gt; SourceCodeSlice {
    assert!(
        usize::from(range.end()) &lt;= self.text.len(),
        "Range end {:?} out of bounds {}.",
        range.end(),
        self.text.len()
    );

    assert!(
        self.text.is_char_boundary(usize::from(range.start())),
        "The range start position {:?} is not a char boundary.",
        range.start()
    );

    assert!(
        self.text.is_char_boundary(usize::from(range.end())),
        "The range end position {:?} is not a char boundary.",
        range.end()
    );

    SourceCodeSlice {
        range,
        #[cfg(debug_assertions)]
        text: String::from(&amp;self.text[range]).into_boxed_str(),
    }
}
</t>
<t tx="ekr.20231101055917.44">fn state_mut(&amp;mut self) -&gt; &amp;mut FormatState&lt;Self::Context&gt; {
    (**self).state_mut()
}
</t>
<t tx="ekr.20231101055917.440">pub fn as_str(&amp;self) -&gt; &amp;'a str {
    self.text
}
</t>
<t tx="ekr.20231101055917.441">impl Debug for SourceCode&lt;'_&gt; {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        f.debug_tuple("SourceCode").field(&amp;self.text).finish()
    }
}
</t>
<t tx="ekr.20231101055917.443">/// A slice into the source text of a document.
///
/// It only stores the range in production builds for a more compact representation, but it
/// keeps the original text in debug builds for better developer experience.
#[derive(Clone, Eq, PartialEq)]
pub struct SourceCodeSlice {
    range: TextRange,
    #[cfg(debug_assertions)]
    text: Box&lt;str&gt;,
}
</t>
<t tx="ekr.20231101055917.444">impl SourceCodeSlice {
    /// Returns the slice's text.
    pub fn text&lt;'a&gt;(&amp;self, code: SourceCode&lt;'a&gt;) -&gt; &amp;'a str {
        assert!(usize::from(self.range.end()) &lt;= code.text.len(), "The range of this slice is out of bounds. Did you provide the correct source code for this slice?");
        &amp;code.text[self.range]
    }
}
</t>
<t tx="ekr.20231101055917.445">impl Ranged for SourceCodeSlice {
    fn range(&amp;self) -&gt; TextRange {
        self.range
    }
}
</t>
<t tx="ekr.20231101055917.447">impl Debug for SourceCodeSlice {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        let mut tuple = f.debug_tuple("SourceCodeSlice");
    
        #[cfg(debug_assertions)]
        tuple.field(&amp;self.text);
    
        tuple.field(&amp;self.range).finish()
    }
}
</t>
<t tx="ekr.20231101055917.449"></t>
<t tx="ekr.20231101055917.45">fn snapshot(&amp;self) -&gt; BufferSnapshot {
    (**self).snapshot()
}
</t>
<t tx="ekr.20231101055917.450">use std::collections::HashMap;
use std::ops::Deref;

use rustc_hash::FxHashMap;

use crate::format_element::tag::{Condition, DedentMode};
use crate::prelude::tag::GroupMode;
use crate::prelude::*;
use crate::source_code::SourceCode;
use crate::{
@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.451">    format, write, BufferExtensions, Format, FormatContext, FormatElement, FormatOptions,
    FormatResult, Formatter, IndentStyle, IndentWidth, LineWidth, PrinterOptions,
};

use super::tag::Tag;

/// A formatted document.
#[derive(Debug, Clone, Eq, PartialEq, Default)]
pub struct Document {
    elements: Vec&lt;FormatElement&gt;,
}
</t>
<t tx="ekr.20231101055917.452">impl Document {
    @others
        fn propagate_expands&lt;'a&gt;(
            elements: &amp;'a [FormatElement],
            enclosing: &amp;mut Vec&lt;Enclosing&lt;'a&gt;&gt;,
            checked_interned: &amp;mut FxHashMap&lt;&amp;'a Interned, bool&gt;,
        ) -&gt; bool {
            let mut expands = false;
            for element in elements {
                let element_expands = match element {
                    FormatElement::Tag(Tag::StartGroup(group)) =&gt; {
                        enclosing.push(Enclosing::Group(group));
                        false
                    }
                    FormatElement::Tag(Tag::EndGroup) =&gt; match enclosing.pop() {
                        Some(Enclosing::Group(group)) =&gt; !group.mode().is_flat(),
                        _ =&gt; false,
                    },
                    FormatElement::Tag(Tag::StartBestFitParenthesize { .. }) =&gt; {
                        enclosing.push(Enclosing::BestFitParenthesize { expanded: expands });
                        expands = false;
                        continue;
                    }

                    FormatElement::Tag(Tag::EndBestFitParenthesize) =&gt; {
                        if let Some(Enclosing::BestFitParenthesize { expanded }) = enclosing.pop() {
                            expands = expanded;
                        }
                        continue;
                    }
                    FormatElement::Tag(Tag::StartConditionalGroup(group)) =&gt; {
                        enclosing.push(Enclosing::ConditionalGroup(group));
                        false
                    }
                    FormatElement::Tag(Tag::EndConditionalGroup) =&gt; match enclosing.pop() {
                        Some(Enclosing::ConditionalGroup(group)) =&gt; !group.mode().is_flat(),
                        _ =&gt; false,
                    },
                    FormatElement::Interned(interned) =&gt; {
                        if let Some(interned_expands) = checked_interned.get(interned) {
                            *interned_expands
                        } else {
                            let interned_expands =
                                propagate_expands(interned, enclosing, checked_interned);
                            checked_interned.insert(interned, interned_expands);
                            interned_expands
                        }
                    }
                    FormatElement::BestFitting { variants, mode: _ } =&gt; {
                        enclosing.push(Enclosing::BestFitting);

                        propagate_expands(variants, enclosing, checked_interned);
                        enclosing.pop();
                        continue;
                    }
                    FormatElement::Tag(Tag::StartFitsExpanded(fits_expanded)) =&gt; {
                        enclosing.push(Enclosing::FitsExpanded {
                            tag: fits_expanded,
                            expands_before: expands,
                        });
                        false
                    }
                    FormatElement::Tag(Tag::EndFitsExpanded) =&gt; {
                        if let Some(Enclosing::FitsExpanded { expands_before, .. }) =
                            enclosing.pop()
                        {
                            expands = expands_before;
                        }

                        continue;
                    }
                    FormatElement::Text {
                        text: _,
                        text_width,
                    } =&gt; text_width.is_multiline(),
                    FormatElement::SourceCodeSlice { text_width, .. } =&gt; text_width.is_multiline(),
                    FormatElement::ExpandParent
                    | FormatElement::Line(LineMode::Hard | LineMode::Empty) =&gt; true,
                    _ =&gt; false,
                };

                if element_expands {
                    expands = true;
                    expand_parent(enclosing);
                }
            }

            expands
        }

        let mut enclosing = Vec::with_capacity(if self.is_empty() {
            0
        } else {
            self.len().ilog2() as usize
        });
        let mut interned = FxHashMap::default();
        propagate_expands(self, &amp;mut enclosing, &amp;mut interned);
    }

    pub fn display&lt;'a&gt;(&amp;'a self, source_code: SourceCode&lt;'a&gt;) -&gt; DisplayDocument {
        DisplayDocument {
            elements: self.elements.as_slice(),
            source_code,
        }
    }
}
</t>
<t tx="ekr.20231101055917.453">/// Sets [`expand`](tag::Group::expand) to [`GroupMode::Propagated`] if the group contains any of:
/// - a group with [`expand`](tag::Group::expand) set to [`GroupMode::Propagated`] or [`GroupMode::Expand`].
/// - a non-soft [line break](FormatElement::Line) with mode [`LineMode::Hard`], [`LineMode::Empty`], or [`LineMode::Literal`].
/// - a [`FormatElement::ExpandParent`]
///
/// [`BestFitting`] elements act as expand boundaries, meaning that the fact that a
/// [`BestFitting`]'s content expands is not propagated past the [`BestFitting`] element.
///
/// [`BestFitting`]: FormatElement::BestFitting
pub(crate) fn propagate_expand(&amp;mut self) {
    #[derive(Debug)]
    enum Enclosing&lt;'a&gt; {
        Group(&amp;'a tag::Group),
        ConditionalGroup(&amp;'a tag::ConditionalGroup),
        FitsExpanded {
            tag: &amp;'a tag::FitsExpanded,
            expands_before: bool,
        },
        BestFitting,
        BestFitParenthesize {
            expanded: bool,
        },
    }

    fn expand_parent(enclosing: &amp;[Enclosing]) {
        match enclosing.last() {
            Some(Enclosing::Group(group)) =&gt; group.propagate_expand(),
            Some(Enclosing::ConditionalGroup(group)) =&gt; group.propagate_expand(),
            Some(Enclosing::FitsExpanded { tag, .. }) =&gt; tag.propagate_expand(),
            _ =&gt; {}
        }
    }
</t>
<t tx="ekr.20231101055917.454">impl From&lt;Vec&lt;FormatElement&gt;&gt; for Document {
    fn from(elements: Vec&lt;FormatElement&gt;) -&gt; Self {
        Self { elements }
    }
}
</t>
<t tx="ekr.20231101055917.456">impl Deref for Document {
    type Target = [FormatElement];
    
    fn deref(&amp;self) -&gt; &amp;Self::Target {
        self.elements.as_slice()
    }
}
</t>
<t tx="ekr.20231101055917.458">pub struct DisplayDocument&lt;'a&gt; {
    elements: &amp;'a [FormatElement],
    source_code: SourceCode&lt;'a&gt;,
}
</t>
<t tx="ekr.20231101055917.459">impl std::fmt::Display for DisplayDocument&lt;'_&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.46">fn restore_snapshot(&amp;mut self, snapshot: BufferSnapshot) {
    (**self).restore_snapshot(snapshot);
}
</t>
<t tx="ekr.20231101055917.460">fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
    let formatted = format!(IrFormatContext::new(self.source_code), [self.elements])
        .expect("Formatting not to throw any FormatErrors");

    f.write_str(
        formatted
            .print()
            .expect("Expected a valid document")
            .as_code(),
    )
}
</t>
<t tx="ekr.20231101055917.461">impl std::fmt::Debug for DisplayDocument&lt;'_&gt; {
    fn fmt(&amp;self, f: &amp;mut std::fmt::Formatter&lt;'_&gt;) -&gt; std::fmt::Result {
        std::fmt::Display::fmt(self, f)
    }
}
</t>
<t tx="ekr.20231101055917.463">#[derive(Clone, Debug)]
struct IrFormatContext&lt;'a&gt; {
    /// The interned elements that have been printed to this point
    printed_interned_elements: HashMap&lt;Interned, usize&gt;,

    source_code: SourceCode&lt;'a&gt;,
}
</t>
<t tx="ekr.20231101055917.464">impl&lt;'a&gt; IrFormatContext&lt;'a&gt; {
    fn new(source_code: SourceCode&lt;'a&gt;) -&gt; Self {
        Self {
            source_code,
            printed_interned_elements: HashMap::new(),
        }
    }
}
</t>
<t tx="ekr.20231101055917.466">impl FormatContext for IrFormatContext&lt;'_&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.467">type Options = IrFormatOptions;

fn options(&amp;self) -&gt; &amp;Self::Options {
    &amp;IrFormatOptions
}
</t>
<t tx="ekr.20231101055917.468">fn source_code(&amp;self) -&gt; SourceCode {
    self.source_code
}
</t>
<t tx="ekr.20231101055917.469">#[derive(Debug, Clone, Default)]
struct IrFormatOptions;

impl FormatOptions for IrFormatOptions {
    @others
}
</t>
<t tx="ekr.20231101055917.47">/// Vector backed [`Buffer`] implementation.
///
/// The buffer writes all elements into the internal elements buffer.
#[derive(Debug)]
pub struct VecBuffer&lt;'a, Context&gt; {
    state: &amp;'a mut FormatState&lt;Context&gt;,
    elements: Vec&lt;FormatElement&gt;,
}
</t>
<t tx="ekr.20231101055917.470">fn indent_style(&amp;self) -&gt; IndentStyle {
    IndentStyle::Space
}
</t>
<t tx="ekr.20231101055917.471">fn indent_width(&amp;self) -&gt; IndentWidth {
    IndentWidth::default()
}
</t>
<t tx="ekr.20231101055917.472">fn line_width(&amp;self) -&gt; LineWidth {
    LineWidth::try_from(80).unwrap()
}
</t>
<t tx="ekr.20231101055917.473">fn as_print_options(&amp;self) -&gt; PrinterOptions {
    PrinterOptions {
        line_width: self.line_width(),
        indent_style: IndentStyle::Space,
        ..PrinterOptions::default()
    }
}
</t>
<t tx="ekr.20231101055917.474">impl Format&lt;IrFormatContext&lt;'_&gt;&gt; for &amp;[FormatElement] {
    @others
        }
</t>
<t tx="ekr.20231101055917.475">fn fmt(&amp;self, f: &amp;mut Formatter&lt;IrFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
    @others
                    } else {
                        f.write_element(element.clone());
                    }
                }

                if !in_text {
                    write!(f, [token("\"")])?;
                }

                in_text = true;

                match element {
                    FormatElement::Space =&gt; {
                        write!(f, [token(" ")])?;
                    }
                    element if element.is_text() =&gt; {
                        write_escaped(element, f);
                    }
                    _ =&gt; unreachable!(),
                }

                let is_next_text = iter.peek().is_some_and(|e| e.is_text() || e.is_space());

                if !is_next_text {
                    write!(f, [token("\"")])?;
                    in_text = false;
                }
            }

            FormatElement::Line(mode) =&gt; match mode {
                LineMode::SoftOrSpace =&gt; {
                    write!(f, [token("soft_line_break_or_space")])?;
                }
                LineMode::Soft =&gt; {
                    write!(f, [token("soft_line_break")])?;
                }
                LineMode::Hard =&gt; {
                    write!(f, [token("hard_line_break")])?;
                }
                LineMode::Empty =&gt; {
                    write!(f, [token("empty_line")])?;
                }
            },
            FormatElement::ExpandParent =&gt; {
                write!(f, [token("expand_parent")])?;
            }

            FormatElement::SourcePosition(position) =&gt; {
                write!(
                    f,
                    [text(&amp;std::format!("source_position({position:?})"), None)]
                )?;
            }

            FormatElement::LineSuffixBoundary =&gt; {
                write!(f, [token("line_suffix_boundary")])?;
            }

            FormatElement::BestFitting { variants, mode } =&gt; {
                write!(f, [token("best_fitting(")])?;

                if *mode != BestFittingMode::FirstLine {
                    write!(f, [text(&amp;std::format!("mode: {mode:?}, "), None)])?;
                }

                write!(f, [token("[")])?;
                f.write_elements([
                    FormatElement::Tag(StartIndent),
                    FormatElement::Line(LineMode::Hard),
                ]);

                for variant in variants {
                    write!(f, [variant, hard_line_break()])?;
                }

                f.write_elements([
                    FormatElement::Tag(EndIndent),
                    FormatElement::Line(LineMode::Hard),
                ]);

                write!(f, [token("])")])?;
            }

            FormatElement::Interned(interned) =&gt; {
                let interned_elements = &amp;mut f.context_mut().printed_interned_elements;

                match interned_elements.get(interned).copied() {
                    None =&gt; {
                        let index = interned_elements.len();
                        interned_elements.insert(interned.clone(), index);

                        write!(
                            f,
                            [
                                text(&amp;std::format!("&lt;interned {index}&gt;"), None),
                                space(),
                                &amp;&amp;**interned,
                            ]
                        )?;
                    }
                    Some(reference) =&gt; {
                        write!(
                            f,
                            [text(&amp;std::format!("&lt;ref interned *{reference}&gt;"), None)]
                        )?;
                    }
                }
            }

            FormatElement::Tag(tag) =&gt; {
                if tag.is_start() {
                    first_element = true;
                    tag_stack.push(tag.kind());
                }
                // Handle documents with mismatching start/end or superfluous end tags
                else {
                    match tag_stack.pop() {
                        None =&gt; {
                            // Only write the end tag without any indent to ensure the output document is valid.
                            write!(
                                f,
                                [
                                    token("&lt;END_TAG_WITHOUT_START&lt;"),
                                    text(&amp;std::format!("{:?}", tag.kind()), None),
                                    token("&gt;&gt;"),
                                ]
                            )?;
                            first_element = false;
                            continue;
                        }
                        Some(start_kind) if start_kind != tag.kind() =&gt; {
                            write!(
                                f,
                                [
                                    ContentArrayEnd,
                                    token(")"),
                                    soft_line_break_or_space(),
                                    token("ERROR&lt;START_END_TAG_MISMATCH&lt;start: "),
                                    text(&amp;std::format!("{start_kind:?}"), None),
                                    token(", end: "),
                                    text(&amp;std::format!("{:?}", tag.kind()), None),
                                    token("&gt;&gt;")
                                ]
                            )?;
                            first_element = false;
                            continue;
                        }
                        _ =&gt; {
                            // all ok
                        }
                    }
                }

                match tag {
                    StartIndent =&gt; {
                        write!(f, [token("indent(")])?;
                    }

                    StartDedent(mode) =&gt; {
                        let label = match mode {
                            DedentMode::Level =&gt; "dedent",
                            DedentMode::Root =&gt; "dedentRoot",
                        };

                        write!(f, [token(label), token("(")])?;
                    }

                    StartAlign(tag::Align(count)) =&gt; {
                        write!(
                            f,
                            [
                                token("align("),
                                text(&amp;count.to_string(), None),
                                token(","),
                                space(),
                            ]
                        )?;
                    }

                    StartLineSuffix { reserved_width } =&gt; {
                        write!(
                            f,
                            [
                                token("line_suffix("),
                                text(&amp;std::format!("{reserved_width:?}"), None),
                                token(","),
                                space(),
                            ]
                        )?;
                    }

                    StartVerbatim(_) =&gt; {
                        write!(f, [token("verbatim(")])?;
                    }

                    StartGroup(group) =&gt; {
                        write!(f, [token("group(")])?;

                        if let Some(group_id) = group.id() {
                            write!(
                                f,
                                [
                                    text(&amp;std::format!("\"{group_id:?}\""), None),
                                    token(","),
                                    space(),
                                ]
                            )?;
                        }

                        match group.mode() {
                            GroupMode::Flat =&gt; {}
                            GroupMode::Expand =&gt; {
                                write!(f, [token("expand: true,"), space()])?;
                            }
                            GroupMode::Propagated =&gt; {
                                write!(f, [token("expand: propagated,"), space()])?;
                            }
                        }
                    }

                    StartBestFitParenthesize { id } =&gt; {
                        write!(f, [token("best_fit_parenthesize(")])?;

                        if let Some(group_id) = id {
                            write!(
                                f,
                                [
                                    text(&amp;std::format!("\"{group_id:?}\""), None),
                                    token(","),
                                    space(),
                                ]
                            )?;
                        }
                    }

                    StartConditionalGroup(group) =&gt; {
                        write!(
                            f,
                            [
                                token("conditional_group(condition:"),
                                space(),
                                group.condition(),
                                token(","),
                                space()
                            ]
                        )?;

                        match group.mode() {
                            GroupMode::Flat =&gt; {}
                            GroupMode::Expand =&gt; {
                                write!(f, [token("expand: true,"), space()])?;
                            }
                            GroupMode::Propagated =&gt; {
                                write!(f, [token("expand: propagated,"), space()])?;
                            }
                        }
                    }

                    StartIndentIfGroupBreaks(id) =&gt; {
                        write!(
                            f,
                            [
                                token("indent_if_group_breaks("),
                                text(&amp;std::format!("\"{id:?}\""), None),
                                token(","),
                                space(),
                            ]
                        )?;
                    }

                    StartConditionalContent(condition) =&gt; {
                        match condition.mode {
                            PrintMode::Flat =&gt; {
                                write!(f, [token("if_group_fits_on_line(")])?;
                            }
                            PrintMode::Expanded =&gt; {
                                write!(f, [token("if_group_breaks(")])?;
                            }
                        }

                        if let Some(group_id) = condition.group_id {
                            write!(
                                f,
                                [
                                    text(&amp;std::format!("\"{group_id:?}\""), None),
                                    token(","),
                                    space(),
                                ]
                            )?;
                        }
                    }

                    StartLabelled(label_id) =&gt; {
                        write!(
                            f,
                            [
                                token("label("),
                                text(&amp;std::format!("\"{label_id:?}\""), None),
                                token(","),
                                space(),
                            ]
                        )?;
                    }

                    StartFill =&gt; {
                        write!(f, [token("fill(")])?;
                    }

                    StartFitsExpanded(tag::FitsExpanded {
                        condition,
                        propagate_expand,
                    }) =&gt; {
                        write!(f, [token("fits_expanded(propagate_expand:"), space()])?;

                        if propagate_expand.get() {
                            write!(f, [token("true")])?;
                        } else {
                            write!(f, [token("false")])?;
                        }

                        write!(f, [token(","), space()])?;

                        if let Some(condition) = condition {
                            write!(
                                f,
                                [token("condition:"), space(), condition, token(","), space()]
                            )?;
                        }
                    }

                    StartEntry | StartBestFittingEntry { .. } =&gt; {
                        // handled after the match for all start tags
                    }
                    EndEntry | EndBestFittingEntry =&gt; write!(f, [ContentArrayEnd])?,

                    EndFill
                    | EndLabelled
                    | EndConditionalContent
                    | EndIndentIfGroupBreaks
                    | EndAlign
                    | EndIndent
                    | EndGroup
                    | EndConditionalGroup
                    | EndBestFitParenthesize
                    | EndLineSuffix
                    | EndDedent
                    | EndFitsExpanded
                    | EndVerbatim =&gt; {
                        write!(f, [ContentArrayEnd, token(")")])?;
                    }
                };

                if tag.is_start() {
                    write!(f, [ContentArrayStart])?;
                }
            }
        }
</t>
<t tx="ekr.20231101055917.476">#[allow(clippy::enum_glob_use)]
use Tag::*;

write!(f, [ContentArrayStart])?;

let mut tag_stack = Vec::new();
let mut first_element = true;
let mut in_text = false;

let mut iter = self.iter().peekable();

while let Some(element) = iter.next() {
    if !first_element &amp;&amp; !in_text &amp;&amp; !element.is_end_tag() {
        // Write a separator between every two elements
        write!(f, [token(","), soft_line_break_or_space()])?;
    }

    first_element = false;

    match element {
        element @ (FormatElement::Space
        | FormatElement::Token { .. }
        | FormatElement::Text { .. }
        | FormatElement::SourceCodeSlice { .. }) =&gt; {
            fn write_escaped(element: &amp;FormatElement, f: &amp;mut Formatter&lt;IrFormatContext&gt;) {
                let (text, text_width) = match element {
                    #[allow(clippy::cast_possible_truncation)]
                    FormatElement::Token { text } =&gt; {
                        (*text, TextWidth::Width(Width::new(text.len() as u32)))
                    }
                    FormatElement::Text { text, text_width } =&gt; {
                        (text.as_ref(), *text_width)
                    }
                    FormatElement::SourceCodeSlice { slice, text_width } =&gt; {
                        (slice.text(f.context().source_code()), *text_width)
                    }
                    _ =&gt; unreachable!(),
                };

                if text.contains('"') {
                    f.write_element(FormatElement::Text {
                        text: text.replace('"', r#"\""#).into(),
                        text_width,
                    });
</t>
<t tx="ekr.20231101055917.477">        while let Some(top) = tag_stack.pop() {
            write!(
                f,
                [
                    ContentArrayEnd,
                    token(")"),
                    soft_line_break_or_space(),
                    text(&amp;std::format!("&lt;START_WITHOUT_END&lt;{top:?}&gt;&gt;"), None),
                ]
            )?;
        }

        write!(f, [ContentArrayEnd])
    }
}

struct ContentArrayStart;

impl Format&lt;IrFormatContext&lt;'_&gt;&gt; for ContentArrayStart {
    @others
}
</t>
<t tx="ekr.20231101055917.478">fn fmt(&amp;self, f: &amp;mut Formatter&lt;IrFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
    use Tag::{StartGroup, StartIndent};

    write!(f, [token("[")])?;

    f.write_elements([
        FormatElement::Tag(StartGroup(tag::Group::new())),
        FormatElement::Tag(StartIndent),
        FormatElement::Line(LineMode::Soft),
    ]);

    Ok(())
}
</t>
<t tx="ekr.20231101055917.479">struct ContentArrayEnd;

impl Format&lt;IrFormatContext&lt;'_&gt;&gt; for ContentArrayEnd {
    fn fmt(&amp;self, f: &amp;mut Formatter&lt;IrFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
        use Tag::{EndGroup, EndIndent};
        f.write_elements([
            FormatElement::Tag(EndIndent),
            FormatElement::Line(LineMode::Soft),
            FormatElement::Tag(EndGroup),
        ]);
    
        write!(f, [token("]")])
    }
}
</t>
<t tx="ekr.20231101055917.48">impl&lt;'a, Context&gt; VecBuffer&lt;'a, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.481">impl FormatElements for [FormatElement] {
    @others
}
</t>
<t tx="ekr.20231101055917.482">fn will_break(&amp;self) -&gt; bool {
    let mut ignore_depth = 0usize;

    for element in self {
        match element {
            // Line suffix
            // Ignore if any of its content breaks
            FormatElement::Tag(
                Tag::StartLineSuffix { reserved_width: _ } | Tag::StartFitsExpanded(_),
            ) =&gt; {
                ignore_depth += 1;
            }
            FormatElement::Tag(Tag::EndLineSuffix | Tag::EndFitsExpanded) =&gt; {
                ignore_depth = ignore_depth.saturating_sub(1);
            }
            FormatElement::Interned(interned) if ignore_depth == 0 =&gt; {
                if interned.will_break() {
                    return true;
                }
            }

            element if ignore_depth == 0 &amp;&amp; element.will_break() =&gt; {
                return true;
            }
            _ =&gt; continue,
        }
    }

    debug_assert_eq!(ignore_depth, 0, "Unclosed start container");

    false
}
</t>
<t tx="ekr.20231101055917.483">fn has_label(&amp;self, expected: LabelId) -&gt; bool {
    self.first()
        .is_some_and(|element| element.has_label(expected))
}
</t>
<t tx="ekr.20231101055917.484">fn start_tag(&amp;self, kind: TagKind) -&gt; Option&lt;&amp;Tag&gt; {
    fn traverse_slice&lt;'a&gt;(
        slice: &amp;'a [FormatElement],
        kind: TagKind,
        depth: &amp;mut usize,
    ) -&gt; Option&lt;&amp;'a Tag&gt; {
        for element in slice.iter().rev() {
            match element {
                FormatElement::Tag(tag) if tag.kind() == kind =&gt; {
                    if tag.is_start() {
                        if *depth == 0 {
                            // Invalid document
                            return None;
                        } else if *depth == 1 {
                            return Some(tag);
                        }
                        *depth -= 1;
                    } else {
                        *depth += 1;
                    }
                }
                FormatElement::Interned(interned) =&gt; {
                    match traverse_slice(interned, kind, depth) {
                        Some(start) =&gt; {
                            return Some(start);
                        }
                        // Reached end or invalid document
                        None if *depth == 0 =&gt; {
                            return None;
                        }
                        _ =&gt; {
                            // continue with other elements
                        }
                    }
                }
                _ =&gt; {}
            }
        }

        None
    }
    // Assert that the document ends at a tag with the specified kind;
    let _ = self.end_tag(kind)?;

    let mut depth = 0usize;

    traverse_slice(self, kind, &amp;mut depth)
}
</t>
<t tx="ekr.20231101055917.485">fn end_tag(&amp;self, kind: TagKind) -&gt; Option&lt;&amp;Tag&gt; {
    self.last().and_then(|element| element.end_tag(kind))
}
</t>
<t tx="ekr.20231101055917.486">impl Format&lt;IrFormatContext&lt;'_&gt;&gt; for Condition {
    @others
}
</t>
<t tx="ekr.20231101055917.487">fn fmt(&amp;self, f: &amp;mut Formatter&lt;IrFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
    match (self.mode, self.group_id) {
        (PrintMode::Flat, None) =&gt; write!(f, [token("if_fits_on_line")]),
        (PrintMode::Flat, Some(id)) =&gt; write!(
            f,
            [
                token("if_group_fits_on_line("),
                text(&amp;std::format!("\"{id:?}\""), None),
                token(")")
            ]
        ),
        (PrintMode::Expanded, None) =&gt; write!(f, [token("if_breaks")]),
        (PrintMode::Expanded, Some(id)) =&gt; write!(
            f,
            [
                token("if_group_breaks("),
                text(&amp;std::format!("\"{id:?}\""), None),
                token(")")
            ]
        ),
    }
}
</t>
<t tx="ekr.20231101055917.488">#[cfg(test)]
mod tests {
@others
}
</t>
<t tx="ekr.20231101055917.489">    use ruff_text_size::{TextRange, TextSize};

    use crate::prelude::*;
    use crate::{format, format_args, write};
    use crate::{SimpleFormatContext, SourceCode};

    #[test]
    fn display_elements() {
        let formatted = format!(
            SimpleFormatContext::default(),
            [format_with(|f| {
                write!(
                    f,
                    [group(&amp;format_args![
                        token("("),
                        soft_block_indent(&amp;format_args![
                            token("Some longer content"),
                            space(),
                            token("That should ultimately break"),
                        ])
                    ])]
                )
            })]
        )
        .unwrap();

        let document = formatted.into_document();

        assert_eq!(
            &amp;std::format!("{}", document.display(SourceCode::default())),
            r#"[
  group([
    "(",
    indent([
      soft_line_break,
      "Some longer content That should ultimately break"
    ]),
    soft_line_break
  ])
]"#
        );
    }
</t>
<t tx="ekr.20231101055917.49">pub fn new(state: &amp;'a mut FormatState&lt;Context&gt;) -&gt; Self {
    Self::new_with_vec(state, Vec::new())
}
</t>
<t tx="ekr.20231101055917.490">    #[test]
    fn escapes_quotes() {
        let formatted = format!(
            SimpleFormatContext::default(),
            [token(r#""""Python docstring""""#)]
        )
        .unwrap();

        let document = formatted.into_document();

        assert_eq!(
            &amp;std::format!("{}", document.display(SourceCode::default())),
            r#"["\"\"\"Python docstring\"\"\""]"#
        );
    }
</t>
<t tx="ekr.20231101055917.491">    #[test]
    fn display_elements_with_source_text_slice() {
        let source_code = "Some longer content\nThat should ultimately break";
        let formatted = format!(
            SimpleFormatContext::default().with_source_code(source_code),
            [format_with(|f| {
                write!(
                    f,
                    [group(&amp;format_args![
                        token("("),
                        soft_block_indent(&amp;format_args![
                            source_text_slice(TextRange::at(TextSize::new(0), TextSize::new(19)),),
                            space(),
                            source_text_slice(TextRange::at(TextSize::new(20), TextSize::new(28)),),
                        ])
                    ])]
                )
            })]
        )
        .unwrap();

        let document = formatted.into_document();

        assert_eq!(
            &amp;std::format!("{}", document.display(SourceCode::new(source_code))),
            r#"[
  group([
    "(",
    indent([
      soft_line_break,
      "Some longer content That should ultimately break"
    ]),
    soft_line_break
  ])
]"#
        );
    }
</t>
<t tx="ekr.20231101055917.492">    #[test]
    fn display_invalid_document() {
        use Tag::*;

        let document = Document::from(vec![
            FormatElement::Token { text: "[" },
            FormatElement::Tag(StartGroup(tag::Group::new())),
            FormatElement::Tag(StartIndent),
            FormatElement::Line(LineMode::Soft),
            FormatElement::Token { text: "a" },
            // Close group instead of indent
            FormatElement::Tag(EndGroup),
            FormatElement::Line(LineMode::Soft),
            FormatElement::Tag(EndIndent),
            FormatElement::Token { text: "]" },
            // End tag without start
            FormatElement::Tag(EndIndent),
            // Start tag without an end
            FormatElement::Tag(StartIndent),
        ]);

        assert_eq!(
            &amp;std::format!("{}", document.display(SourceCode::default())),
            r#"[
  "[",
  group([
    indent([soft_line_break, "a"])
    ERROR&lt;START_END_TAG_MISMATCH&lt;start: Indent, end: Group&gt;&gt;,
    soft_line_break
  ])
  ERROR&lt;START_END_TAG_MISMATCH&lt;start: Group, end: Indent&gt;&gt;,
  "]"&lt;END_TAG_WITHOUT_START&lt;Indent&gt;&gt;,
  indent([])
  &lt;START_WITHOUT_END&lt;Indent&gt;&gt;
]"#
        );
    }
</t>
<t tx="ekr.20231101055917.493">use crate::format_element::PrintMode;
use crate::{GroupId, TextSize};
use std::cell::Cell;
use std::num::NonZeroU8;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.494">/// A Tag marking the start and end of some content to which some special formatting should be applied.
///
/// Tags always come in pairs of a start and an end tag and the styling defined by this tag
/// will be applied to all elements in between the start/end tags.
#[derive(Clone, Debug, Eq, PartialEq)]
pub enum Tag {
    /// Indents the content one level deeper, see [crate::builders::indent] for documentation and examples.
    StartIndent,
    EndIndent,

    /// Variant of [TagKind::Indent] that indents content by a number of spaces. For example, `Align(2)`
    /// indents any content following a line break by an additional two spaces.
    ///
    /// Nesting (Aligns)[TagKind::Align] has the effect that all except the most inner align are handled as (Indent)[TagKind::Indent].
    StartAlign(Align),
    EndAlign,

    /// Reduces the indention of the specified content either by one level or to the root, depending on the mode.
    /// Reverse operation of `Indent` and can be used to *undo* an `Align` for nested content.
    StartDedent(DedentMode),
    EndDedent,

    /// Creates a logical group where its content is either consistently printed:
    /// - on a single line: Omitting `LineMode::Soft` line breaks and printing spaces for `LineMode::SoftOrSpace`
    /// - on multiple lines: Printing all line breaks
    ///
    /// See [crate::builders::group] for documentation and examples.
    StartGroup(Group),
    EndGroup,

    /// Creates a logical group similar to [`Tag::StartGroup`] but only if the condition is met.
    /// This is an optimized representation for (assuming the content should only be grouped if another group fits):
    ///
    /// ```text
    /// if_group_breaks(content, other_group_id),
    /// if_group_fits_on_line(group(&amp;content), other_group_id)
    /// ```
    StartConditionalGroup(ConditionalGroup),
    EndConditionalGroup,

    /// Allows to specify content that gets printed depending on whatever the enclosing group
    /// is printed on a single line or multiple lines. See [crate::builders::if_group_breaks] for examples.
    StartConditionalContent(Condition),
    EndConditionalContent,

    /// Optimized version of [Tag::StartConditionalContent] for the case where some content
    /// should be indented if the specified group breaks.
    StartIndentIfGroupBreaks(GroupId),
    EndIndentIfGroupBreaks,

    /// Concatenates multiple elements together with a given separator printed in either
    /// flat or expanded mode to fill the print width. Expect that the content is a list of alternating
    /// [element, separator] See [crate::Formatter::fill].
    StartFill,
    EndFill,

    /// Entry inside of a [Tag::StartFill]
    StartEntry,
    EndEntry,

    /// Delay the printing of its content until the next line break. Using reserved width will include
    /// the associated line suffix during measurement.
    StartLineSuffix {
        reserved_width: u32,
    },
    EndLineSuffix,

    /// A token that tracks tokens/nodes that are printed as verbatim.
    StartVerbatim(VerbatimKind),
    EndVerbatim,

    /// Special semantic element marking the content with a label.
    /// This does not directly influence how the content will be printed.
    ///
    /// See [crate::builders::labelled] for documentation.
    StartLabelled(LabelId),
    EndLabelled,

    StartFitsExpanded(FitsExpanded),
    EndFitsExpanded,

    /// Marks the start and end of a best-fitting variant.
    StartBestFittingEntry,
    EndBestFittingEntry,

    /// Parenthesizes the content but only if adding the parentheses and indenting the content
    /// makes the content fit in the configured line width.
    ///
    /// See [`crate::builders::best_fit_parenthesize`] for an in-depth explanation.
    StartBestFitParenthesize {
        id: Option&lt;GroupId&gt;,
    },
    EndBestFitParenthesize,
}

impl Tag {
    /// Returns `true` if `self` is any start tag.
    pub const fn is_start(&amp;self) -&gt; bool {
        matches!(
            self,
            Tag::StartIndent
                | Tag::StartAlign(_)
                | Tag::StartDedent(_)
                | Tag::StartGroup(_)
                | Tag::StartConditionalGroup(_)
                | Tag::StartConditionalContent(_)
                | Tag::StartIndentIfGroupBreaks(_)
                | Tag::StartFill
                | Tag::StartEntry
                | Tag::StartLineSuffix { .. }
                | Tag::StartVerbatim(_)
                | Tag::StartLabelled(_)
                | Tag::StartFitsExpanded(_)
                | Tag::StartBestFittingEntry
                | Tag::StartBestFitParenthesize { .. }
        )
    }

    /// Returns `true` if `self` is any end tag.
    pub const fn is_end(&amp;self) -&gt; bool {
        !self.is_start()
    }

    pub const fn kind(&amp;self) -&gt; TagKind {
        #[allow(clippy::enum_glob_use)]
        use Tag::*;

        match self {
            StartIndent | EndIndent =&gt; TagKind::Indent,
            StartAlign(_) | EndAlign =&gt; TagKind::Align,
            StartDedent(_) | EndDedent =&gt; TagKind::Dedent,
            StartGroup(_) | EndGroup =&gt; TagKind::Group,
            StartConditionalGroup(_) | EndConditionalGroup =&gt; TagKind::ConditionalGroup,
            StartConditionalContent(_) | EndConditionalContent =&gt; TagKind::ConditionalContent,
            StartIndentIfGroupBreaks(_) | EndIndentIfGroupBreaks =&gt; TagKind::IndentIfGroupBreaks,
            StartFill | EndFill =&gt; TagKind::Fill,
            StartEntry | EndEntry =&gt; TagKind::Entry,
            StartLineSuffix { reserved_width: _ } | EndLineSuffix =&gt; TagKind::LineSuffix,
            StartVerbatim(_) | EndVerbatim =&gt; TagKind::Verbatim,
            StartLabelled(_) | EndLabelled =&gt; TagKind::Labelled,
            StartFitsExpanded { .. } | EndFitsExpanded =&gt; TagKind::FitsExpanded,
            StartBestFittingEntry { .. } | EndBestFittingEntry =&gt; TagKind::BestFittingEntry,
            StartBestFitParenthesize { .. } | EndBestFitParenthesize =&gt; {
                TagKind::BestFitParenthesize
            }
        }
    }
}
</t>
<t tx="ekr.20231101055917.495">/// The kind of a [Tag].
///
/// Each start end tag pair has its own [tag kind](TagKind).
#[derive(Debug, Copy, Clone, Eq, PartialEq)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub enum TagKind {
    Indent,
    Align,
    Dedent,
    Group,
    ConditionalGroup,
    ConditionalContent,
    IndentIfGroupBreaks,
    Fill,
    Entry,
    LineSuffix,
    Verbatim,
    Labelled,
    FitsExpanded,
    BestFittingEntry,
    BestFitParenthesize,
}

#[derive(Debug, Copy, Default, Clone, Eq, PartialEq)]
pub enum GroupMode {
    /// Print group in flat mode.
    #[default]
    Flat,

    /// The group should be printed in expanded mode
    Expand,

    /// Expand mode has been propagated from an enclosing group to this group.
    Propagated,
}

impl GroupMode {
    pub const fn is_flat(&amp;self) -&gt; bool {
        matches!(self, GroupMode::Flat)
    }
}
</t>
<t tx="ekr.20231101055917.496">#[derive(Debug, Clone, Eq, PartialEq, Default)]
pub struct FitsExpanded {
    pub(crate) condition: Option&lt;Condition&gt;,
    pub(crate) propagate_expand: Cell&lt;bool&gt;,
}
</t>
<t tx="ekr.20231101055917.497">impl FitsExpanded {
    @others
}
</t>
<t tx="ekr.20231101055917.498">pub fn new() -&gt; Self {
    Self::default()
}
</t>
<t tx="ekr.20231101055917.499">#[must_use]
pub fn with_condition(mut self, condition: Option&lt;Condition&gt;) -&gt; Self {
    self.condition = condition;
    self
}
</t>
<t tx="ekr.20231101055917.50">pub fn new_with_vec(state: &amp;'a mut FormatState&lt;Context&gt;, elements: Vec&lt;FormatElement&gt;) -&gt; Self {
    Self { state, elements }
}
</t>
<t tx="ekr.20231101055917.500">pub fn propagate_expand(&amp;self) {
    self.propagate_expand.set(true);
}
</t>
<t tx="ekr.20231101055917.501">#[derive(Debug, Clone, Eq, PartialEq, Default)]
pub struct Group {
    id: Option&lt;GroupId&gt;,
    mode: Cell&lt;GroupMode&gt;,
}
</t>
<t tx="ekr.20231101055917.502">impl Group {
    @others
}
</t>
<t tx="ekr.20231101055917.503">pub fn new() -&gt; Self {
    Self {
        id: None,
        mode: Cell::new(GroupMode::Flat),
    }
}
</t>
<t tx="ekr.20231101055917.504">#[must_use]
pub fn with_id(mut self, id: Option&lt;GroupId&gt;) -&gt; Self {
    self.id = id;
    self
}
</t>
<t tx="ekr.20231101055917.505">#[must_use]
pub fn with_mode(mut self, mode: GroupMode) -&gt; Self {
    self.mode = Cell::new(mode);
    self
}
</t>
<t tx="ekr.20231101055917.506">pub fn mode(&amp;self) -&gt; GroupMode {
    self.mode.get()
}
</t>
<t tx="ekr.20231101055917.507">pub fn propagate_expand(&amp;self) {
    if self.mode.get() == GroupMode::Flat {
        self.mode.set(GroupMode::Propagated);
    }
}
</t>
<t tx="ekr.20231101055917.508">pub fn id(&amp;self) -&gt; Option&lt;GroupId&gt; {
    self.id
}
</t>
<t tx="ekr.20231101055917.509">#[derive(Debug, Clone, Eq, PartialEq)]
pub struct ConditionalGroup {
    mode: Cell&lt;GroupMode&gt;,
    condition: Condition,
}
</t>
<t tx="ekr.20231101055917.51">/// Creates a buffer with the specified capacity
pub fn with_capacity(capacity: usize, state: &amp;'a mut FormatState&lt;Context&gt;) -&gt; Self {
    Self {
        state,
        elements: Vec::with_capacity(capacity),
    }
}
</t>
<t tx="ekr.20231101055917.510">impl ConditionalGroup {
    @others
}
</t>
<t tx="ekr.20231101055917.511">pub fn new(condition: Condition) -&gt; Self {
    Self {
        mode: Cell::new(GroupMode::Flat),
        condition,
    }
}
</t>
<t tx="ekr.20231101055917.512">pub fn condition(&amp;self) -&gt; Condition {
    self.condition
}
</t>
<t tx="ekr.20231101055917.513">pub fn propagate_expand(&amp;self) {
    self.mode.set(GroupMode::Propagated);
}
</t>
<t tx="ekr.20231101055917.514">pub fn mode(&amp;self) -&gt; GroupMode {
    self.mode.get()
}
</t>
<t tx="ekr.20231101055917.515">#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub enum DedentMode {
    /// Reduces the indent by a level (if the current indent is &gt; 0)
    Level,

    /// Reduces the indent to the root
    Root,
}

#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub struct Condition {
    /// - `Flat` -&gt; Omitted if the enclosing group is a multiline group, printed for groups fitting on a single line
    /// - `Expanded` -&gt; Omitted if the enclosing group fits on a single line, printed if the group breaks over multiple lines.
    pub(crate) mode: PrintMode,

    /// The id of the group for which it should check if it breaks or not. The group must appear in the document
    /// before the conditional group (but doesn't have to be in the ancestor chain).
    pub(crate) group_id: Option&lt;GroupId&gt;,
}
</t>
<t tx="ekr.20231101055917.516">impl Condition {
    @others
}
</t>
<t tx="ekr.20231101055917.517">pub(crate) fn new(mode: PrintMode) -&gt; Self {
    Self {
        mode,
        group_id: None,
    }
}

pub fn if_fits_on_line() -&gt; Self {
    Self {
        mode: PrintMode::Flat,
        group_id: None,
    }
}
</t>
<t tx="ekr.20231101055917.518">pub fn if_group_fits_on_line(group_id: GroupId) -&gt; Self {
    Self {
        mode: PrintMode::Flat,
        group_id: Some(group_id),
    }
}
</t>
<t tx="ekr.20231101055917.519">pub fn if_breaks() -&gt; Self {
    Self {
        mode: PrintMode::Expanded,
        group_id: None,
    }
}
</t>
<t tx="ekr.20231101055917.52">/// Consumes the buffer and returns the written [`FormatElement]`s as a vector.
pub fn into_vec(self) -&gt; Vec&lt;FormatElement&gt; {
    self.elements
}
</t>
<t tx="ekr.20231101055917.520">pub fn if_group_breaks(group_id: GroupId) -&gt; Self {
    Self {
        mode: PrintMode::Expanded,
        group_id: Some(group_id),
    }
}
</t>
<t tx="ekr.20231101055917.521">#[must_use]
pub fn with_group_id(mut self, id: Option&lt;GroupId&gt;) -&gt; Self {
    self.group_id = id;
    self
}
</t>
<t tx="ekr.20231101055917.522">#[derive(Clone, Debug, Eq, PartialEq)]
pub struct Align(pub(crate) NonZeroU8);

impl Align {
    pub fn count(&amp;self) -&gt; NonZeroU8 {
        self.0
    }
}
</t>
<t tx="ekr.20231101055917.524">#[derive(Debug, Eq, Copy, Clone)]
pub struct LabelId {
    value: u64,
    #[cfg(debug_assertions)]
    name: &amp;'static str,
}
</t>
<t tx="ekr.20231101055917.525">impl PartialEq for LabelId {
    @others
}
</t>
<t tx="ekr.20231101055917.526">fn eq(&amp;self, other: &amp;Self) -&gt; bool {
    let is_equal = self.value == other.value;

    #[cfg(debug_assertions)]
    {
        if is_equal {
            assert_eq!(self.name, other.name, "Two `LabelId`s with different names have the same `value`. Are you mixing labels of two different `LabelDefinition` or are the values returned by the `LabelDefinition` not unique?");
        }
    }

    is_equal
}
</t>
<t tx="ekr.20231101055917.527">impl LabelId {
    #[allow(clippy::needless_pass_by_value)]
    pub fn of&lt;T: LabelDefinition&gt;(label: T) -&gt; Self {
        Self {
            value: label.value(),
            #[cfg(debug_assertions)]
            name: label.name(),
        }
    }
}
</t>
<t tx="ekr.20231101055917.528">/// Defines the valid labels of a language. You want to have at most one implementation per formatter
/// project.
pub trait LabelDefinition {
    /// Returns the `u64` uniquely identifying this specific label.
    fn value(&amp;self) -&gt; u64;

    /// Returns the name of the label that is shown in debug builds.
    fn name(&amp;self) -&gt; &amp;'static str;
}
</t>
<t tx="ekr.20231101055917.529">#[derive(Clone, Copy, Eq, PartialEq, Debug)]
pub enum VerbatimKind {
    Bogus,
    Suppressed,
    Verbatim {
        /// the length of the formatted node
        length: TextSize,
    },
}

impl VerbatimKind {
    pub const fn is_bogus(&amp;self) -&gt; bool {
        matches!(self, VerbatimKind::Bogus)
    }
}
</t>
<t tx="ekr.20231101055917.53">/// Takes the elements without consuming self
pub fn take_vec(&amp;mut self) -&gt; Vec&lt;FormatElement&gt; {
    std::mem::take(&amp;mut self.elements)
}
</t>
<t tx="ekr.20231101055917.530"></t>
<t tx="ekr.20231101055917.531">use crate::format_element::tag::TagKind;
use crate::format_element::PrintMode;
use crate::printer::stack::{Stack, StackedStack};
use crate::printer::{Indention, MeasureMode};
use crate::{IndentStyle, InvalidDocumentError, PrintError, PrintResult};
use std::fmt::Debug;
use std::num::NonZeroU8;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.532">#[derive(Copy, Clone, Eq, PartialEq, Debug)]
pub(super) enum StackFrameKind {
    Root,
    Tag(TagKind),
}

#[derive(Copy, Clone, Eq, PartialEq, Debug)]
pub(super) struct StackFrame {
    kind: StackFrameKind,
    args: PrintElementArgs,
}

/// Stores arguments passed to `print_element` call, holding the state specific to printing an element.
/// E.g. the `indent` depends on the token the Printer's currently processing. That's why
/// it must be stored outside of the [`PrinterState`] that stores the state common to all elements.
///
/// The state is passed by value, which is why it's important that it isn't storing any heavy
/// data structures. Such structures should be stored on the [`PrinterState`] instead.
#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub(super) struct PrintElementArgs {
    indent: Indention,
    mode: PrintMode,
    measure_mode: MeasureMode,
}

impl PrintElementArgs {
    pub(crate) fn new(indent: Indention) -&gt; Self {
        Self {
            indent,
            ..Self::default()
        }
    }

    pub(super) fn mode(self) -&gt; PrintMode {
        self.mode
    }

    pub(super) fn measure_mode(self) -&gt; MeasureMode {
        self.measure_mode
    }

    pub(super) fn indention(self) -&gt; Indention {
        self.indent
    }

    pub(crate) fn increment_indent_level(mut self, indent_style: IndentStyle) -&gt; Self {
        self.indent = self.indent.increment_level(indent_style);
        self
    }

    pub(crate) fn decrement_indent(mut self) -&gt; Self {
        self.indent = self.indent.decrement();
        self
    }

    pub(crate) fn reset_indent(mut self) -&gt; Self {
        self.indent = Indention::default();
        self
    }

    pub(crate) fn set_indent_align(mut self, count: NonZeroU8) -&gt; Self {
        self.indent = self.indent.set_align(count);
        self
    }

    pub(crate) fn with_print_mode(mut self, mode: PrintMode) -&gt; Self {
        self.mode = mode;
        self
    }

    pub(crate) fn with_measure_mode(mut self, mode: MeasureMode) -&gt; Self {
        self.measure_mode = mode;
        self
    }
}
</t>
<t tx="ekr.20231101055917.533">impl Default for PrintElementArgs {
    fn default() -&gt; Self {
        Self {
            indent: Indention::Level(0),
            mode: PrintMode::Expanded,
            measure_mode: MeasureMode::FirstLine,
        }
    }
}
</t>
<t tx="ekr.20231101055917.535">/// Call stack that stores the [`PrintElementCallArgs`].
///
/// New [`PrintElementCallArgs`] are pushed onto the stack for every [`start`](Tag::is_start) [`Tag`](FormatElement::Tag)
/// and popped when reaching the corresponding [`end`](Tag::is_end) [`Tag`](FormatElement::Tag).
pub(super) trait CallStack {
    type Stack: Stack&lt;StackFrame&gt; + Debug;

    fn stack(&amp;self) -&gt; &amp;Self::Stack;

    fn stack_mut(&amp;mut self) -&gt; &amp;mut Self::Stack;

    /// Pops the call arguments at the top and asserts that they correspond to a start tag of `kind`.
    ///
    /// Returns `Ok` with the arguments if the kind of the top stack frame matches `kind`, otherwise
    /// returns `Err`.
    fn pop(&amp;mut self, kind: TagKind) -&gt; PrintResult&lt;PrintElementArgs&gt; {
        let last = self.stack_mut().pop();

        match last {
            Some(StackFrame {
                kind: StackFrameKind::Tag(actual_kind),
                args,
            }) if actual_kind == kind =&gt; Ok(args),
            // Start / End kind don't match
            Some(StackFrame {
                kind: StackFrameKind::Tag(expected_kind),
                ..
            }) =&gt; Err(PrintError::InvalidDocument(Self::invalid_document_error(
                kind,
                Some(expected_kind),
            ))),
            // Tried to pop the outer most stack frame, which is not valid
            Some(
                frame @ StackFrame {
                    kind: StackFrameKind::Root,
                    ..
                },
            ) =&gt; {
                // Put it back in to guarantee that the stack is never empty
                self.stack_mut().push(frame);
                Err(PrintError::InvalidDocument(Self::invalid_document_error(
                    kind, None,
                )))
            }

            // This should be unreachable but having it for completeness. Happens if the stack is empty.
            None =&gt; Err(PrintError::InvalidDocument(Self::invalid_document_error(
                kind, None,
            ))),
        }
    }
</t>
<t tx="ekr.20231101055917.536">    #[cold]
    fn invalid_document_error(
        end_kind: TagKind,
        start_kind: Option&lt;TagKind&gt;,
    ) -&gt; InvalidDocumentError {
        match start_kind {
            None =&gt; InvalidDocumentError::StartTagMissing { kind: end_kind },
            Some(start_kind) =&gt; InvalidDocumentError::StartEndTagMismatch {
                start_kind,
                end_kind,
            },
        }
    }
</t>
<t tx="ekr.20231101055917.537">    /// Returns the [`PrintElementArgs`] for the current stack frame.
    fn top(&amp;self) -&gt; PrintElementArgs {
        self.stack()
            .top()
            .expect("Expected `stack` to never be empty.")
            .args
    }
</t>
<t tx="ekr.20231101055917.538">    /// Returns the [`TagKind`] of the current stack frame or [None] if this is the root stack frame.
    fn top_kind(&amp;self) -&gt; Option&lt;TagKind&gt; {
        match self
            .stack()
            .top()
            .expect("Expected `stack` to never be empty.")
            .kind
        {
            StackFrameKind::Root =&gt; None,
            StackFrameKind::Tag(kind) =&gt; Some(kind),
        }
    }
</t>
<t tx="ekr.20231101055917.539">    /// Creates a new stack frame for a [`FormatElement::Tag`] of `kind` with `args` as the call arguments.
    fn push(&amp;mut self, kind: TagKind, args: PrintElementArgs) {
        self.stack_mut().push(StackFrame {
            kind: StackFrameKind::Tag(kind),
            args,
        });
    }
</t>
<t tx="ekr.20231101055917.54">impl&lt;Context&gt; Deref for VecBuffer&lt;'_, Context&gt; {
    type Target = [FormatElement];
    
    fn deref(&amp;self) -&gt; &amp;Self::Target {
        &amp;self.elements
    }
}
</t>
<t tx="ekr.20231101055917.540">}

/// Call stack used for printing the [`FormatElement`]s
#[derive(Debug, Clone)]
pub(super) struct PrintCallStack(Vec&lt;StackFrame&gt;);

impl PrintCallStack {
    pub(super) fn new(args: PrintElementArgs) -&gt; Self {
        Self(vec![StackFrame {
            kind: StackFrameKind::Root,
            args,
        }])
    }
}
</t>
<t tx="ekr.20231101055917.541">impl CallStack for PrintCallStack {
    @others
}
</t>
<t tx="ekr.20231101055917.542">type Stack = Vec&lt;StackFrame&gt;;

fn stack(&amp;self) -&gt; &amp;Self::Stack {
    &amp;self.0
}
</t>
<t tx="ekr.20231101055917.543">fn stack_mut(&amp;mut self) -&gt; &amp;mut Self::Stack {
    &amp;mut self.0
}
</t>
<t tx="ekr.20231101055917.544">/// Call stack used for measuring if some content fits on the line.
///
/// The stack is a view on top of the [`PrintCallStack`] because the stack frames are still necessary for printing.
#[must_use]
pub(super) struct FitsCallStack&lt;'print&gt; {
    stack: StackedStack&lt;'print, StackFrame&gt;,
}

impl&lt;'print&gt; FitsCallStack&lt;'print&gt; {
    pub(super) fn new(print: &amp;'print PrintCallStack, saved: Vec&lt;StackFrame&gt;) -&gt; Self {
        let stack = StackedStack::with_vec(&amp;print.0, saved);

        Self { stack }
    }

    pub(super) fn finish(self) -&gt; Vec&lt;StackFrame&gt; {
        self.stack.into_vec()
    }
}
</t>
<t tx="ekr.20231101055917.545">impl&lt;'a&gt; CallStack for FitsCallStack&lt;'a&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.546">type Stack = StackedStack&lt;'a, StackFrame&gt;;

fn stack(&amp;self) -&gt; &amp;Self::Stack {
    &amp;self.stack
}
</t>
<t tx="ekr.20231101055917.547">fn stack_mut(&amp;mut self) -&gt; &amp;mut Self::Stack {
    &amp;mut self.stack
}
</t>
<t tx="ekr.20231101055917.548">use crate::printer::call_stack::PrintElementArgs;
use crate::FormatElement;

@others
#[derive(Debug, Copy, Clone)]
pub(super) enum LineSuffixEntry&lt;'a&gt; {
    /// A line suffix to print
    Suffix(&amp;'a FormatElement),

    /// Potentially changed call arguments that should be used to format any following items.  
    Args(PrintElementArgs),
}
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.549">/// Stores the queued line suffixes.
#[derive(Debug, Default)]
pub(super) struct LineSuffixes&lt;'a&gt; {
    suffixes: Vec&lt;LineSuffixEntry&lt;'a&gt;&gt;,
}

impl&lt;'a&gt; LineSuffixes&lt;'a&gt; {
    /// Extends the line suffixes with `elements`, storing their call stack arguments with them.
    pub(super) fn extend&lt;I&gt;(&amp;mut self, args: PrintElementArgs, elements: I)
    where
        I: IntoIterator&lt;Item = &amp;'a FormatElement&gt;,
    {
        self.suffixes
            .extend(elements.into_iter().map(LineSuffixEntry::Suffix));
        self.suffixes.push(LineSuffixEntry::Args(args));
    }

    /// Takes all the pending line suffixes.
    pub(super) fn take_pending&lt;'l&gt;(
        &amp;'l mut self,
    ) -&gt; impl Iterator&lt;Item = LineSuffixEntry&lt;'a&gt;&gt; + DoubleEndedIterator + 'l + ExactSizeIterator
    {
        self.suffixes.drain(..)
    }

    /// Returns `true` if there are any line suffixes and `false` otherwise.
    pub(super) fn has_pending(&amp;self) -&gt; bool {
        !self.suffixes.is_empty()
    }
}
</t>
<t tx="ekr.20231101055917.550">use std::num::NonZeroU8;

use drop_bomb::DebugDropBomb;
use unicode_width::UnicodeWidthChar;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.551">pub use printer_options::*;
use ruff_text_size::{Ranged, TextLen, TextSize};

use crate::format_element::document::Document;
use crate::format_element::tag::{Condition, GroupMode};
use crate::format_element::{BestFittingMode, BestFittingVariants, LineMode, PrintMode};
use crate::prelude::tag::{DedentMode, Tag, TagKind, VerbatimKind};
use crate::prelude::{tag, TextWidth};
use crate::printer::call_stack::{
    CallStack, FitsCallStack, PrintCallStack, PrintElementArgs, StackFrame,
};
use crate::printer::line_suffixes::{LineSuffixEntry, LineSuffixes};
use crate::printer::queue::{
    AllPredicate, FitsEndPredicate, FitsQueue, PrintQueue, Queue, SingleEntryPredicate,
};
use crate::source_code::SourceCode;
use crate::{
    ActualStart, FormatElement, GroupId, IndentStyle, InvalidDocumentError, PrintError,
    PrintResult, Printed, SourceMarker, TextRange,
};

mod call_stack;
mod line_suffixes;
mod printer_options;
mod queue;
mod stack;

/// Prints the format elements into a string
#[derive(Debug, Default)]
pub struct Printer&lt;'a&gt; {
    options: PrinterOptions,
    source_code: SourceCode&lt;'a&gt;,
    state: PrinterState&lt;'a&gt;,
}
</t>
<t tx="ekr.20231101055917.552">impl&lt;'a&gt; Printer&lt;'a&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.553">pub fn new(source_code: SourceCode&lt;'a&gt;, options: PrinterOptions) -&gt; Self {
    Self {
        source_code,
        options,
        state: PrinterState::with_capacity(source_code.as_str().len()),
    }
}
</t>
<t tx="ekr.20231101055917.554">/// Prints the passed in element as well as all its content
pub fn print(self, document: &amp;'a Document) -&gt; PrintResult&lt;Printed&gt; {
    self.print_with_indent(document, 0)
}
</t>
<t tx="ekr.20231101055917.555">/// Prints the passed in element as well as all its content,
/// starting at the specified indentation level
#[tracing::instrument(level = "debug", name = "Printer::print", skip_all)]
pub fn print_with_indent(
    mut self,
    document: &amp;'a Document,
    indent: u16,
) -&gt; PrintResult&lt;Printed&gt; {
    let mut stack = PrintCallStack::new(PrintElementArgs::new(Indention::Level(indent)));
    let mut queue: PrintQueue&lt;'a&gt; = PrintQueue::new(document.as_ref());

    loop {
        if let Some(element) = queue.pop() {
            self.print_element(&amp;mut stack, &amp;mut queue, element)?;
        } else {
            if !self.flush_line_suffixes(&amp;mut queue, &amp;mut stack, None) {
                break;
            }
        }
    }

    Ok(Printed::new(
        self.state.buffer,
        None,
        self.state.source_markers,
        self.state.verbatim_markers,
    ))
}
</t>
<t tx="ekr.20231101055917.556">/// Prints a single element and push the following elements to queue
fn print_element(
    &amp;mut self,
    stack: &amp;mut PrintCallStack,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    element: &amp;'a FormatElement,
) -&gt; PrintResult&lt;()&gt; {
    #[allow(clippy::enum_glob_use)]
    use Tag::*;

    let args = stack.top();

    match element {
        FormatElement::Space =&gt; self.print_text(Text::Token(" "), None),
        FormatElement::Token { text } =&gt; self.print_text(Text::Token(text), None),
        FormatElement::Text { text, text_width } =&gt; self.print_text(
            Text::Text {
                text,
                text_width: *text_width,
            },
            None,
        ),
        FormatElement::SourceCodeSlice { slice, text_width } =&gt; {
            let text = slice.text(self.source_code);
            self.print_text(
                Text::Text {
                    text,
                    text_width: *text_width,
                },
                Some(slice.range()),
            );
        }
        FormatElement::Line(line_mode) =&gt; {
            if args.mode().is_flat()
                &amp;&amp; matches!(line_mode, LineMode::Soft | LineMode::SoftOrSpace)
            {
                if line_mode == &amp;LineMode::SoftOrSpace {
                    self.print_text(Text::Token(" "), None);
                }
            } else if self.state.line_suffixes.has_pending() {
                self.flush_line_suffixes(queue, stack, Some(element));
            } else {
                // Only print a newline if the current line isn't already empty
                if self.state.line_width &gt; 0 {
                    self.print_char('\n');
                }

                // Print a second line break if this is an empty line
                if line_mode == &amp;LineMode::Empty {
                    self.print_char('\n');
                }

                self.state.pending_indent = args.indention();
            }
        }

        FormatElement::ExpandParent =&gt; {
            // Handled in `Document::propagate_expands()
        }

        FormatElement::SourcePosition(position) =&gt; {
            self.state.source_position = *position;
            self.push_marker();
        }

        FormatElement::LineSuffixBoundary =&gt; {
            const HARD_BREAK: &amp;FormatElement = &amp;FormatElement::Line(LineMode::Hard);
            self.flush_line_suffixes(queue, stack, Some(HARD_BREAK));
        }

        FormatElement::BestFitting { variants, mode } =&gt; {
            self.print_best_fitting(variants, *mode, queue, stack)?;
        }

        FormatElement::Interned(content) =&gt; {
            queue.extend_back(content);
        }

        FormatElement::Tag(StartGroup(group)) =&gt; {
            let print_mode = match group.mode() {
                GroupMode::Expand | GroupMode::Propagated =&gt; PrintMode::Expanded,
                GroupMode::Flat =&gt; {
                    self.flat_group_print_mode(TagKind::Group, group.id(), args, queue, stack)?
                }
            };

            if let Some(id) = group.id() {
                self.state.group_modes.insert_print_mode(id, print_mode);
            }

            stack.push(TagKind::Group, args.with_print_mode(print_mode));
        }

        FormatElement::Tag(StartBestFitParenthesize { id }) =&gt; {
            const OPEN_PAREN: FormatElement = FormatElement::Token { text: "(" };
            const INDENT: FormatElement = FormatElement::Tag(Tag::StartIndent);
            const HARD_LINE_BREAK: FormatElement = FormatElement::Line(LineMode::Hard);

            let fits_flat = self.flat_group_print_mode(
                TagKind::BestFitParenthesize,
                *id,
                args,
                queue,
                stack,
            )? == PrintMode::Flat;

            let print_mode = if fits_flat {
                PrintMode::Flat
            } else {
                // Test if the content fits in expanded mode. If not, prefer avoiding the parentheses
                // over parenthesizing the expression.
                if let Some(id) = id {
                    self.state
                        .group_modes
                        .insert_print_mode(*id, PrintMode::Expanded);
                }

                stack.push(
                    TagKind::BestFitParenthesize,
                    args.with_measure_mode(MeasureMode::AllLines),
                );

                queue.extend_back(&amp;[OPEN_PAREN, INDENT, HARD_LINE_BREAK]);
                let fits_expanded = self.fits(queue, stack)?;
                queue.pop_slice();
                stack.pop(TagKind::BestFitParenthesize)?;

                if fits_expanded {
                    PrintMode::Expanded
                } else {
                    PrintMode::Flat
                }
            };

            if let Some(id) = id {
                self.state.group_modes.insert_print_mode(*id, print_mode);
            }

            if print_mode.is_expanded() {
                // Parenthesize the content. The `EndIndent` is handled inside of the `EndBestFitParenthesize`
                queue.extend_back(&amp;[OPEN_PAREN, INDENT, HARD_LINE_BREAK]);
            }

            stack.push(
                TagKind::BestFitParenthesize,
                args.with_print_mode(print_mode),
            );
        }

        FormatElement::Tag(EndBestFitParenthesize) =&gt; {
            if args.mode().is_expanded() {
                const HARD_LINE_BREAK: FormatElement = FormatElement::Line(LineMode::Hard);
                const CLOSE_PAREN: FormatElement = FormatElement::Token { text: ")" };

                // Finish the indent and print the hardline break and closing parentheses.
                stack.pop(TagKind::Indent)?;
                queue.extend_back(&amp;[HARD_LINE_BREAK, CLOSE_PAREN]);
            }

            stack.pop(TagKind::BestFitParenthesize)?;
        }

        FormatElement::Tag(StartConditionalGroup(group)) =&gt; {
            let condition = group.condition();
            let expected_mode = match condition.group_id {
                None =&gt; args.mode(),
                Some(id) =&gt; self.state.group_modes.get_print_mode(id)?,
            };

            if expected_mode == condition.mode {
                let print_mode = match group.mode() {
                    GroupMode::Expand | GroupMode::Propagated =&gt; PrintMode::Expanded,
                    GroupMode::Flat =&gt; self.flat_group_print_mode(
                        TagKind::ConditionalGroup,
                        None,
                        args,
                        queue,
                        stack,
                    )?,
                };

                stack.push(TagKind::ConditionalGroup, args.with_print_mode(print_mode));
            } else {
                // Condition isn't met, render as normal content
                stack.push(TagKind::ConditionalGroup, args);
            }
        }

        FormatElement::Tag(StartFill) =&gt; {
            self.print_fill_entries(queue, stack)?;
        }

        FormatElement::Tag(StartIndent) =&gt; {
            stack.push(
                TagKind::Indent,
                args.increment_indent_level(self.options.indent_style()),
            );
        }

        FormatElement::Tag(StartDedent(mode)) =&gt; {
            let args = match mode {
                DedentMode::Level =&gt; args.decrement_indent(),
                DedentMode::Root =&gt; args.reset_indent(),
            };
            stack.push(TagKind::Dedent, args);
        }

        FormatElement::Tag(StartAlign(align)) =&gt; {
            stack.push(TagKind::Align, args.set_indent_align(align.count()));
        }

        FormatElement::Tag(StartConditionalContent(Condition { mode, group_id })) =&gt; {
            let group_mode = match group_id {
                None =&gt; args.mode(),
                Some(id) =&gt; self.state.group_modes.get_print_mode(*id)?,
            };

            if *mode == group_mode {
                stack.push(TagKind::ConditionalContent, args);
            } else {
                queue.skip_content(TagKind::ConditionalContent);
            }
        }

        FormatElement::Tag(StartIndentIfGroupBreaks(group_id)) =&gt; {
            let group_mode = self.state.group_modes.get_print_mode(*group_id)?;

            let args = match group_mode {
                PrintMode::Flat =&gt; args,
                PrintMode::Expanded =&gt; args.increment_indent_level(self.options.indent_style),
            };

            stack.push(TagKind::IndentIfGroupBreaks, args);
        }

        FormatElement::Tag(StartLineSuffix { reserved_width }) =&gt; {
            self.state.line_width += reserved_width;
            self.state
                .line_suffixes
                .extend(args, queue.iter_content(TagKind::LineSuffix));
        }

        FormatElement::Tag(StartVerbatim(kind)) =&gt; {
            if let VerbatimKind::Verbatim { length } = kind {
                // SAFETY: Ruff only supports formatting files &lt;= 4GB
                #[allow(clippy::cast_possible_truncation)]
                self.state.verbatim_markers.push(TextRange::at(
                    TextSize::from(self.state.buffer.len() as u32),
                    *length,
                ));
            }

            stack.push(TagKind::Verbatim, args);
        }

        FormatElement::Tag(StartFitsExpanded(tag::FitsExpanded { condition, .. })) =&gt; {
            let condition_met = match condition {
                Some(condition) =&gt; {
                    let group_mode = match condition.group_id {
                        Some(group_id) =&gt; self.state.group_modes.get_print_mode(group_id)?,
                        None =&gt; args.mode(),
                    };

                    condition.mode == group_mode
                }
                None =&gt; true,
            };

            if condition_met {
                // We measured the inner groups all in expanded. It now is necessary to measure if the inner groups fit as well.
                self.state.measured_group_fits = false;
            }

            stack.push(TagKind::FitsExpanded, args);
        }

        FormatElement::Tag(
            tag @ (StartLabelled(_) | StartEntry | StartBestFittingEntry { .. }),
        ) =&gt; {
            stack.push(tag.kind(), args);
        }

        FormatElement::Tag(
            tag @ (EndLabelled
            | EndEntry
            | EndGroup
            | EndConditionalGroup
            | EndIndent
            | EndDedent
            | EndAlign
            | EndConditionalContent
            | EndIndentIfGroupBreaks
            | EndFitsExpanded
            | EndVerbatim
            | EndLineSuffix
            | EndBestFittingEntry
            | EndFill),
        ) =&gt; {
            stack.pop(tag.kind())?;
        }
    };

    Ok(())
}
</t>
<t tx="ekr.20231101055917.557">fn fits(&amp;mut self, queue: &amp;PrintQueue&lt;'a&gt;, stack: &amp;PrintCallStack) -&gt; PrintResult&lt;bool&gt; {
    let mut measure = FitsMeasurer::new(queue, stack, self);
    let result = measure.fits(&amp;mut AllPredicate);
    measure.finish();
    result
}
</t>
<t tx="ekr.20231101055917.558">fn flat_group_print_mode(
    &amp;mut self,
    kind: TagKind,
    id: Option&lt;GroupId&gt;,
    args: PrintElementArgs,
    queue: &amp;PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
) -&gt; PrintResult&lt;PrintMode&gt; {
    let print_mode = match args.mode() {
        PrintMode::Flat if self.state.measured_group_fits =&gt; {
            // A parent group has already verified that this group fits on a single line
            // Thus, just continue in flat mode
            PrintMode::Flat
        }
        // The printer is either in expanded mode or it's necessary to re-measure if the group fits
        // because the printer printed a line break
        _ =&gt; {
            self.state.measured_group_fits = true;

            if let Some(id) = id {
                self.state
                    .group_modes
                    .insert_print_mode(id, PrintMode::Flat);
            }

            // Measure to see if the group fits up on a single line. If that's the case,
            // print the group in "flat" mode, otherwise continue in expanded mode
            stack.push(kind, args.with_print_mode(PrintMode::Flat));
            let fits = self.fits(queue, stack)?;
            stack.pop(kind)?;

            if fits {
                PrintMode::Flat
            } else {
                PrintMode::Expanded
            }
        }
    };

    Ok(print_mode)
}
</t>
<t tx="ekr.20231101055917.559">fn print_text(&amp;mut self, text: Text, source_range: Option&lt;TextRange&gt;) {
    if !self.state.pending_indent.is_empty() {
        let (indent_char, repeat_count) = match self.options.indent_style() {
            IndentStyle::Tab =&gt; ('\t', 1),
            IndentStyle::Space =&gt; (' ', self.options.indent_width()),
        };

        let indent = std::mem::take(&amp;mut self.state.pending_indent);
        let total_indent_char_count = indent.level() as usize * repeat_count as usize;

        self.state
            .buffer
            .reserve(total_indent_char_count + indent.align() as usize);

        for _ in 0..total_indent_char_count {
            self.print_char(indent_char);
        }

        for _ in 0..indent.align() {
            self.print_char(' ');
        }
    }

    // Insert source map markers before and after the token
    //
    // If the token has source position information the start marker
    // will use the start position of the original token, and the end
    // marker will use that position + the text length of the token
    //
    // If the token has no source position (was created by the formatter)
    // both the start and end marker will use the last known position
    // in the input source (from state.source_position)
    if let Some(range) = source_range {
        self.state.source_position = range.start();
    }

    self.push_marker();

    match text {
        #[allow(clippy::cast_possible_truncation)]
        Text::Token(token) =&gt; {
            self.state.buffer.push_str(token);
            self.state.line_width += token.len() as u32;
        }
        Text::Text {
            text,
            text_width: width,
        } =&gt; {
            if let Some(width) = width.width() {
                self.state.buffer.push_str(text);
                self.state.line_width += width.value();
            } else {
                for char in text.chars() {
                    self.print_char(char);
                }
            }
        }
    }

    if let Some(range) = source_range {
        self.state.source_position = range.end();
    }

    self.push_marker();
}
</t>
<t tx="ekr.20231101055917.56">impl&lt;Context&gt; DerefMut for VecBuffer&lt;'_, Context&gt; {
    fn deref_mut(&amp;mut self) -&gt; &amp;mut Self::Target {
        &amp;mut self.elements
    }
}
</t>
<t tx="ekr.20231101055917.560">fn push_marker(&amp;mut self) {
    if self.options.source_map_generation.is_disabled() {
        return;
    }

    let marker = SourceMarker {
        source: self.state.source_position,
        dest: self.state.buffer.text_len(),
    };

    if let Some(last) = self.state.source_markers.last() {
        if last != &amp;marker {
            self.state.source_markers.push(marker);
        }
    } else {
        self.state.source_markers.push(marker);
    }
}
</t>
<t tx="ekr.20231101055917.561">fn flush_line_suffixes(
    &amp;mut self,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
    line_break: Option&lt;&amp;'a FormatElement&gt;,
) -&gt; bool {
    let suffixes = self.state.line_suffixes.take_pending();

    if suffixes.len() &gt; 0 {
        // Print this line break element again once all the line suffixes have been flushed
        if let Some(line_break) = line_break {
            queue.push(line_break);
        }

        for entry in suffixes.rev() {
            match entry {
                LineSuffixEntry::Suffix(suffix) =&gt; {
                    queue.push(suffix);
                }
                LineSuffixEntry::Args(args) =&gt; {
                    const LINE_SUFFIX_END: &amp;FormatElement =
                        &amp;FormatElement::Tag(Tag::EndLineSuffix);

                    stack.push(TagKind::LineSuffix, args);

                    queue.push(LINE_SUFFIX_END);
                }
            }
        }

        true
    } else {
        false
    }
}
</t>
<t tx="ekr.20231101055917.562">fn print_best_fitting(
    &amp;mut self,
    variants: &amp;'a BestFittingVariants,
    mode: BestFittingMode,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
) -&gt; PrintResult&lt;()&gt; {
    let args = stack.top();

    if args.mode().is_flat() &amp;&amp; self.state.measured_group_fits {
        queue.extend_back(variants.most_flat());
        self.print_entry(queue, stack, args, TagKind::BestFittingEntry)
    } else {
        self.state.measured_group_fits = true;
        let mut variants_iter = variants.into_iter();
        let mut current = variants_iter.next().unwrap();

        for next in variants_iter {
            // Test if this variant fits and if so, use it. Otherwise try the next
            // variant.

            // Try to fit only the first variant on a single line
            if !matches!(
                current.first(),
                Some(&amp;FormatElement::Tag(Tag::StartBestFittingEntry))
            ) {
                return invalid_start_tag(TagKind::BestFittingEntry, current.first());
            }

            // Skip the first element because we want to override the args for the entry and the
            // args must be popped from the stack as soon as it sees the matching end entry.
            let content = &amp;current[1..];

            let entry_args = args
                .with_print_mode(PrintMode::Flat)
                .with_measure_mode(MeasureMode::from(mode));

            queue.extend_back(content);
            stack.push(TagKind::BestFittingEntry, entry_args);
            let variant_fits = self.fits(queue, stack)?;
            stack.pop(TagKind::BestFittingEntry)?;

            // Remove the content slice because printing needs the variant WITH the start entry
            let popped_slice = queue.pop_slice();
            debug_assert_eq!(popped_slice, Some(content));

            if variant_fits {
                queue.extend_back(current);
                return self.print_entry(
                    queue,
                    stack,
                    args.with_print_mode(PrintMode::Flat),
                    TagKind::BestFittingEntry,
                );
            }

            current = next;
        }

        // At this stage current is the most expanded.

        // No variant fits, take the last (most expanded) as fallback
        queue.extend_back(current);
        self.print_entry(
            queue,
            stack,
            args.with_print_mode(PrintMode::Expanded),
            TagKind::BestFittingEntry,
        )
    }
}
</t>
<t tx="ekr.20231101055917.563">/// Tries to fit as much content as possible on a single line.
///
/// `Fill` is a sequence of *item*, *separator*, *item*, *separator*, *item*, ... entries.
/// The goal is to fit as many items (with their separators) on a single line as possible and
/// first expand the *separator* if the content exceeds the print width and only fallback to expanding
/// the *item*s if the *item* or the *item* and the expanded *separator* don't fit on the line.
///
/// The implementation handles the following 5 cases:
///
/// - The *item*, *separator*, and the *next item* fit on the same line.
///   Print the *item* and *separator* in flat mode.
/// - The *item* and *separator* fit on the line but there's not enough space for the *next item*.
///   Print the *item* in flat mode and the *separator* in expanded mode.
/// - The *item* fits on the line but the *separator* does not in flat mode.
///   Print the *item* in flat mode and the *separator* in expanded mode.
/// - The *item* fits on the line but the *separator* does not in flat **NOR** expanded mode.
///   Print the *item* and *separator* in expanded mode.
/// - The *item* does not fit on the line.
///   Print the *item* and *separator* in expanded mode.
fn print_fill_entries(
    &amp;mut self,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
) -&gt; PrintResult&lt;()&gt; {
    let args = stack.top();

    // It's already known that the content fit, print all items in flat mode.
    if self.state.measured_group_fits &amp;&amp; args.mode().is_flat() {
        stack.push(TagKind::Fill, args.with_print_mode(PrintMode::Flat));
        return Ok(());
    }

    stack.push(TagKind::Fill, args);

    while matches!(queue.top(), Some(FormatElement::Tag(Tag::StartEntry))) {
        let mut measurer = FitsMeasurer::new_flat(queue, stack, self);

        // The number of item/separator pairs that fit on the same line.
        let mut flat_pairs = 0usize;
        let mut item_fits = measurer.fill_item_fits()?;

        let last_pair_layout = if item_fits {
            // Measure the remaining pairs until the first item or separator that does not fit (or the end of the fill element).
            // Optimisation to avoid re-measuring the next-item twice:
            // * Once when measuring if the *item*, *separator*, *next-item* fit
            // * A second time when measuring if *next-item*, *separator*, *next-next-item* fit.
            loop {
                // Item that fits without a following separator.
                if !matches!(
                    measurer.queue.top(),
                    Some(FormatElement::Tag(Tag::StartEntry))
                ) {
                    break FillPairLayout::Flat;
                }

                let separator_fits = measurer.fill_separator_fits(PrintMode::Flat)?;

                // Item fits but the flat separator does not.
                if !separator_fits {
                    break FillPairLayout::ItemMaybeFlat;
                }

                // Last item/separator pair that both fit
                if !matches!(
                    measurer.queue.top(),
                    Some(FormatElement::Tag(Tag::StartEntry))
                ) {
                    break FillPairLayout::Flat;
                }

                item_fits = measurer.fill_item_fits()?;

                if item_fits {
                    flat_pairs += 1;
                } else {
                    // Item and separator both fit, but the next element doesn't.
                    // Print the separator in expanded mode and then re-measure if the item now
                    // fits in the next iteration of the outer loop.
                    break FillPairLayout::ItemFlatSeparatorExpanded;
                }
            }
        } else {
            // Neither item nor separator fit, print both in expanded mode.
            FillPairLayout::Expanded
        };

        measurer.finish();

        self.state.measured_group_fits = true;

        // Print all pairs that fit in flat mode.
        for _ in 0..flat_pairs {
            self.print_fill_item(queue, stack, args.with_print_mode(PrintMode::Flat))?;
            self.print_fill_separator(queue, stack, args.with_print_mode(PrintMode::Flat))?;
        }

        let item_mode = match last_pair_layout {
            FillPairLayout::Flat | FillPairLayout::ItemFlatSeparatorExpanded =&gt; PrintMode::Flat,
            FillPairLayout::Expanded =&gt; PrintMode::Expanded,
            FillPairLayout::ItemMaybeFlat =&gt; {
                let mut measurer = FitsMeasurer::new_flat(queue, stack, self);
                // SAFETY: That the item fits is guaranteed by `ItemMaybeFlat`.
                // Re-measuring is required to get the measurer in the correct state for measuring the separator.
                assert!(measurer.fill_item_fits()?);
                let separator_fits = measurer.fill_separator_fits(PrintMode::Expanded)?;
                measurer.finish();

                if separator_fits {
                    PrintMode::Flat
                } else {
                    PrintMode::Expanded
                }
            }
        };

        self.print_fill_item(queue, stack, args.with_print_mode(item_mode))?;

        if matches!(queue.top(), Some(FormatElement::Tag(Tag::StartEntry))) {
            let separator_mode = match last_pair_layout {
                FillPairLayout::Flat =&gt; PrintMode::Flat,
                FillPairLayout::ItemFlatSeparatorExpanded
                | FillPairLayout::Expanded
                | FillPairLayout::ItemMaybeFlat =&gt; PrintMode::Expanded,
            };

            // Push a new stack frame with print mode `Flat` for the case where the separator gets printed in expanded mode
            // but does contain a group to ensure that the group will measure "fits" with the "flat" versions of the next item/separator.
            stack.push(TagKind::Fill, args.with_print_mode(PrintMode::Flat));
            self.print_fill_separator(queue, stack, args.with_print_mode(separator_mode))?;
            stack.pop(TagKind::Fill)?;
        }
    }

    if queue.top() == Some(&amp;FormatElement::Tag(Tag::EndFill)) {
        Ok(())
    } else {
        invalid_end_tag(TagKind::Fill, stack.top_kind())
    }
}
</t>
<t tx="ekr.20231101055917.564">/// Semantic alias for [`Self::print_entry`] for fill items.
fn print_fill_item(
    &amp;mut self,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
    args: PrintElementArgs,
) -&gt; PrintResult&lt;()&gt; {
    self.print_entry(queue, stack, args, TagKind::Entry)
}
</t>
<t tx="ekr.20231101055917.565">/// Semantic alias for [`Self::print_entry`] for fill separators.
fn print_fill_separator(
    &amp;mut self,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
    args: PrintElementArgs,
) -&gt; PrintResult&lt;()&gt; {
    self.print_entry(queue, stack, args, TagKind::Entry)
}
</t>
<t tx="ekr.20231101055917.566">/// Fully print an element (print the element itself and all its descendants)
///
/// Unlike [`print_element`], this function ensures the entire element has
/// been printed when it returns and the queue is back to its original state
fn print_entry(
    &amp;mut self,
    queue: &amp;mut PrintQueue&lt;'a&gt;,
    stack: &amp;mut PrintCallStack,
    args: PrintElementArgs,
    kind: TagKind,
) -&gt; PrintResult&lt;()&gt; {
    let start_entry = queue.top();

    if queue
        .pop()
        .is_some_and(|start| start.tag_kind() == Some(kind))
    {
        stack.push(kind, args);
    } else {
        return invalid_start_tag(kind, start_entry);
    }

    let mut depth = 1u32;

    while let Some(element) = queue.pop() {
        match element {
            FormatElement::Tag(Tag::StartEntry | Tag::StartBestFittingEntry) =&gt; {
                depth += 1;
            }
            FormatElement::Tag(end_tag @ (Tag::EndEntry | Tag::EndBestFittingEntry)) =&gt; {
                depth -= 1;
                // Reached the end entry, pop the entry from the stack and return.
                if depth == 0 {
                    stack.pop(end_tag.kind())?;
                    return Ok(());
                }
            }
            _ =&gt; {
                // Fall through
            }
        }

        self.print_element(stack, queue, element)?;
    }

    invalid_end_tag(kind, stack.top_kind())
}
</t>
<t tx="ekr.20231101055917.567">fn print_char(&amp;mut self, char: char) {
    if char == '\n' {
        self.state
            .buffer
            .push_str(self.options.line_ending.as_str());

        self.state.line_width = 0;

        // Fit's only tests if groups up to the first line break fit.
        // The next group must re-measure if it still fits.
        self.state.measured_group_fits = false;
    } else {
        self.state.buffer.push(char);

        #[allow(clippy::cast_possible_truncation)]
        let char_width = if char == '\t' {
            self.options.indent_width.value()
        } else {
            // SAFETY: A u32 is sufficient to represent the width of a file &lt;= 4GB
            char.width().unwrap_or(0) as u32
        };

        self.state.line_width += char_width;
    }
}
</t>
<t tx="ekr.20231101055917.568">#[derive(Copy, Clone, Debug)]
enum FillPairLayout {
    /// The item, separator, and next item fit. Print the first item and the separator in flat mode.
    Flat,

    /// The item and separator fit but the next element does not. Print the item in flat mode and
    /// the separator in expanded mode.
    ItemFlatSeparatorExpanded,

    /// The item does not fit. Print the item and any potential separator in expanded mode.
    Expanded,

    /// The item fits but the separator does not in flat mode. If the separator fits in expanded mode then
    /// print the item in flat and the separator in expanded mode, otherwise print both in expanded mode.
    ItemMaybeFlat,
}

/// Printer state that is global to all elements.
/// Stores the result of the print operation (buffer and mappings) and at what
/// position the printer currently is.
#[derive(Default, Debug)]
struct PrinterState&lt;'a&gt; {
    buffer: String,
    source_markers: Vec&lt;SourceMarker&gt;,
    source_position: TextSize,
    pending_indent: Indention,
    measured_group_fits: bool,
    line_width: u32,
    line_suffixes: LineSuffixes&lt;'a&gt;,
    verbatim_markers: Vec&lt;TextRange&gt;,
    group_modes: GroupModes,
    // Re-used queue to measure if a group fits. Optimisation to avoid re-allocating a new
    // vec every time a group gets measured
    fits_stack: Vec&lt;StackFrame&gt;,
    fits_queue: Vec&lt;std::slice::Iter&lt;'a, FormatElement&gt;&gt;,
}
</t>
<t tx="ekr.20231101055917.569">impl&lt;'a&gt; PrinterState&lt;'a&gt; {
    fn with_capacity(capacity: usize) -&gt; Self {
        Self {
            buffer: String::with_capacity(capacity),
            ..Self::default()
        }
    }
}
</t>
<t tx="ekr.20231101055917.571">/// Tracks the mode in which groups with ids are printed. Stores the groups at `group.id()` index.
/// This is based on the assumption that the group ids for a single document are dense.
#[derive(Debug, Default)]
struct GroupModes(Vec&lt;Option&lt;PrintMode&gt;&gt;);

impl GroupModes {
    @others
}
</t>
<t tx="ekr.20231101055917.572">fn insert_print_mode(&amp;mut self, group_id: GroupId, mode: PrintMode) {
    let index = u32::from(group_id) as usize;

    if self.0.len() &lt;= index {
        self.0.resize(index + 1, None);
    }

    self.0[index] = Some(mode);
}
</t>
<t tx="ekr.20231101055917.573">fn get_print_mode(&amp;self, group_id: GroupId) -&gt; PrintResult&lt;PrintMode&gt; {
    let index = u32::from(group_id) as usize;

    match self.0.get(index) {
        Some(Some(print_mode)) =&gt; Ok(*print_mode),
        None | Some(None) =&gt; Err(PrintError::InvalidDocument(
            InvalidDocumentError::UnknownGroupId { group_id },
        )),
    }
}
</t>
<t tx="ekr.20231101055917.574">#[derive(Copy, Clone, Eq, PartialEq, Debug)]
enum Indention {
    /// Indent the content by `count` levels by using the indention sequence specified by the printer options.
    Level(u16),

    /// Indent the content by n-`level`s using the indention sequence specified by the printer options and `align` spaces.
    Align { level: u16, align: NonZeroU8 },
}

impl Indention {
    @others
}
</t>
<t tx="ekr.20231101055917.575">const fn is_empty(self) -&gt; bool {
    matches!(self, Indention::Level(0))
}

/// Creates a new indention level with a zero-indent.
const fn new() -&gt; Self {
    Indention::Level(0)
}

/// Returns the indention level
fn level(self) -&gt; u16 {
    match self {
        Indention::Level(count) =&gt; count,
        Indention::Align { level: indent, .. } =&gt; indent,
    }
}
</t>
<t tx="ekr.20231101055917.576">/// Returns the number of trailing align spaces or 0 if none
fn align(self) -&gt; u8 {
    match self {
        Indention::Level(_) =&gt; 0,
        Indention::Align { align, .. } =&gt; align.into(),
    }
}
</t>
<t tx="ekr.20231101055917.577">/// Increments the level by one.
///
/// The behaviour depends on the [`indent_style`][IndentStyle] if this is an [`Indent::Align`]:
/// - **Tabs**: `align` is converted into an indent. This results in `level` increasing by two: once for the align, once for the level increment
/// - **Spaces**: Increments the `level` by one and keeps the `align` unchanged.
/// Keeps any  the current value is [`Indent::Align`] and increments the level by one.
fn increment_level(self, indent_style: IndentStyle) -&gt; Self {
    match self {
        Indention::Level(count) =&gt; Indention::Level(count + 1),
        // Increase the indent AND convert the align to an indent
        Indention::Align { level, .. } if indent_style.is_tab() =&gt; Indention::Level(level + 2),
        Indention::Align {
            level: indent,
            align,
        } =&gt; Indention::Align {
            level: indent + 1,
            align,
        },
    }
}
</t>
<t tx="ekr.20231101055917.578">/// Decrements the indent by one by:
/// - Reducing the level by one if this is [`Indent::Level`]
/// - Removing the `align` if this is [`Indent::Align`]
///
/// No-op if the level is already zero.
fn decrement(self) -&gt; Self {
    match self {
        Indention::Level(level) =&gt; Indention::Level(level.saturating_sub(1)),
        Indention::Align { level, .. } =&gt; Indention::Level(level),
    }
}
</t>
<t tx="ekr.20231101055917.579">/// Adds an `align` of `count` spaces to the current indention.
///
/// It increments the `level` value if the current value is [`Indent::IndentAlign`].
fn set_align(self, count: NonZeroU8) -&gt; Self {
    match self {
        Indention::Level(indent_count) =&gt; Indention::Align {
            level: indent_count,
            align: count,
        },

        // Convert the existing align to an indent
        Indention::Align { level: indent, .. } =&gt; Indention::Align {
            level: indent + 1,
            align: count,
        },
    }
}
</t>
<t tx="ekr.20231101055917.58">impl&lt;Context&gt; Buffer for VecBuffer&lt;'_, Context&gt; {
@others
}
</t>
<t tx="ekr.20231101055917.580">impl Default for Indention {
    fn default() -&gt; Self {
        Indention::new()
    }
}
</t>
<t tx="ekr.20231101055917.582">#[must_use = "FitsMeasurer must be finished."]
struct FitsMeasurer&lt;'a, 'print&gt; {
    state: FitsState,
    queue: FitsQueue&lt;'a, 'print&gt;,
    stack: FitsCallStack&lt;'print&gt;,
    printer: &amp;'print mut Printer&lt;'a&gt;,
    must_be_flat: bool,

    /// Bomb that enforces that finish is explicitly called to restore the `fits_stack` and `fits_queue` vectors.
    bomb: DebugDropBomb,
}
</t>
<t tx="ekr.20231101055917.583">impl&lt;'a, 'print&gt; FitsMeasurer&lt;'a, 'print&gt; {}

impl&lt;'a, 'print&gt; FitsMeasurer&lt;'a, 'print&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.584">fn new_flat(
    print_queue: &amp;'print PrintQueue&lt;'a&gt;,
    print_stack: &amp;'print PrintCallStack,
    printer: &amp;'print mut Printer&lt;'a&gt;,
) -&gt; Self {
    let mut measurer = Self::new(print_queue, print_stack, printer);
    measurer.must_be_flat = true;
    measurer
}
</t>
<t tx="ekr.20231101055917.585">fn new(
    print_queue: &amp;'print PrintQueue&lt;'a&gt;,
    print_stack: &amp;'print PrintCallStack,
    printer: &amp;'print mut Printer&lt;'a&gt;,
) -&gt; Self {
    let saved_stack = std::mem::take(&amp;mut printer.state.fits_stack);
    let saved_queue = std::mem::take(&amp;mut printer.state.fits_queue);
    debug_assert!(saved_stack.is_empty());
    debug_assert!(saved_queue.is_empty());

    let fits_queue = FitsQueue::new(print_queue, saved_queue);
    let fits_stack = FitsCallStack::new(print_stack, saved_stack);

    let fits_state = FitsState {
        pending_indent: printer.state.pending_indent,
        line_width: printer.state.line_width,
        has_line_suffix: printer.state.line_suffixes.has_pending(),
    };

    Self {
        state: fits_state,
        queue: fits_queue,
        stack: fits_stack,
        must_be_flat: false,
        printer,
        bomb: DebugDropBomb::new(
            "MeasurerFits must be `finished` to restore the `fits_queue` and `fits_stack`.",
        ),
    }
}
</t>
<t tx="ekr.20231101055917.586">/// Tests if it's possible to print the content of the queue up to the first hard line break
/// or the end of the document on a single line without exceeding the line width.
fn fits&lt;P&gt;(&amp;mut self, predicate: &amp;mut P) -&gt; PrintResult&lt;bool&gt;
where
    P: FitsEndPredicate,
{
    while let Some(element) = self.queue.pop() {
        match self.fits_element(element)? {
            Fits::Yes =&gt; return Ok(true),
            Fits::No =&gt; {
                return Ok(false);
            }
            Fits::Maybe =&gt; {
                if predicate.is_end(element)? {
                    break;
                }

                continue;
            }
        }
    }

    Ok(true)
}

/// Tests if the content of a `Fill` item fits in [`PrintMode::Flat`].
///
/// Returns `Err` if the top element of the queue is not a [`Tag::StartEntry`]
/// or if the document has any mismatching start/end tags.
fn fill_item_fits(&amp;mut self) -&gt; PrintResult&lt;bool&gt; {
    self.fill_entry_fits(PrintMode::Flat)
}
</t>
<t tx="ekr.20231101055917.587">/// Tests if the content of a `Fill` separator fits with `mode`.
///
/// Returns `Err` if the top element of the queue is not a [`Tag::StartEntry`]
/// or if the document has any mismatching start/end tags.
fn fill_separator_fits(&amp;mut self, mode: PrintMode) -&gt; PrintResult&lt;bool&gt; {
    self.fill_entry_fits(mode)
}
</t>
<t tx="ekr.20231101055917.588">/// Tests if the elements between the [`Tag::StartEntry`] and [`Tag::EndEntry`]
/// of a fill item or separator fits with `mode`.
///
/// Returns `Err` if the queue isn't positioned at a [`Tag::StartEntry`] or if
/// the matching [`Tag::EndEntry`] is missing.
fn fill_entry_fits(&amp;mut self, mode: PrintMode) -&gt; PrintResult&lt;bool&gt; {
    let start_entry = self.queue.top();

    if !matches!(start_entry, Some(&amp;FormatElement::Tag(Tag::StartEntry))) {
        return invalid_start_tag(TagKind::Entry, start_entry);
    }

    self.stack
        .push(TagKind::Fill, self.stack.top().with_print_mode(mode));
    let mut predicate = SingleEntryPredicate::default();
    let fits = self.fits(&amp;mut predicate)?;

    if predicate.is_done() {
        self.stack.pop(TagKind::Fill)?;
    }

    Ok(fits)
}
</t>
<t tx="ekr.20231101055917.589">/// Tests if the passed element fits on the current line or not.
fn fits_element(&amp;mut self, element: &amp;'a FormatElement) -&gt; PrintResult&lt;Fits&gt; {
    #[allow(clippy::enum_glob_use)]
    use Tag::*;

    let args = self.stack.top();

    match element {
        FormatElement::Space =&gt; return Ok(self.fits_text(Text::Token(" "), args)),

        FormatElement::Line(line_mode) =&gt; {
            match args.mode() {
                PrintMode::Flat =&gt; match line_mode {
                    LineMode::SoftOrSpace =&gt; return Ok(self.fits_text(Text::Token(" "), args)),
                    LineMode::Soft =&gt; {}
                    LineMode::Hard | LineMode::Empty =&gt; {
                        return Ok(if self.must_be_flat {
                            Fits::No
                        } else {
                            Fits::Yes
                        });
                    }
                },
                PrintMode::Expanded =&gt; {
                    match args.measure_mode() {
                        MeasureMode::FirstLine =&gt; {
                            // Reachable if the restQueue contains an element with mode expanded because Expanded
                            // is what the mode's initialized to by default
                            // This means, the printer is outside of the current element at this point and any
                            // line break should be printed as regular line break
                            return Ok(Fits::Yes);
                        }
                        MeasureMode::AllLines | MeasureMode::AllLinesAllowTextOverflow =&gt; {
                            // Continue measuring on the next line
                            self.state.line_width = 0;
                            self.state.pending_indent = args.indention();
                        }
                    }
                }
            }
        }

        FormatElement::Token { text } =&gt; return Ok(self.fits_text(Text::Token(text), args)),
        FormatElement::Text { text, text_width } =&gt; {
            return Ok(self.fits_text(
                Text::Text {
                    text,
                    text_width: *text_width,
                },
                args,
            ))
        }
        FormatElement::SourceCodeSlice { slice, text_width } =&gt; {
            let text = slice.text(self.printer.source_code);
            return Ok(self.fits_text(
                Text::Text {
                    text,
                    text_width: *text_width,
                },
                args,
            ));
        }
        FormatElement::LineSuffixBoundary =&gt; {
            if self.state.has_line_suffix {
                return Ok(Fits::No);
            }
        }

        FormatElement::ExpandParent =&gt; {
            if self.must_be_flat {
                return Ok(Fits::No);
            }
        }

        FormatElement::SourcePosition(_) =&gt; {}

        FormatElement::BestFitting { variants, mode } =&gt; {
            let (slice, args) = match args.mode() {
                PrintMode::Flat =&gt; (
                    variants.most_flat(),
                    args.with_measure_mode(MeasureMode::from(*mode)),
                ),
                PrintMode::Expanded =&gt; (variants.most_expanded(), args),
            };

            if !matches!(
                slice.first(),
                Some(FormatElement::Tag(Tag::StartBestFittingEntry))
            ) {
                return invalid_start_tag(TagKind::BestFittingEntry, slice.first());
            }

            self.stack.push(TagKind::BestFittingEntry, args);
            self.queue.extend_back(&amp;slice[1..]);
        }

        FormatElement::Interned(content) =&gt; self.queue.extend_back(content),

        FormatElement::Tag(StartIndent) =&gt; {
            self.stack.push(
                TagKind::Indent,
                args.increment_indent_level(self.options().indent_style()),
            );
        }

        FormatElement::Tag(StartDedent(mode)) =&gt; {
            let args = match mode {
                DedentMode::Level =&gt; args.decrement_indent(),
                DedentMode::Root =&gt; args.reset_indent(),
            };
            self.stack.push(TagKind::Dedent, args);
        }

        FormatElement::Tag(StartAlign(align)) =&gt; {
            self.stack
                .push(TagKind::Align, args.set_indent_align(align.count()));
        }

        FormatElement::Tag(StartGroup(group)) =&gt; {
            return Ok(self.fits_group(TagKind::Group, group.mode(), group.id(), args));
        }

        FormatElement::Tag(StartBestFitParenthesize { id }) =&gt; {
            if let Some(id) = id {
                self.printer
                    .state
                    .group_modes
                    .insert_print_mode(*id, args.mode());
            }

            // Don't use the parenthesized with indent layout even when measuring expanded mode similar to `BestFitting`.
            // This is to expand the left and not right after the `(` parentheses (it is okay to expand after the content that it wraps).
            self.stack.push(TagKind::BestFitParenthesize, args);
        }

        FormatElement::Tag(EndBestFitParenthesize) =&gt; {
            // If this is the end tag of the outer most parentheses for which we measure if it fits,
            // pop the indent.
            if args.mode().is_expanded() &amp;&amp; self.stack.top_kind() == Some(TagKind::Indent) {
                self.stack.pop(TagKind::Indent).unwrap();
                let unindented = self.stack.pop(TagKind::BestFitParenthesize)?;

                // There's a hard line break after the indent but don't return `Fits::Yes` here
                // to ensure any trailing comments (that, unfortunately, are attached to the statement and not the expression)
                // fit too.
                self.state.line_width = 0;
                self.state.pending_indent = unindented.indention();

                return Ok(self.fits_text(Text::Token(")"), unindented));
            }

            self.stack.pop(TagKind::BestFitParenthesize)?;
        }

        FormatElement::Tag(StartConditionalGroup(group)) =&gt; {
            let condition = group.condition();

            let print_mode = match condition.group_id {
                None =&gt; args.mode(),
                Some(group_id) =&gt; self.group_modes().get_print_mode(group_id)?,
            };

            if condition.mode == print_mode {
                return Ok(self.fits_group(
                    TagKind::ConditionalGroup,
                    group.mode(),
                    None,
                    args,
                ));
            }
            self.stack.push(TagKind::ConditionalGroup, args);
        }

        FormatElement::Tag(StartConditionalContent(condition)) =&gt; {
            let print_mode = match condition.group_id {
                None =&gt; args.mode(),
                Some(group_id) =&gt; self.group_modes().get_print_mode(group_id)?,
            };

            if condition.mode == print_mode {
                self.stack.push(TagKind::ConditionalContent, args);
            } else {
                self.queue.skip_content(TagKind::ConditionalContent);
            }
        }

        FormatElement::Tag(StartIndentIfGroupBreaks(id)) =&gt; {
            let print_mode = self.group_modes().get_print_mode(*id)?;

            match print_mode {
                PrintMode::Flat =&gt; {
                    self.stack.push(TagKind::IndentIfGroupBreaks, args);
                }
                PrintMode::Expanded =&gt; {
                    self.stack.push(
                        TagKind::IndentIfGroupBreaks,
                        args.increment_indent_level(self.options().indent_style()),
                    );
                }
            }
        }

        FormatElement::Tag(StartLineSuffix { reserved_width }) =&gt; {
            if *reserved_width &gt; 0 {
                self.state.line_width += reserved_width;
                if self.state.line_width &gt; self.options().line_width.into() {
                    return Ok(Fits::No);
                }
            }
            self.queue.skip_content(TagKind::LineSuffix);
            self.state.has_line_suffix = true;
        }

        FormatElement::Tag(EndLineSuffix) =&gt; {
            return invalid_end_tag(TagKind::LineSuffix, self.stack.top_kind());
        }

        FormatElement::Tag(StartFitsExpanded(tag::FitsExpanded {
            condition,
            propagate_expand,
        })) =&gt; {
            match args.mode() {
                PrintMode::Expanded =&gt; {
                    // As usual, nothing to measure
                    self.stack.push(TagKind::FitsExpanded, args);
                }
                PrintMode::Flat =&gt; {
                    let condition_met = match condition {
                        Some(condition) =&gt; {
                            let group_mode = match condition.group_id {
                                Some(group_id) =&gt; {
                                    self.group_modes().get_print_mode(group_id)?
                                }
                                None =&gt; args.mode(),
                            };

                            condition.mode == group_mode
                        }
                        None =&gt; true,
                    };

                    if condition_met {
                        // Measure in fully expanded mode and allow overflows
                        self.stack.push(
                            TagKind::FitsExpanded,
                            args.with_measure_mode(MeasureMode::AllLinesAllowTextOverflow)
                                .with_print_mode(PrintMode::Expanded),
                        );
                    } else {
                        if propagate_expand.get() {
                            return Ok(Fits::No);
                        }

                        // As usual
                        self.stack.push(TagKind::FitsExpanded, args);
                    }
                }
            }
        }

        FormatElement::Tag(
            tag @ (StartFill
            | StartVerbatim(_)
            | StartLabelled(_)
            | StartEntry
            | StartBestFittingEntry { .. }),
        ) =&gt; {
            self.stack.push(tag.kind(), args);
        }

        FormatElement::Tag(
            tag @ (EndFill
            | EndVerbatim
            | EndLabelled
            | EndEntry
            | EndGroup
            | EndConditionalGroup
            | EndIndentIfGroupBreaks
            | EndConditionalContent
            | EndAlign
            | EndDedent
            | EndIndent
            | EndBestFittingEntry
            | EndFitsExpanded),
        ) =&gt; {
            self.stack.pop(tag.kind())?;
        }
    }

    Ok(Fits::Maybe)
}
</t>
<t tx="ekr.20231101055917.59">    type Context = Context;

    fn write_element(&amp;mut self, element: FormatElement) {
        self.elements.push(element);
    }
</t>
<t tx="ekr.20231101055917.590">fn fits_group(
    &amp;mut self,
    kind: TagKind,
    group_mode: GroupMode,
    id: Option&lt;GroupId&gt;,
    args: PrintElementArgs,
) -&gt; Fits {
    if self.must_be_flat &amp;&amp; !group_mode.is_flat() {
        return Fits::No;
    }

    // Continue printing groups in expanded mode if measuring a `best_fitting` element where
    // a group expands.
    let print_mode = if group_mode.is_flat() {
        args.mode()
    } else {
        PrintMode::Expanded
    };

    self.stack.push(kind, args.with_print_mode(print_mode));

    if let Some(id) = id {
        self.group_modes_mut().insert_print_mode(id, print_mode);
    }

    Fits::Maybe
}
</t>
<t tx="ekr.20231101055917.591">fn fits_text(&amp;mut self, text: Text, args: PrintElementArgs) -&gt; Fits {
    let indent = std::mem::take(&amp;mut self.state.pending_indent);
    self.state.line_width +=
        u32::from(indent.level()) * self.options().indent_width() + u32::from(indent.align());

    match text {
        #[allow(clippy::cast_possible_truncation)]
        Text::Token(token) =&gt; {
            self.state.line_width += token.len() as u32;
        }
        Text::Text { text, text_width } =&gt; {
            if let Some(width) = text_width.width() {
                self.state.line_width += width.value();
            } else {
                for c in text.chars() {
                    let char_width = match c {
                        '\t' =&gt; self.options().indent_width.value(),
                        '\n' =&gt; {
                            if self.must_be_flat {
                                return Fits::No;
                            }
                            match args.measure_mode() {
                                MeasureMode::FirstLine =&gt; return Fits::Yes,
                                MeasureMode::AllLines
                                | MeasureMode::AllLinesAllowTextOverflow =&gt; {
                                    self.state.line_width = 0;
                                    continue;
                                }
                            }
                        }
                        // SAFETY: A u32 is sufficient to format files &lt;= 4GB
                        #[allow(clippy::cast_possible_truncation)]
                        c =&gt; c.width().unwrap_or(0) as u32,
                    };
                    self.state.line_width += char_width;
                }
            }
        }
    }

    if self.state.line_width &gt; self.options().line_width.into()
        &amp;&amp; !args.measure_mode().allows_text_overflow()
    {
        return Fits::No;
    }

    Fits::Maybe
}
</t>
<t tx="ekr.20231101055917.592">fn finish(mut self) {
    self.bomb.defuse();

    let mut queue = self.queue.finish();
    queue.clear();
    self.printer.state.fits_queue = queue;

    let mut stack = self.stack.finish();
    stack.clear();
    self.printer.state.fits_stack = stack;
}
</t>
<t tx="ekr.20231101055917.593">fn options(&amp;self) -&gt; &amp;PrinterOptions {
    &amp;self.printer.options
}
</t>
<t tx="ekr.20231101055917.594">fn group_modes(&amp;self) -&gt; &amp;GroupModes {
    &amp;self.printer.state.group_modes
}
</t>
<t tx="ekr.20231101055917.595">fn group_modes_mut(&amp;mut self) -&gt; &amp;mut GroupModes {
    &amp;mut self.printer.state.group_modes
}
</t>
<t tx="ekr.20231101055917.596">#[cold]
fn invalid_end_tag&lt;R&gt;(end_tag: TagKind, start_tag: Option&lt;TagKind&gt;) -&gt; PrintResult&lt;R&gt; {
    Err(PrintError::InvalidDocument(match start_tag {
        None =&gt; InvalidDocumentError::StartTagMissing { kind: end_tag },
        Some(kind) =&gt; InvalidDocumentError::StartEndTagMismatch {
            start_kind: end_tag,
            end_kind: kind,
        },
    }))
}

#[cold]
fn invalid_start_tag&lt;R&gt;(expected: TagKind, actual: Option&lt;&amp;FormatElement&gt;) -&gt; PrintResult&lt;R&gt; {
    let start = match actual {
        None =&gt; ActualStart::EndOfDocument,
        Some(FormatElement::Tag(tag)) =&gt; {
            if tag.is_start() {
                ActualStart::Start(tag.kind())
            } else {
                ActualStart::End(tag.kind())
            }
        }
        Some(_) =&gt; ActualStart::Content,
    };

    Err(PrintError::InvalidDocument(
        InvalidDocumentError::ExpectedStart {
            actual: start,
            expected_start: expected,
        },
    ))
}

#[derive(Copy, Clone, Debug, Eq, PartialEq)]
enum Fits {
    // Element fits
    Yes,
    // Element doesn't fit
    No,
    // Element may fit, depends on the elements following it
    Maybe,
}

impl From&lt;bool&gt; for Fits {
    fn from(value: bool) -&gt; Self {
        if value {
            Fits::Yes
        } else {
            Fits::No
        }
    }
}
</t>
<t tx="ekr.20231101055917.598">/// State used when measuring if a group fits on a single line
#[derive(Debug)]
struct FitsState {
    pending_indent: Indention,
    has_line_suffix: bool,
    line_width: u32,
}
</t>
<t tx="ekr.20231101055917.599">#[derive(Copy, Clone, Debug, Eq, PartialEq)]
enum MeasureMode {
    /// The content fits if a hard line break or soft line break in [`PrintMode::Expanded`] is seen
    /// before exceeding the configured print width.
    /// Returns
    FirstLine,

    /// The content only fits if none of the lines exceed the print width. Lines are terminated by either
    /// a hard line break or a soft line break in [`PrintMode::Expanded`].
    AllLines,

    /// Measures all lines and allows lines to exceed the configured line width. Useful when it only matters
    /// whether the content *before* and *after* fits.
    AllLinesAllowTextOverflow,
}

impl MeasureMode {
    /// Returns `true` if this mode allows text exceeding the configured line width.
    const fn allows_text_overflow(self) -&gt; bool {
        matches!(self, MeasureMode::AllLinesAllowTextOverflow)
    }
}
</t>
<t tx="ekr.20231101055917.6">/// Used to convert this object into an object that can be formatted.
///
/// The difference to [`AsFormat`] is that this trait takes ownership of `self`.
pub trait IntoFormat&lt;Context&gt; {
    type Format: ruff_formatter::Format&lt;Context&gt;;

    fn into_format(self) -&gt; Self::Format;
}
</t>
<t tx="ekr.20231101055917.60">    fn elements(&amp;self) -&gt; &amp;[FormatElement] {
        self
    }
</t>
<t tx="ekr.20231101055917.600">impl From&lt;BestFittingMode&gt; for MeasureMode {
    fn from(value: BestFittingMode) -&gt; Self {
        match value {
            BestFittingMode::FirstLine =&gt; Self::FirstLine,
            BestFittingMode::AllLines =&gt; Self::AllLines,
        }
    }
}
</t>
<t tx="ekr.20231101055917.602">#[derive(Copy, Clone, Debug)]
enum Text&lt;'a&gt; {
    /// ASCII only text that contains no line breaks or tab characters.
    Token(&amp;'a str),
    /// Arbitrary text. May contain `\n` line breaks, tab characters, or unicode characters.
    Text {
        text: &amp;'a str,
        text_width: TextWidth,
    },
}

#[cfg(test)]
mod tests {
@others
}
</t>
<t tx="ekr.20231101055917.603">    use crate::prelude::*;
    use crate::printer::{LineEnding, Printer, PrinterOptions};
    use crate::source_code::SourceCode;
    use crate::{
        format_args, write, Document, FormatState, IndentStyle, IndentWidth, LineWidth, Printed,
        VecBuffer,
    };

    fn format(root: &amp;dyn Format&lt;SimpleFormatContext&gt;) -&gt; Printed {
        format_with_options(
            root,
            PrinterOptions {
                indent_style: IndentStyle::Space,
                ..PrinterOptions::default()
            },
        )
    }
</t>
<t tx="ekr.20231101055917.604">    fn format_with_options(
        root: &amp;dyn Format&lt;SimpleFormatContext&gt;,
        options: PrinterOptions,
    ) -&gt; Printed {
        let formatted = crate::format!(SimpleFormatContext::default(), [root]).unwrap();

        Printer::new(SourceCode::default(), options)
            .print(formatted.document())
            .expect("Document to be valid")
    }
</t>
<t tx="ekr.20231101055917.605">    #[test]
    fn it_prints_a_group_on_a_single_line_if_it_fits() {
        let result = format(&amp;FormatArrayElements {
            items: vec![
                &amp;token("\"a\""),
                &amp;token("\"b\""),
                &amp;token("\"c\""),
                &amp;token("\"d\""),
            ],
        });

        assert_eq!(r#"["a", "b", "c", "d"]"#, result.as_code());
    }
</t>
<t tx="ekr.20231101055917.606">    #[test]
    fn it_tracks_the_indent_for_each_token() {
        let formatted = format(&amp;format_args!(
            token("a"),
            soft_block_indent(&amp;format_args!(
                token("b"),
                soft_block_indent(&amp;format_args!(
                    token("c"),
                    soft_block_indent(&amp;format_args!(token("d"), soft_line_break(), token("d"),)),
                    token("c"),
                )),
                token("b"),
            )),
            token("a")
        ));

        assert_eq!(
            r#"a
  b
    c
      d
      d
    c
  b
a"#,
            formatted.as_code()
        );
    }
</t>
<t tx="ekr.20231101055917.607">    #[test]
    fn it_converts_line_endings() {
        let options = PrinterOptions {
            line_ending: LineEnding::CarriageReturnLineFeed,
            ..PrinterOptions::default()
        };

        let result = format_with_options(
            &amp;format_args![
                token("function main() {"),
                block_indent(&amp;text("let x = `This is a multiline\nstring`;", None)),
                token("}"),
                hard_line_break()
            ],
            options,
        );

        assert_eq!(
            "function main() {\r\n\tlet x = `This is a multiline\r\nstring`;\r\n}\r\n",
            result.as_code()
        );
    }
</t>
<t tx="ekr.20231101055917.608">    #[test]
    fn it_breaks_a_group_if_a_string_contains_a_newline() {
        let result = format(&amp;FormatArrayElements {
            items: vec![
                &amp;text("`This is a string spanning\ntwo lines`", None),
                &amp;token("\"b\""),
            ],
        });

        assert_eq!(
            r#"[
  `This is a string spanning
two lines`,
  "b",
]"#,
            result.as_code()
        );
    }
</t>
<t tx="ekr.20231101055917.609">    #[test]
    fn it_breaks_a_group_if_it_contains_a_hard_line_break() {
        let result = format(&amp;group(&amp;format_args![token("a"), block_indent(&amp;token("b"))]));

        assert_eq!("a\n  b\n", result.as_code());
    }
</t>
<t tx="ekr.20231101055917.61">    fn state(&amp;self) -&gt; &amp;FormatState&lt;Self::Context&gt; {
        self.state
    }
</t>
<t tx="ekr.20231101055917.610">    #[test]
    fn it_breaks_parent_groups_if_they_dont_fit_on_a_single_line() {
        let result = format(&amp;FormatArrayElements {
            items: vec![
                &amp;token("\"a\""),
                &amp;token("\"b\""),
                &amp;token("\"c\""),
                &amp;token("\"d\""),
                &amp;FormatArrayElements {
                    items: vec![
                        &amp;token("\"0123456789\""),
                        &amp;token("\"0123456789\""),
                        &amp;token("\"0123456789\""),
                        &amp;token("\"0123456789\""),
                        &amp;token("\"0123456789\""),
                    ],
                },
            ],
        });

        assert_eq!(
            r#"[
  "a",
  "b",
  "c",
  "d",
  ["0123456789", "0123456789", "0123456789", "0123456789", "0123456789"],
]"#,
            result.as_code()
        );
    }
</t>
<t tx="ekr.20231101055917.611">    #[test]
    fn it_use_the_indent_character_specified_in_the_options() {
        let options = PrinterOptions {
            indent_style: IndentStyle::Tab,
            indent_width: IndentWidth::try_from(4).unwrap(),
            line_width: LineWidth::try_from(19).unwrap(),
            ..PrinterOptions::default()
        };

        let result = format_with_options(
            &amp;FormatArrayElements {
                items: vec![&amp;token("'a'"), &amp;token("'b'"), &amp;token("'c'"), &amp;token("'d'")],
            },
            options,
        );

        assert_eq!("[\n\t'a',\n\t\'b',\n\t\'c',\n\t'd',\n]", result.as_code());
    }
</t>
<t tx="ekr.20231101055917.612">    #[test]
    fn it_prints_consecutive_hard_lines_as_one() {
        let result = format(&amp;format_args![
            token("a"),
            hard_line_break(),
            hard_line_break(),
            hard_line_break(),
            token("b"),
        ]);

        assert_eq!("a\nb", result.as_code());
    }
</t>
<t tx="ekr.20231101055917.613">    #[test]
    fn it_prints_consecutive_empty_lines_as_many() {
        let result = format(&amp;format_args![
            token("a"),
            empty_line(),
            empty_line(),
            empty_line(),
            token("b"),
        ]);

        assert_eq!("a\n\n\n\nb", result.as_code());
    }
</t>
<t tx="ekr.20231101055917.614">    #[test]
    fn it_prints_consecutive_mixed_lines_as_many() {
        let result = format(&amp;format_args![
            token("a"),
            empty_line(),
            hard_line_break(),
            empty_line(),
            hard_line_break(),
            token("b"),
        ]);

        assert_eq!("a\n\n\nb", result.as_code());
    }
</t>
<t tx="ekr.20231101055917.615">    #[test]
    fn test_fill_breaks() {
        let mut state = FormatState::new(SimpleFormatContext::default());
        let mut buffer = VecBuffer::new(&amp;mut state);
        let mut formatter = Formatter::new(&amp;mut buffer);

        formatter
            .fill()
            // These all fit on the same line together
            .entry(
                &amp;soft_line_break_or_space(),
                &amp;format_args!(token("1"), token(",")),
            )
            .entry(
                &amp;soft_line_break_or_space(),
                &amp;format_args!(token("2"), token(",")),
            )
            .entry(
                &amp;soft_line_break_or_space(),
                &amp;format_args!(token("3"), token(",")),
            )
            // This one fits on a line by itself,
            .entry(
                &amp;soft_line_break_or_space(),
                &amp;format_args!(token("723493294"), token(",")),
            )
            // fits without breaking
            .entry(
                &amp;soft_line_break_or_space(),
                &amp;group(&amp;format_args!(
                    token("["),
                    soft_block_indent(&amp;token("5")),
                    token("],")
                )),
            )
            // this one must be printed in expanded mode to fit
            .entry(
                &amp;soft_line_break_or_space(),
                &amp;group(&amp;format_args!(
                    token("["),
                    soft_block_indent(&amp;token("123456789")),
                    token("]"),
                )),
            )
            .finish()
            .unwrap();

        let document = Document::from(buffer.into_vec());

        let printed = Printer::new(
            SourceCode::default(),
            PrinterOptions::default().with_line_width(LineWidth::try_from(10).unwrap()),
        )
        .print(&amp;document)
        .unwrap();

        assert_eq!(
            printed.as_code(),
            "1, 2, 3,\n723493294,\n[5],\n[\n\t123456789\n]"
        );
    }
</t>
<t tx="ekr.20231101055917.616">    #[test]
    fn line_suffix_printed_at_end() {
        let printed = format(&amp;format_args![
            group(&amp;format_args![
                token("["),
                soft_block_indent(&amp;format_with(|f| {
                    f.fill()
                        .entry(
                            &amp;soft_line_break_or_space(),
                            &amp;format_args!(token("1"), token(",")),
                        )
                        .entry(
                            &amp;soft_line_break_or_space(),
                            &amp;format_args!(token("2"), token(",")),
                        )
                        .entry(
                            &amp;soft_line_break_or_space(),
                            &amp;format_args!(token("3"), if_group_breaks(&amp;token(","))),
                        )
                        .finish()
                })),
                token("]")
            ]),
            token(";"),
            line_suffix(&amp;format_args![space(), token("// trailing")], 0)
        ]);

        assert_eq!(printed.as_code(), "[1, 2, 3]; // trailing");
    }
</t>
<t tx="ekr.20231101055917.617">    #[test]
    fn line_suffix_with_reserved_width() {
        let printed = format(&amp;format_args![
            group(&amp;format_args![
                token("["),
                soft_block_indent(&amp;format_with(|f| {
                    f.fill()
                        .entry(
                            &amp;soft_line_break_or_space(),
                            &amp;format_args!(token("1"), token(",")),
                        )
                        .entry(
                            &amp;soft_line_break_or_space(),
                            &amp;format_args!(token("2"), token(",")),
                        )
                        .entry(
                            &amp;soft_line_break_or_space(),
                            &amp;format_args!(token("3"), if_group_breaks(&amp;token(","))),
                        )
                        .finish()
                })),
                token("]")
            ]),
            token(";"),
            line_suffix(&amp;format_args![space(), token("// Using reserved width causes this content to not fit even though it's a line suffix element")], 93)
        ]);

        assert_eq!(printed.as_code(), "[\n  1, 2, 3\n]; // Using reserved width causes this content to not fit even though it's a line suffix element");
    }
</t>
<t tx="ekr.20231101055917.618">    #[test]
    fn conditional_with_group_id_in_fits() {
        let content = format_with(|f| {
            let group_id = f.group_id("test");
            write!(
                f,
                [
                    group(&amp;format_args![
                        token("The referenced group breaks."),
                        hard_line_break()
                    ])
                    .with_group_id(Some(group_id)),
                    group(&amp;format_args![
                        token("This group breaks because:"),
                        soft_line_break_or_space(),
                        if_group_fits_on_line(&amp;token("This content fits but should not be printed.")).with_group_id(Some(group_id)),
                        if_group_breaks(&amp;token("It measures with the 'if_group_breaks' variant because the referenced group breaks and that's just way too much text.")).with_group_id(Some(group_id)),
                    ])
                ]
            )
        });

        let printed = format(&amp;content);

        assert_eq!(printed.as_code(), "The referenced group breaks.\nThis group breaks because:\nIt measures with the 'if_group_breaks' variant because the referenced group breaks and that's just way too much text.");
    }
</t>
<t tx="ekr.20231101055917.619">    #[test]
    fn out_of_order_group_ids() {
        let content = format_with(|f| {
            let id_1 = f.group_id("id-1");
            let id_2 = f.group_id("id-2");

            write!(
                f,
                [
                    group(&amp;token("Group with id-2")).with_group_id(Some(id_2)),
                    hard_line_break()
                ]
            )?;

            write!(
                f,
                [
                    group(&amp;token("Group with id-1 does not fit on the line because it exceeds the line width of 80 characters by")).with_group_id(Some(id_1)),
                    hard_line_break()
                ]
            )?;

            write!(
                f,
                [
                    if_group_fits_on_line(&amp;token("Group 2 fits")).with_group_id(Some(id_2)),
                    hard_line_break(),
                    if_group_breaks(&amp;token("Group 1 breaks")).with_group_id(Some(id_1))
                ]
            )
        });

        let printed = format(&amp;content);

        assert_eq!(
            printed.as_code(),
            r#"Group with id-2
Group with id-1 does not fit on the line because it exceeds the line width of 80 characters by
Group 2 fits
Group 1 breaks"#
        );
    }
</t>
<t tx="ekr.20231101055917.62">    fn state_mut(&amp;mut self) -&gt; &amp;mut FormatState&lt;Self::Context&gt; {
        self.state
    }
</t>
<t tx="ekr.20231101055917.620">    struct FormatArrayElements&lt;'a&gt; {
        items: Vec&lt;&amp;'a dyn Format&lt;SimpleFormatContext&gt;&gt;,
    }
</t>
<t tx="ekr.20231101055917.621">    impl Format&lt;SimpleFormatContext&gt; for FormatArrayElements&lt;'_&gt; {
        @others
    }
</t>
<t tx="ekr.20231101055917.622">fn fmt(&amp;self, f: &amp;mut Formatter&lt;SimpleFormatContext&gt;) -&gt; FormatResult&lt;()&gt; {
    write!(
        f,
        [group(&amp;format_args!(
            token("["),
            soft_block_indent(&amp;format_args!(
                format_with(|f| f
                    .join_with(format_args!(token(","), soft_line_break_or_space()))
                    .entries(&amp;self.items)
                    .finish()),
                if_group_breaks(&amp;token(",")),
            )),
            token("]")
        ))]
    )
}
</t>
<t tx="ekr.20231101055917.623">use crate::format_element::tag::TagKind;
use crate::prelude::Tag;
use crate::printer::{invalid_end_tag, invalid_start_tag};
use crate::{FormatElement, PrintResult};
use std::fmt::Debug;
use std::iter::FusedIterator;
use std::marker::PhantomData;

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.624">/// Queue of [`FormatElement`]s.
pub(super) trait Queue&lt;'a&gt; {
    /// Pops the element at the end of the queue.
    fn pop(&amp;mut self) -&gt; Option&lt;&amp;'a FormatElement&gt;;

    /// Returns the next element, not traversing into [`FormatElement::Interned`].
    fn top_with_interned(&amp;self) -&gt; Option&lt;&amp;'a FormatElement&gt;;

    /// Returns the next element, recursively resolving the first element of [`FormatElement::Interned`].
    fn top(&amp;self) -&gt; Option&lt;&amp;'a FormatElement&gt; {
        let mut top = self.top_with_interned();

        while let Some(FormatElement::Interned(interned)) = top {
            top = interned.first();
        }

        top
    }
</t>
<t tx="ekr.20231101055917.625">    /// Queues a single element to process before the other elements in this queue.
    fn push(&amp;mut self, element: &amp;'a FormatElement) {
        self.extend_back(std::slice::from_ref(element));
    }
</t>
<t tx="ekr.20231101055917.626">    /// Queues a slice of elements to process before the other elements in this queue.
    fn extend_back(&amp;mut self, elements: &amp;'a [FormatElement]);

    /// Removes top slice.
    fn pop_slice(&amp;mut self) -&gt; Option&lt;&amp;'a [FormatElement]&gt;;

    /// Skips all content until it finds the corresponding end tag with the given kind.
    fn skip_content(&amp;mut self, kind: TagKind)
    where
        Self: Sized,
    {
        let iter = self.iter_content(kind);

        for _ in iter {
            // consume whole iterator until end
        }
    }
</t>
<t tx="ekr.20231101055917.627">    /// Iterates over all elements until it finds the matching end tag of the specified kind.
    fn iter_content&lt;'q&gt;(&amp;'q mut self, kind: TagKind) -&gt; QueueContentIterator&lt;'a, 'q, Self&gt;
    where
        Self: Sized,
    {
        QueueContentIterator::new(self, kind)
    }
}

/// Queue with the elements to print.
#[derive(Debug, Default, Clone)]
pub(super) struct PrintQueue&lt;'a&gt; {
    element_slices: Vec&lt;std::slice::Iter&lt;'a, FormatElement&gt;&gt;,
}

impl&lt;'a&gt; PrintQueue&lt;'a&gt; {
    pub(super) fn new(slice: &amp;'a [FormatElement]) -&gt; Self {
        Self {
            element_slices: if slice.is_empty() {
                Vec::new()
            } else {
                vec![slice.iter()]
            },
        }
    }
}
</t>
<t tx="ekr.20231101055917.628">impl&lt;'a&gt; Queue&lt;'a&gt; for PrintQueue&lt;'a&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.629">fn pop(&amp;mut self) -&gt; Option&lt;&amp;'a FormatElement&gt; {
    let elements = self.element_slices.last_mut()?;
    elements.next().or_else(|| {
        self.element_slices.pop();
        let elements = self.element_slices.last_mut()?;
        elements.next()
    })
}
</t>
<t tx="ekr.20231101055917.63">    fn snapshot(&amp;self) -&gt; BufferSnapshot {
        BufferSnapshot::position(self.elements.len())
    }
</t>
<t tx="ekr.20231101055917.630">fn top_with_interned(&amp;self) -&gt; Option&lt;&amp;'a FormatElement&gt; {
    let mut slices = self.element_slices.iter().rev();
    let slice = slices.next()?;

    match slice.as_slice().first() {
        Some(element) =&gt; Some(element),
        None =&gt; {
            if let Some(next_elements) = slices.next() {
                next_elements.as_slice().first()
            } else {
                None
            }
        }
    }
}
</t>
<t tx="ekr.20231101055917.631">fn extend_back(&amp;mut self, elements: &amp;'a [FormatElement]) {
    if !elements.is_empty() {
        self.element_slices.push(elements.iter());
    }
}
</t>
<t tx="ekr.20231101055917.632">/// Removes top slice.
fn pop_slice(&amp;mut self) -&gt; Option&lt;&amp;'a [FormatElement]&gt; {
    self.element_slices
        .pop()
        .map(|elements| elements.as_slice())
}
</t>
<t tx="ekr.20231101055917.633">/// Queue for measuring if an element fits on the line.
///
/// The queue is a view on top of the [`PrintQueue`] because no elements should be removed
/// from the [`PrintQueue`] while measuring.
#[must_use]
#[derive(Debug)]
pub(super) struct FitsQueue&lt;'a, 'print&gt; {
    queue: PrintQueue&lt;'a&gt;,
    rest_elements: std::slice::Iter&lt;'print, std::slice::Iter&lt;'a, FormatElement&gt;&gt;,
}

impl&lt;'a, 'print&gt; FitsQueue&lt;'a, 'print&gt; {
    pub(super) fn new(
        rest_queue: &amp;'print PrintQueue&lt;'a&gt;,
        queue_vec: Vec&lt;std::slice::Iter&lt;'a, FormatElement&gt;&gt;,
    ) -&gt; Self {
        Self {
            queue: PrintQueue {
                element_slices: queue_vec,
            },
            rest_elements: rest_queue.element_slices.iter(),
        }
    }

    pub(super) fn finish(self) -&gt; Vec&lt;std::slice::Iter&lt;'a, FormatElement&gt;&gt; {
        self.queue.element_slices
    }
}
</t>
<t tx="ekr.20231101055917.634">impl&lt;'a, 'print&gt; Queue&lt;'a&gt; for FitsQueue&lt;'a, 'print&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.635">fn pop(&amp;mut self) -&gt; Option&lt;&amp;'a FormatElement&gt; {
    self.queue.pop().or_else(|| {
        if let Some(next_slice) = self.rest_elements.next_back() {
            self.queue.extend_back(next_slice.as_slice());
            self.queue.pop()
        } else {
            None
        }
    })
}
</t>
<t tx="ekr.20231101055917.636">fn top_with_interned(&amp;self) -&gt; Option&lt;&amp;'a FormatElement&gt; {
    self.queue.top_with_interned().or_else(|| {
        if let Some(next_elements) = self.rest_elements.as_slice().last() {
            next_elements.as_slice().first()
        } else {
            None
        }
    })
}
</t>
<t tx="ekr.20231101055917.637">fn extend_back(&amp;mut self, elements: &amp;'a [FormatElement]) {
    if !elements.is_empty() {
        self.queue.extend_back(elements);
    }
}
</t>
<t tx="ekr.20231101055917.638">/// Removes top slice.
fn pop_slice(&amp;mut self) -&gt; Option&lt;&amp;'a [FormatElement]&gt; {
    self.queue.pop_slice().or_else(|| {
        self.rest_elements
            .next_back()
            .map(std::slice::Iter::as_slice)
    })
}
</t>
<t tx="ekr.20231101055917.639">/// Iterator that calls [`Queue::pop`] until it reaches the end of the document.
///
/// The iterator traverses into the content of any [`FormatElement::Interned`].
pub(super) struct QueueIterator&lt;'a, 'q, Q: Queue&lt;'a&gt;&gt; {
    queue: &amp;'q mut Q,
    lifetime: PhantomData&lt;&amp;'a ()&gt;,
}

impl&lt;'a, Q&gt; Iterator for QueueIterator&lt;'a, '_, Q&gt;
where
    Q: Queue&lt;'a&gt;,
{
    type Item = &amp;'a FormatElement;
    
    fn next(&amp;mut self) -&gt; Option&lt;Self::Item&gt; {
        self.queue.pop()
    }
}
</t>
<t tx="ekr.20231101055917.64">    fn restore_snapshot(&amp;mut self, snapshot: BufferSnapshot) {
        let position = snapshot.unwrap_position();
        assert!(
            self.elements.len() &gt;= position,
            r#"Outdated snapshot. This buffer contains fewer elements than at the time the snapshot was taken.
Make sure that you take and restore the snapshot in order and that this snapshot belongs to the current buffer."#
        );

        self.elements.truncate(position);
    }
</t>
<t tx="ekr.20231101055917.641">impl&lt;'a, Q&gt; FusedIterator for QueueIterator&lt;'a, '_, Q&gt; where Q: Queue&lt;'a&gt; {}

pub(super) struct QueueContentIterator&lt;'a, 'q, Q: Queue&lt;'a&gt;&gt; {
    queue: &amp;'q mut Q,
    kind: TagKind,
    depth: usize,
    lifetime: PhantomData&lt;&amp;'a ()&gt;,
}

impl&lt;'a, 'q, Q&gt; QueueContentIterator&lt;'a, 'q, Q&gt;
where
    Q: Queue&lt;'a&gt;,
{
    fn new(queue: &amp;'q mut Q, kind: TagKind) -&gt; Self {
        Self {
            queue,
            kind,
            depth: 1,
            lifetime: PhantomData,
        }
    }
}
</t>
<t tx="ekr.20231101055917.643">impl&lt;'a, Q&gt; Iterator for QueueContentIterator&lt;'a, '_, Q&gt;
where
    Q: Queue&lt;'a&gt;,
{
    @others
}
</t>
<t tx="ekr.20231101055917.644">type Item = &amp;'a FormatElement;

fn next(&amp;mut self) -&gt; Option&lt;Self::Item&gt; {
    if self.depth == 0 {
        None
    } else {
        let mut top = self.queue.pop();

        while let Some(FormatElement::Interned(interned)) = top {
            self.queue.extend_back(interned);
            top = self.queue.pop();
        }

        match top.expect("Missing end signal.") {
            element @ FormatElement::Tag(tag) if tag.kind() == self.kind =&gt; {
                if tag.is_start() {
                    self.depth += 1;
                } else {
                    self.depth -= 1;

                    if self.depth == 0 {
                        return None;
                    }
                }

                Some(element)
            }
            element =&gt; Some(element),
        }
    }
}
</t>
<t tx="ekr.20231101055917.645">impl&lt;'a, Q&gt; FusedIterator for QueueContentIterator&lt;'a, '_, Q&gt; where Q: Queue&lt;'a&gt; {}

/// A predicate determining when to end measuring if some content fits on the line.
///
/// Called for every [`element`](FormatElement) in the [`FitsQueue`] when measuring if a content
/// fits on the line. The measuring of the content ends after the first element [`element`](FormatElement) for which this
/// predicate returns `true` (similar to a take while iterator except that it takes while the predicate returns `false`).
pub(super) trait FitsEndPredicate {
    fn is_end(&amp;mut self, element: &amp;FormatElement) -&gt; PrintResult&lt;bool&gt;;
}

/// Filter that includes all elements until it reaches the end of the document.
pub(super) struct AllPredicate;

impl FitsEndPredicate for AllPredicate {
    fn is_end(&amp;mut self, _element: &amp;FormatElement) -&gt; PrintResult&lt;bool&gt; {
        Ok(false)
    }
}
</t>
<t tx="ekr.20231101055917.647">/// Filter that takes all elements between two matching [`Tag::StartEntry`] and [`Tag::EndEntry`] tags.
#[derive(Debug)]
pub(super) enum SingleEntryPredicate {
    Entry { depth: usize },
    Done,
}

impl SingleEntryPredicate {
    pub(super) const fn is_done(&amp;self) -&gt; bool {
        matches!(self, SingleEntryPredicate::Done)
    }
}
</t>
<t tx="ekr.20231101055917.648">impl Default for SingleEntryPredicate {
    fn default() -&gt; Self {
        SingleEntryPredicate::Entry { depth: 0 }
    }
}
</t>
<t tx="ekr.20231101055917.65">/// Buffer that allows you inspecting elements as they get written to the formatter.
pub struct Inspect&lt;'inner, Context, Inspector&gt; {
    inner: &amp;'inner mut dyn Buffer&lt;Context = Context&gt;,
    inspector: Inspector,
}
</t>
<t tx="ekr.20231101055917.650">impl FitsEndPredicate for SingleEntryPredicate {
    @others
}
</t>
<t tx="ekr.20231101055917.651">fn is_end(&amp;mut self, element: &amp;FormatElement) -&gt; PrintResult&lt;bool&gt; {
    let result = match self {
        SingleEntryPredicate::Done =&gt; true,
        SingleEntryPredicate::Entry { depth } =&gt; match element {
            FormatElement::Tag(Tag::StartEntry) =&gt; {
                *depth += 1;

                false
            }
            FormatElement::Tag(Tag::EndEntry) =&gt; {
                if *depth == 0 {
                    return invalid_end_tag(TagKind::Entry, None);
                }

                *depth -= 1;

                let is_end = *depth == 0;

                if is_end {
                    *self = SingleEntryPredicate::Done;
                }

                is_end
            }
            FormatElement::Interned(_) =&gt; false,
            element if *depth == 0 =&gt; {
                return invalid_start_tag(TagKind::Entry, Some(element));
            }
            _ =&gt; false,
        },
    };

    Ok(result)
}
</t>
<t tx="ekr.20231101055917.652">#[cfg(test)]
mod tests {
    @others
}
</t>
<t tx="ekr.20231101055917.653">use crate::format_element::LineMode;
use crate::prelude::Tag;
use crate::printer::queue::{PrintQueue, Queue};
use crate::FormatElement;

#[test]
fn extend_back_pop_last() {
    let mut queue =
        PrintQueue::new(&amp;[FormatElement::Tag(Tag::StartEntry), FormatElement::Space]);

    assert_eq!(queue.pop(), Some(&amp;FormatElement::Tag(Tag::StartEntry)));

    queue.extend_back(&amp;[FormatElement::Line(LineMode::SoftOrSpace)]);

    assert_eq!(
        queue.pop(),
        Some(&amp;FormatElement::Line(LineMode::SoftOrSpace))
    );
    assert_eq!(queue.pop(), Some(&amp;FormatElement::Space));

    assert_eq!(queue.pop(), None);
}
</t>
<t tx="ekr.20231101055917.654">#[test]
fn extend_back_empty_queue() {
    let mut queue =
        PrintQueue::new(&amp;[FormatElement::Tag(Tag::StartEntry), FormatElement::Space]);

    assert_eq!(queue.pop(), Some(&amp;FormatElement::Tag(Tag::StartEntry)));
    assert_eq!(queue.pop(), Some(&amp;FormatElement::Space));

    queue.extend_back(&amp;[FormatElement::Line(LineMode::SoftOrSpace)]);

    assert_eq!(
        queue.pop(),
        Some(&amp;FormatElement::Line(LineMode::SoftOrSpace))
    );

    assert_eq!(queue.pop(), None);
}
</t>
<t tx="ekr.20231101055917.655">@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.656">/// A school book stack. Allows adding, removing, and inspecting elements at the back.
pub(super) trait Stack&lt;T&gt; {
    /// Removes the last element if any and returns it
    fn pop(&amp;mut self) -&gt; Option&lt;T&gt;;

    /// Pushes a new element at the back
    fn push(&amp;mut self, value: T);

    /// Returns the last element if any
    fn top(&amp;self) -&gt; Option&lt;&amp;T&gt;;

    /// Returns `true` if the stack is empty
    fn is_empty(&amp;self) -&gt; bool;
}

impl&lt;T&gt; Stack&lt;T&gt; for Vec&lt;T&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.657">fn pop(&amp;mut self) -&gt; Option&lt;T&gt; {
    self.pop()
}
</t>
<t tx="ekr.20231101055917.658">fn push(&amp;mut self, value: T) {
    self.push(value);
}
</t>
<t tx="ekr.20231101055917.659">fn top(&amp;self) -&gt; Option&lt;&amp;T&gt; {
    self.last()
}
</t>
<t tx="ekr.20231101055917.66">impl&lt;'inner, Context, Inspector&gt; Inspect&lt;'inner, Context, Inspector&gt; {
    fn new(inner: &amp;'inner mut dyn Buffer&lt;Context = Context&gt;, inspector: Inspector) -&gt; Self {
        Self { inner, inspector }
    }
}
</t>
<t tx="ekr.20231101055917.660">fn is_empty(&amp;self) -&gt; bool {
    self.is_empty()
}
</t>
<t tx="ekr.20231101055917.661">/// A Stack that is stacked on top of another stack. Guarantees that the underlying stack remains unchanged.
#[derive(Debug, Clone)]
pub(super) struct StackedStack&lt;'a, T&gt; {
    /// The content of the original stack.
    original: std::slice::Iter&lt;'a, T&gt;,

    /// Items that have been pushed since the creation of this stack and aren't part of the `original` stack.
    stack: Vec&lt;T&gt;,
}

impl&lt;'a, T&gt; StackedStack&lt;'a, T&gt; {
    #[cfg(test)]
    pub(super) fn new(original: &amp;'a [T]) -&gt; Self {
        Self::with_vec(original, Vec::new())
    }

    /// Creates a new stack that uses `stack` for storing its elements.
    pub(super) fn with_vec(original: &amp;'a [T], stack: Vec&lt;T&gt;) -&gt; Self {
        Self {
            original: original.iter(),
            stack,
        }
    }

    /// Returns the underlying `stack` vector.
    pub(super) fn into_vec(self) -&gt; Vec&lt;T&gt; {
        self.stack
    }
}
</t>
<t tx="ekr.20231101055917.662">impl&lt;T&gt; Stack&lt;T&gt; for StackedStack&lt;'_, T&gt;
where
    T: Copy,
{
    @others
}
</t>
<t tx="ekr.20231101055917.663">fn pop(&amp;mut self) -&gt; Option&lt;T&gt; {
    self.stack
        .pop()
        .or_else(|| self.original.next_back().copied())
}
</t>
<t tx="ekr.20231101055917.664">fn push(&amp;mut self, value: T) {
    self.stack.push(value);
}
</t>
<t tx="ekr.20231101055917.665">fn top(&amp;self) -&gt; Option&lt;&amp;T&gt; {
    self.stack
        .last()
        .or_else(|| self.original.as_slice().last())
}
</t>
<t tx="ekr.20231101055917.666">fn is_empty(&amp;self) -&gt; bool {
    self.stack.is_empty() &amp;&amp; self.original.len() == 0
}
</t>
<t tx="ekr.20231101055917.667">#[cfg(test)]
mod tests {
    @others
}
</t>
<t tx="ekr.20231101055917.668">use crate::printer::stack::{Stack, StackedStack};

#[test]
fn restore_consumed_stack() {
    let original = vec![1, 2, 3];
    let mut restorable = StackedStack::new(&amp;original);

    restorable.push(4);

    assert_eq!(restorable.pop(), Some(4));
    assert_eq!(restorable.pop(), Some(3));
    assert_eq!(restorable.pop(), Some(2));
    assert_eq!(restorable.pop(), Some(1));
    assert_eq!(restorable.pop(), None);

    assert_eq!(original, vec![1, 2, 3]);
}
</t>
<t tx="ekr.20231101055917.669">#[test]
fn restore_partially_consumed_stack() {
    let original = vec![1, 2, 3];
    let mut restorable = StackedStack::new(&amp;original);

    restorable.push(4);

    assert_eq!(restorable.pop(), Some(4));
    assert_eq!(restorable.pop(), Some(3));
    assert_eq!(restorable.pop(), Some(2));
    restorable.push(5);
    restorable.push(6);
    restorable.push(7);

    assert_eq!(original, vec![1, 2, 3]);
}
</t>
<t tx="ekr.20231101055917.670">#[test]
fn restore_stack() {
    let original = vec![1, 2, 3];
    let mut restorable = StackedStack::new(&amp;original);

    restorable.push(4);
    restorable.push(5);
    restorable.push(6);
    restorable.push(7);

    assert_eq!(restorable.pop(), Some(7));
    assert_eq!(restorable.pop(), Some(6));
    assert_eq!(restorable.pop(), Some(5));

    assert_eq!(original, vec![1, 2, 3]);
}
</t>
<t tx="ekr.20231101055917.672">use crate::{FormatOptions, IndentStyle, IndentWidth, LineWidth};

@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.673">/// Options that affect how the [`crate::Printer`] prints the format tokens
#[derive(Clone, Debug, Eq, PartialEq, Default)]
pub struct PrinterOptions {
    /// Width of a single tab character (does it equal 2, 4, ... spaces?)
    pub indent_width: IndentWidth,

    /// Whether the printer should use tabs or spaces to indent code.
    pub indent_style: IndentStyle,

    /// What's the max width of a line. Defaults to 80
    pub line_width: LineWidth,

    /// The type of line ending to apply to the printed input
    pub line_ending: LineEnding,

    /// Whether the printer should build a source map that allows mapping positions in the source document
    /// to positions in the formatted document.
    pub source_map_generation: SourceMapGeneration,
}
</t>
<t tx="ekr.20231101055917.674">impl&lt;'a, O&gt; From&lt;&amp;'a O&gt; for PrinterOptions
where
    O: FormatOptions,
{
    fn from(options: &amp;'a O) -&gt; Self {
        PrinterOptions::default()
            .with_indent(options.indent_style())
            .with_line_width(options.line_width())
    }
}
</t>
<t tx="ekr.20231101055917.676">impl PrinterOptions {
    @others
    pub(crate) fn indent_style(&amp;self) -&gt; IndentStyle {
        self.indent_style
    }

    /// Width of an indent in characters.
    pub(super) const fn indent_width(&amp;self) -&gt; u32 {
        self.indent_width.value()
    }
}
</t>
<t tx="ekr.20231101055917.677">#[must_use]
pub fn with_line_width(mut self, width: LineWidth) -&gt; Self {
    self.line_width = width;
    self
}
</t>
<t tx="ekr.20231101055917.678">#[must_use]
pub fn with_indent(mut self, style: IndentStyle) -&gt; Self {
    self.indent_style = style;

    self
}
</t>
<t tx="ekr.20231101055917.679">#[must_use]
pub fn with_tab_width(mut self, width: IndentWidth) -&gt; Self {
    self.indent_width = width;

    self
}
</t>
<t tx="ekr.20231101055917.68">impl&lt;'inner, Context, Inspector&gt; Buffer for Inspect&lt;'inner, Context, Inspector&gt;
where
    Inspector: FnMut(&amp;FormatElement),
{
    @others
}
</t>
<t tx="ekr.20231101055917.680">#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub struct PrintWidth(u16);

impl PrintWidth {
    pub fn new(width: u16) -&gt; Self {
        Self(width)
    }
}
</t>
<t tx="ekr.20231101055917.682">impl Default for PrintWidth {
    fn default() -&gt; Self {
        LineWidth::default().into()
    }
}
</t>
<t tx="ekr.20231101055917.684">impl From&lt;LineWidth&gt; for PrintWidth {
    fn from(width: LineWidth) -&gt; Self {
        Self(u16::from(width))
    }
}
</t>
<t tx="ekr.20231101055917.686">impl From&lt;PrintWidth&gt; for u32 {
    fn from(width: PrintWidth) -&gt; Self {
        u32::from(width.0)
    }
}
</t>
<t tx="ekr.20231101055917.688">impl From&lt;PrintWidth&gt; for u16 {
    fn from(width: PrintWidth) -&gt; Self {
        width.0
    }
}
</t>
<t tx="ekr.20231101055917.69">type Context = Context;

fn write_element(&amp;mut self, element: FormatElement) {
    (self.inspector)(&amp;element);
    self.inner.write_element(element);
}
</t>
<t tx="ekr.20231101055917.690">/// Configures whether the formatter and printer generate a source map that allows mapping
/// positions in the source document to positions in the formatted code.
#[derive(Copy, Clone, Debug, Eq, PartialEq, Default)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub enum SourceMapGeneration {
    /// The formatter generates no source map.
    #[default]
    Disabled,

    /// The formatter generates a source map that allows mapping positions in the source document
    /// to positions in the formatted document. The ability to map positions is useful for range formatting
    /// or when trying to identify where to move the cursor so that it matches its position in the source document.
    Enabled,
}

impl SourceMapGeneration {
    pub const fn is_enabled(self) -&gt; bool {
        matches!(self, SourceMapGeneration::Enabled)
    }

    pub const fn is_disabled(self) -&gt; bool {
        matches!(self, SourceMapGeneration::Disabled)
    }
}
</t>
<t tx="ekr.20231101055917.691">#[derive(Copy, Clone, Debug, Eq, PartialEq, Default)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub enum LineEnding {
    ///  Line Feed only (\n), common on Linux and macOS as well as inside git repos
    #[default]
    LineFeed,

    /// Carriage Return + Line Feed characters (\r\n), common on Windows
    CarriageReturnLineFeed,

    /// Carriage Return character only (\r), used very rarely
    CarriageReturn,
}

impl LineEnding {
    #[inline]
    pub const fn as_str(&amp;self) -&gt; &amp;'static str {
        match self {
            LineEnding::LineFeed =&gt; "\n",
            LineEnding::CarriageReturnLineFeed =&gt; "\r\n",
            LineEnding::CarriageReturn =&gt; "\r",
        }
    }
}
</t>
<t tx="ekr.20231101055917.7">/// Implement [`IntoFormat`] for [`Option`] when `T` implements [`IntoFormat`]
///
/// Allows to call format on optional AST fields without having to unwrap the
/// field first.
impl&lt;T, Context&gt; IntoFormat&lt;Context&gt; for Option&lt;T&gt;
where
    T: IntoFormat&lt;Context&gt;,
{
    type Format = Option&lt;T::Format&gt;;
    
    fn into_format(self) -&gt; Self::Format {
        self.map(IntoFormat::into_format)
    }
}
</t>
<t tx="ekr.20231101055917.70">fn elements(&amp;self) -&gt; &amp;[FormatElement] {
    self.inner.elements()
}
</t>
<t tx="ekr.20231101055917.71">fn state(&amp;self) -&gt; &amp;FormatState&lt;Self::Context&gt; {
    self.inner.state()
}
</t>
<t tx="ekr.20231101055917.72">fn state_mut(&amp;mut self) -&gt; &amp;mut FormatState&lt;Self::Context&gt; {
    self.inner.state_mut()
}
</t>
<t tx="ekr.20231101055917.73">fn snapshot(&amp;self) -&gt; BufferSnapshot {
    self.inner.snapshot()
}
</t>
<t tx="ekr.20231101055917.74">fn restore_snapshot(&amp;mut self, snapshot: BufferSnapshot) {
    self.inner.restore_snapshot(snapshot);
}
</t>
<t tx="ekr.20231101055917.75">/// A Buffer that removes any soft line breaks.
///
/// - Removes [`lines`](FormatElement::Line) with the mode [`Soft`](LineMode::Soft).
/// - Replaces [`lines`](FormatElement::Line) with the mode [`Soft`](LineMode::SoftOrSpace) with a [`Space`](FormatElement::Space)
///
/// # Examples
///
/// ```
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{format, write};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// use ruff_formatter::{RemoveSoftLinesBuffer, SimpleFormatContext, VecBuffer};
/// use ruff_formatter::prelude::format_with;
/// let formatted = format!(
///     SimpleFormatContext::default(),
///     [format_with(|f| {
///         let mut buffer = RemoveSoftLinesBuffer::new(f);
///
///         write!(
///             buffer,
///             [
///                 token("The next soft line or space gets replaced by a space"),
///                 soft_line_break_or_space(),
///                 token("and the line here"),
///                 soft_line_break(),
///                 token("is removed entirely.")
///             ]
///         )
///     })]
/// )?;
///
/// assert_eq!(
///     formatted.document().as_ref(),
///     &amp;[
///         FormatElement::Token { text: "The next soft line or space gets replaced by a space" },
///         FormatElement::Space,
///         FormatElement::Token { text: "and the line here" },
///         FormatElement::Token { text: "is removed entirely." }
///     ]
/// );
///
/// # Ok(())
/// # }
/// ```
pub struct RemoveSoftLinesBuffer&lt;'a, Context&gt; {
    inner: &amp;'a mut dyn Buffer&lt;Context = Context&gt;,

    /// Caches the interned elements after the soft line breaks have been removed.
    ///
    /// The `key` is the [Interned] element as it has been passed to [Self::write_element] or the child of another
    /// [Interned] element. The `value` is the matching document of the key where all soft line breaks have been removed.
    ///
    /// It's fine to not snapshot the cache. The worst that can happen is that it holds on interned elements
    /// that are now unused. But there's little harm in that and the cache is cleaned when dropping the buffer.
    interned_cache: FxHashMap&lt;Interned, Interned&gt;,
}
</t>
<t tx="ekr.20231101055917.76">impl&lt;'a, Context&gt; RemoveSoftLinesBuffer&lt;'a, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.77">/// Creates a new buffer that removes the soft line breaks before writing them into `buffer`.
pub fn new(inner: &amp;'a mut dyn Buffer&lt;Context = Context&gt;) -&gt; Self {
    Self {
        inner,
        interned_cache: FxHashMap::default(),
    }
}
</t>
<t tx="ekr.20231101055917.78">/// Removes the soft line breaks from an interned element.
fn clean_interned(&amp;mut self, interned: &amp;Interned) -&gt; Interned {
    clean_interned(interned, &amp;mut self.interned_cache)
}
</t>
<t tx="ekr.20231101055917.79">// Extracted to function to avoid monomorphization
fn clean_interned(
    interned: &amp;Interned,
    interned_cache: &amp;mut FxHashMap&lt;Interned, Interned&gt;,
) -&gt; Interned {
    if let Some(cleaned) = interned_cache.get(interned) {
        cleaned.clone()
    } else {
        // Find the first soft line break element or interned element that must be changed
        let result = interned
            .iter()
            .enumerate()
            .find_map(|(index, element)| match element {
                FormatElement::Line(LineMode::Soft | LineMode::SoftOrSpace) =&gt; {
                    let mut cleaned = Vec::new();
                    cleaned.extend_from_slice(&amp;interned[..index]);
                    Some((cleaned, &amp;interned[index..]))
                }
                FormatElement::Interned(inner) =&gt; {
                    let cleaned_inner = clean_interned(inner, interned_cache);

                    if &amp;cleaned_inner == inner {
                        None
                    } else {
                        let mut cleaned = Vec::with_capacity(interned.len());
                        cleaned.extend_from_slice(&amp;interned[..index]);
                        cleaned.push(FormatElement::Interned(cleaned_inner));
                        Some((cleaned, &amp;interned[index + 1..]))
                    }
                }

                _ =&gt; None,
            });

        let result = match result {
            // Copy the whole interned buffer so that becomes possible to change the necessary elements.
            Some((mut cleaned, rest)) =&gt; {
                for element in rest {
                    let element = match element {
                        FormatElement::Line(LineMode::Soft) =&gt; continue,
                        FormatElement::Line(LineMode::SoftOrSpace) =&gt; FormatElement::Space,
                        FormatElement::Interned(interned) =&gt; {
                            FormatElement::Interned(clean_interned(interned, interned_cache))
                        }
                        element =&gt; element.clone(),
                    };
                    cleaned.push(element);
                }

                Interned::new(cleaned)
            }
            // No change necessary, return existing interned element
            None =&gt; interned.clone(),
        };

        interned_cache.insert(interned.clone(), result.clone());
        result
    }
}
</t>
<t tx="ekr.20231101055917.80">impl&lt;Context&gt; Buffer for RemoveSoftLinesBuffer&lt;'_, Context&gt; {
    @others
}
</t>
<t tx="ekr.20231101055917.81">type Context = Context;

fn write_element(&amp;mut self, element: FormatElement) {
    let element = match element {
        FormatElement::Line(LineMode::Soft) =&gt; return,
        FormatElement::Line(LineMode::SoftOrSpace) =&gt; FormatElement::Space,
        FormatElement::Interned(interned) =&gt; {
            FormatElement::Interned(self.clean_interned(&amp;interned))
        }
        element =&gt; element,
    };

    self.inner.write_element(element);
}
</t>
<t tx="ekr.20231101055917.82">fn elements(&amp;self) -&gt; &amp;[FormatElement] {
    self.inner.elements()
}
</t>
<t tx="ekr.20231101055917.83">fn state(&amp;self) -&gt; &amp;FormatState&lt;Self::Context&gt; {
    self.inner.state()
}
</t>
<t tx="ekr.20231101055917.84">fn state_mut(&amp;mut self) -&gt; &amp;mut FormatState&lt;Self::Context&gt; {
    self.inner.state_mut()
}
</t>
<t tx="ekr.20231101055917.85">fn snapshot(&amp;self) -&gt; BufferSnapshot {
    self.inner.snapshot()
}
</t>
<t tx="ekr.20231101055917.86">fn restore_snapshot(&amp;mut self, snapshot: BufferSnapshot) {
    self.inner.restore_snapshot(snapshot);
}
</t>
<t tx="ekr.20231101055917.87">pub trait BufferExtensions: Buffer + Sized {
    @others
    /// Writes a sequence of elements into this buffer.
    fn write_elements&lt;I&gt;(&amp;mut self, elements: I)
    where
        I: IntoIterator&lt;Item = FormatElement&gt;,
    {
        for element in elements {
            self.write_element(element);
        }
    }
}
</t>
<t tx="ekr.20231101055917.88">/// Returns a new buffer that calls the passed inspector for every element that gets written to the output
#[must_use]
fn inspect&lt;F&gt;(&amp;mut self, inspector: F) -&gt; Inspect&lt;Self::Context, F&gt;
where
    F: FnMut(&amp;FormatElement),
{
    Inspect::new(self, inspector)
}

/// Starts a recording that gives you access to all elements that have been written between the start
/// and end of the recording
///
/// #Examples
///
/// ```
/// use std::ops::Deref;
/// use ruff_formatter::prelude::*;
/// use ruff_formatter::{write, format, SimpleFormatContext};
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let formatted = format!(SimpleFormatContext::default(), [format_with(|f| {
///     let mut recording = f.start_recording();
///
///     write!(recording, [token("A")])?;
///     write!(recording, [token("B")])?;
///
///     write!(recording, [format_with(|f| write!(f, [token("C"), token("D")]))])?;
///
///     let recorded = recording.stop();
///     assert_eq!(
///         recorded.deref(),
///         &amp;[
///             FormatElement::Token{ text: "A" },
///             FormatElement::Token{ text: "B" },
///             FormatElement::Token{ text: "C" },
///             FormatElement::Token{ text: "D" }
///         ]
///     );
///
///     Ok(())
/// })])?;
///
/// assert_eq!(formatted.print()?.as_code(), "ABCD");
/// # Ok(())
/// # }
/// ```
#[must_use]
fn start_recording(&amp;mut self) -&gt; Recording&lt;Self&gt; {
    Recording::new(self)
}
</t>
<t tx="ekr.20231101055917.89">impl&lt;T&gt; BufferExtensions for T where T: Buffer {}

#[derive(Debug)]
pub struct Recording&lt;'buf, Buffer&gt; {
    start: usize,
    buffer: &amp;'buf mut Buffer,
}
</t>
<t tx="ekr.20231101055917.9">/// Implement [`IntoFormat`] for references to types that implement [`AsFormat`].
impl&lt;'a, T, C&gt; IntoFormat&lt;C&gt; for &amp;'a T
where
    T: AsFormat&lt;C&gt;,
{
    type Format = T::Format&lt;'a&gt;;
    
    fn into_format(self) -&gt; Self::Format {
        AsFormat::format(self)
    }
}
</t>
<t tx="ekr.20231101055917.90">impl&lt;'buf, B&gt; Recording&lt;'buf, B&gt;
where
    B: Buffer,
{
    @others
}
</t>
<t tx="ekr.20231101055917.91">fn new(buffer: &amp;'buf mut B) -&gt; Self {
    Self {
        start: buffer.elements().len(),
        buffer,
    }
}
</t>
<t tx="ekr.20231101055917.92">#[inline]
pub fn write_fmt(&amp;mut self, arguments: Arguments&lt;B::Context&gt;) -&gt; FormatResult&lt;()&gt; {
    self.buffer.write_fmt(arguments)
}
</t>
<t tx="ekr.20231101055917.93">#[inline]
pub fn write_element(&amp;mut self, element: FormatElement) {
    self.buffer.write_element(element);
}
</t>
<t tx="ekr.20231101055917.94">pub fn stop(self) -&gt; Recorded&lt;'buf&gt; {
    let buffer: &amp;'buf B = self.buffer;
    let elements = buffer.elements();

    let recorded = if self.start &gt; elements.len() {
        // May happen if buffer was rewinded.
        &amp;[]
    } else {
        &amp;elements[self.start..]
    };

    Recorded(recorded)
}
</t>
<t tx="ekr.20231101055917.95">#[derive(Debug, Copy, Clone)]
pub struct Recorded&lt;'a&gt;(&amp;'a [FormatElement]);

impl Deref for Recorded&lt;'_&gt; {
    type Target = [FormatElement];
    
    fn deref(&amp;self) -&gt; &amp;Self::Target {
        self.0
    }
}
</t>
<t tx="ekr.20231101055917.97">use std::cell::Cell;
use std::marker::PhantomData;
use std::num::NonZeroU8;

use ruff_text_size::TextRange;
@others
@language rust
@tabwidth -4
</t>
<t tx="ekr.20231101055917.98">#[allow(clippy::enum_glob_use)]
use Tag::*;

use crate::format_element::tag::{Condition, Tag};
use crate::prelude::tag::{DedentMode, GroupMode, LabelId};
use crate::prelude::*;
use crate::{write, Argument, Arguments, FormatContext, FormatOptions, GroupId, TextSize};
use crate::{Buffer, VecBuffer};

/// A line break that only gets printed if the enclosing `Group` doesn't fit on a single line.
/// It's omitted if the enclosing `Group` fits on a single line.
/// A soft line break is identical to a hard line break when not enclosed inside of a `Group`.
///
/// # Examples
///
/// Soft line breaks are omitted if the enclosing `Group` fits on a single line
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![token("a,"), soft_line_break(), token("b")])
/// ])?;
///
/// assert_eq!(
///     "a,b",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
/// See [`soft_line_break_or_space`] if you want to insert a space between the elements if the enclosing
/// `Group` fits on a single line.
///
/// Soft line breaks are emitted if the enclosing `Group` doesn't fit on a single line
/// ```
/// use ruff_formatter::{format, format_args, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(10).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("a long word,"),
///         soft_line_break(),
///         token("so that the group doesn't fit on a single line"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "a long word,\nso that the group doesn't fit on a single line",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub const fn soft_line_break() -&gt; Line {
    Line::new(LineMode::Soft)
}

/// A forced line break that are always printed. A hard line break forces any enclosing `Group`
/// to be printed over multiple lines.
///
/// # Examples
///
/// It forces a line break, even if the enclosing `Group` would otherwise fit on a single line.
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("a,"),
///         hard_line_break(),
///         token("b"),
///         hard_line_break()
///     ])
/// ])?;
///
/// assert_eq!(
///     "a,\nb\n",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub const fn hard_line_break() -&gt; Line {
    Line::new(LineMode::Hard)
}

/// A forced empty line. An empty line inserts enough line breaks in the output for
/// the previous and next element to be separated by an empty line.
///
/// # Examples
///
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(
///     SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("a,"),
///         empty_line(),
///         token("b"),
///         empty_line()
///     ])
/// ])?;
///
/// assert_eq!(
///     "a,\n\nb\n\n",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub const fn empty_line() -&gt; Line {
    Line::new(LineMode::Empty)
}

/// A line break if the enclosing `Group` doesn't fit on a single line, a space otherwise.
///
/// # Examples
///
/// The line breaks are emitted as spaces if the enclosing `Group` fits on a a single line:
/// ```
/// use ruff_formatter::{format, format_args};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let elements = format!(SimpleFormatContext::default(), [
///     group(&amp;format_args![
///         token("a,"),
///         soft_line_break_or_space(),
///         token("b"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "a, b",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
///
/// The printer breaks the lines if the enclosing `Group` doesn't fit on a single line:
/// ```
/// use ruff_formatter::{format_args, format, LineWidth, SimpleFormatOptions};
/// use ruff_formatter::prelude::*;
///
/// # fn main() -&gt; FormatResult&lt;()&gt; {
/// let context = SimpleFormatContext::new(SimpleFormatOptions {
///     line_width: LineWidth::try_from(10).unwrap(),
///     ..SimpleFormatOptions::default()
/// });
///
/// let elements = format!(context, [
///     group(&amp;format_args![
///         token("a long word,"),
///         soft_line_break_or_space(),
///         token("so that the group doesn't fit on a single line"),
///     ])
/// ])?;
///
/// assert_eq!(
///     "a long word,\nso that the group doesn't fit on a single line",
///     elements.print()?.as_code()
/// );
/// # Ok(())
/// # }
/// ```
#[inline]
pub const fn soft_line_break_or_space() -&gt; Line {
    Line::new(LineMode::SoftOrSpace)
}

#[derive(Copy, Clone, Eq, PartialEq)]
pub struct Line {
    mode: LineMode,
}
</t>
<t tx="ekr.20231101055917.99">impl Line {
    const fn new(mode: LineMode) -&gt; Self {
        Self { mode }
    }
}
</t>
<t tx="ekr.20231101055932.1">"""Undoably remove small @others and implify headlines."""
g.cls()
import re
from leo.core.leoNodes import Position

@others  # Define helpers

u, undoType = c.undoer, 'clean-rust'
u.beforeChangeGroup(c.p, undoType)
n_changed = 0
for root in c.all_unique_positions():
    if root.h.endswith('.rs'):
        for p in root.subtree():
            bunch = u.beforeChangeNodeContents(p)
            if remove_at_others(p) or remove_angle_expressions(p):
                u.afterChangeNodeContents(p, undoType, bunch)
                n_changed += 1
if n_changed:
    u.afterChangeGroup(c.p, undoType)
    print(f"{n_changed} nodes changed")
else:
    print('No nodes changed')
c.redraw()
</t>
<t tx="ekr.20231101060133.1"></t>
<t tx="ekr.20231101060448.1">def remove_at_others(p: Position) -&gt; bool:
    """Replace @others if p has only one small child."""
    n = p.numberOfChildren()
    if n != 1 or not p.b.strip():
        return False
    child_lines = g.splitLines(p.firstChild().b)
    if len(child_lines) &gt; 10:
        return False

    # Find the @others line. Don't worry about strings and comments.
    lines = g.splitLines(p.b)
    for i, line in enumerate(lines):
        if line.strip().startswith('@others'):
            break
    else:
        g.trace(f"@others without children: {p.h}")
        return False
    # Add the lws of the @others line to all child lines.
    lws = len(lines[i]) - len(lines[i].lstrip())
    child_lines = [' ' * lws + z for z in child_lines]
    p.b = ''.join(lines[:i] + child_lines + lines[i+1:])
    p.deleteAllChildren()
    p.setMarked()
    print(f"Changed: {p.h}")
    return True
</t>
<t tx="ekr.20231101062905.1">angle_pat = re.compile(r'&lt;.*?&gt;')

def remove_angle_expressions(p: Position) -&gt; bool:
    """Remove all &lt;...&gt; strings."""
    h = re.sub(angle_pat, '', p.h)
    if h != p.h:
        h = h.replace('  ', ' ').strip()
        p.h = h
        p.setMarked()
        return True
    return False
</t>
<t tx="ekr.20231101070946.1"></t>
</tnodes>
</leo_file>
