<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="130" clone_windows="0"/>
<globals body_outline_ratio="0.487584650113">
	<global_window_position top="131" left="187" height="886" width="1039"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences>
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="bwmulder.120603131249"><vh>Experimental sentinel killing script</vh></v>
<v t="bwmulder.120803161509"><vh>todo</vh></v>
<v t="bwmulder.20040414103906"><vh>standalone script</vh>
<v t="bwmulder.120603131812" a="M" tnodeList="bwmulder.120603131812,bwmulder.20040413103739,bwmulder.120603131812.1,bwmulder.120603131812.2,bwmulder.120603131812.3,bwmulder.120603131812.4,bwmulder.121303192118,bwmulder.120703170308,bwmulder.20040413134012,bwmulder.120803131809,bwmulder.121303212121,bwmulder.120603131812.5,bwmulder.120603131812.7,bwmulder.120603131812.8,bwmulder.120603131812.9,bwmulder.120603131812.10,bwmulder.120603131812.11,bwmulder.20040412185825,bwmulder.120603131812.12,bwmulder.120603131812.13,bwmulder.120603131812.14,bwmulder.120603131812.15,bwmulder.120603131812.16,bwmulder.120603131812.17,bwmulder.120903101940,bwmulder.120603131812.19,bwmulder.120603131812.20,bwmulder.120603131812.21,EKR.20040503170912,bwmulder.120803144940,bwmulder.120803130808,EKR.20040503154643,EKR.20040503154643.1,EKR.20040503154643.2,EKR.20040503154643.3,EKR.20040503154643.4,bwmulder.120903191818,bwmulder.120603131812.22,bwmulder.121303184116.8,bwmulder.20040414181247,bwmulder.20040414182149,bwmulder.120703004049"><vh>@file sentinel.py</vh>
<v t="bwmulder.20040413103739"><vh>is_sentinel</vh></v>
<v t="bwmulder.120603131812.1"><vh>imports</vh></v>
<v t="bwmulder.120603131812.2"><vh>get_filenames</vh></v>
<v t="bwmulder.120603131812.3"><vh>write_if_changed</vh></v>
<v t="bwmulder.120603131812.4"><vh>push</vh></v>
<v t="bwmulder.121303192118"><vh>push_file</vh></v>
<v t="bwmulder.120703170308"><vh>push_filter</vh></v>
<v t="bwmulder.20040413134012"><vh>marker_from_extension</vh></v>
<v t="bwmulder.120803131809"><vh>push_filter_lines</vh></v>
<v t="bwmulder.121303212121"><vh>copy_time</vh></v>
<v t="bwmulder.120603131812.5"><vh>class sourcereader</vh>
<v t="bwmulder.120603131812.7"><vh>__init__</vh></v>
<v t="bwmulder.120603131812.8"><vh>index</vh></v>
<v t="bwmulder.120603131812.9"><vh>get</vh></v>
<v t="bwmulder.120603131812.10"><vh>sync</vh></v>
<v t="bwmulder.120603131812.11"><vh>size</vh></v>
<v t="bwmulder.20040412185825"><vh>atEnd</vh></v>
</v>
<v t="bwmulder.120603131812.12"><vh>class sourcewriter</vh>
<v t="bwmulder.120603131812.13"><vh>__init__</vh></v>
<v t="bwmulder.120603131812.14"><vh>push</vh></v>
<v t="bwmulder.120603131812.15"><vh>index</vh></v>
<v t="bwmulder.120603131812.16"><vh>getlines</vh></v>
</v>
<v t="bwmulder.120603131812.17" a="M"><vh>class sentinel_squasher</vh>
<v t="bwmulder.120903101940"><vh>report_mismatch</vh></v>
<v t="bwmulder.120603131812.19"><vh>create_back_mapping</vh></v>
<v t="bwmulder.120603131812.20" a="M"><vh>copy_sentinels</vh></v>
<v t="bwmulder.120603131812.21" a="M"><vh>pull_source (propagate changes from nosent file to sent file)</vh>
<v t="EKR.20040503170912"><vh>&lt;&lt; init pull_source vars &gt;&gt;</vh></v>
<v t="bwmulder.120803144940"><vh>&lt;&lt;establish the loop invariant&gt;&gt;</vh></v>
<v t="bwmulder.120803130808"><vh>&lt;&lt; update and check the loop invariant&gt;&gt;</vh></v>
<v t="EKR.20040503154643"><vh>&lt;&lt; handle 'equal' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.1"><vh>&lt;&lt; handle 'replace' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.2"><vh>&lt;&lt; handle 'delete' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.3"><vh>&lt;&lt; handle 'insert' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.4"><vh>&lt;&lt; copy the sentinels at the end of the file &gt;&gt;</vh></v>
<v t="bwmulder.120903191818"><vh>&lt;&lt;final paranoia check&gt;&gt;</vh></v>
</v>
</v>
<v t="bwmulder.120603131812.22"><vh>pull</vh></v>
<v t="bwmulder.121303184116.8"><vh>sync</vh></v>
<v t="bwmulder.20040414181247"><vh>create_leo_subdirectory</vh></v>
<v t="bwmulder.20040414182149"><vh>create_ext</vh></v>
<v t="bwmulder.120703004049"><vh>main</vh></v>
</v>
<v t="bwmulder.120603223857" tnodeList="bwmulder.120603223857"><vh>@file sentinel.cfg</vh></v>
<v t="bwmulder.120603223949"><vh>tests</vh>
<v t="bwmulder.120703000133" tnodeList="bwmulder.120703000133,bwmulder.120703000133.1,bwmulder.120703001355,bwmulder.120703141328,bwmulder.120703001355.1,bwmulder.120703002843,bwmulder.120903095722,bwmulder.120703000409,bwmulder.120703001355.2,bwmulder.120703001355.3,bwmulder.120903095722.1,bwmulder.120703105944,bwmulder.120703105944.1,bwmulder.120703105944.2,bwmulder.120803112447,bwmulder.120803112447.1,bwmulder.120803112447.2,bwmulder.120803171348,bwmulder.120803171348.1,bwmulder.120803171348.2,bwmulder.120803234359,bwmulder.120803234359.1,bwmulder.120803234359.2,bwmulder.120903095722.2,bwmulder.120903095939,bwmulder.120903095939.1,bwmulder.120903095939.2,bwmulder.120703002020"><vh>@file test_sentinels.py</vh>
<v t="bwmulder.120703000133.1"><vh>imports</vh></v>
<v t="bwmulder.120703001355"><vh>class sentinel_test</vh>
<v t="bwmulder.120703141328"><vh>setUp</vh></v>
<v t="bwmulder.120703001355.1"><vh>setup_inputfile</vh></v>
<v t="bwmulder.120703002843"><vh>setup_configfile</vh></v>
</v>
<v t="bwmulder.120903095722"><vh>insert tests</vh>
<v t="bwmulder.120703000409"><vh>class insert_test</vh>
<v t="bwmulder.120703001355.2"><vh>setUp</vh></v>
<v t="bwmulder.120703001355.3"><vh>runTest</vh></v>
</v>
</v>
<v t="bwmulder.120903095722.1"><vh>replacement tests</vh>
<v t="bwmulder.120703105944"><vh>class replace_test</vh>
<v t="bwmulder.120703105944.1"><vh>setUp</vh></v>
<v t="bwmulder.120703105944.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120803112447"><vh>class replace_test2</vh>
<v t="bwmulder.120803112447.1"><vh>setUp</vh></v>
<v t="bwmulder.120803112447.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120803171348"><vh>class replace_test3</vh>
<v t="bwmulder.120803171348.1"><vh>setUp</vh></v>
<v t="bwmulder.120803171348.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120803234359"><vh>class replace_test4</vh>
<v t="bwmulder.120803234359.1"><vh>setUp</vh></v>
<v t="bwmulder.120803234359.2"><vh>runTest</vh></v>
</v>
</v>
<v t="bwmulder.120903095722.2"><vh>regression tests</vh>
<v t="bwmulder.120903095939"><vh>class regression_test_1</vh>
<v t="bwmulder.120903095939.1"><vh>setUp</vh></v>
<v t="bwmulder.120903095939.2"><vh>runTest</vh></v>
</v>
</v>
<v t="bwmulder.120703002020"><vh>main</vh></v>
</v>
<v t="bwmulder.120903214930"><vh>not used</vh>
<v t="bwmulder.120603231526" tnodeList="bwmulder.120603231526"><vh>@file testtesting.ini</vh></v>
<v t="bwmulder.120703004433"><vh>tests to write</vh>
<v t="bwmulder.120603231230"><vh>Insert tests.</vh></v>
<v t="bwmulder.120603231306"><vh>deletion tests.</vh></v>
<v t="bwmulder.120703004433.1"><vh>Creation of backup files.</vh></v>
</v>
</v>
</v>
</v>
<v t="bwmulder.20040411130852"><vh>plugin</vh>
<v t="bwmulder.20040411130914" a="M" tnodeList="bwmulder.20040411130914,bwmulder.20040412145811,bwmulder.20040411130914.1,bwmulder.20040414072713.1,bwmulder.20040414073616,bwmulder.20040413103739,bwmulder.120603131812.3,bwmulder.121303212121,bwmulder.20040413134012,bwmulder.20040414135728,bwmulder.120603131812.5,bwmulder.120603131812.7,bwmulder.120603131812.8,bwmulder.120603131812.9,bwmulder.120603131812.10,bwmulder.120603131812.11,bwmulder.20040412185825,bwmulder.120603131812.12,bwmulder.120603131812.13,bwmulder.120603131812.14,bwmulder.120603131812.15,bwmulder.120603131812.16,bwmulder.20040414073616.1,bwmulder.121303192118,bwmulder.120703170308,bwmulder.120803131809,bwmulder.20040414073917,bwmulder.120603131812.17,bwmulder.120903101940,bwmulder.120603131812.19,bwmulder.120603131812.20,bwmulder.120603131812.21,EKR.20040503170912,bwmulder.120803144940,bwmulder.120803130808,EKR.20040503154643,EKR.20040503154643.1,EKR.20040503154643.2,EKR.20040503154643.3,EKR.20040503154643.4,bwmulder.120903191818,bwmulder.20040414072713,bwmulder.20040411140005,bwmulder.20040412162613,bwmulder.20040411140303,bwmulder.20040411145427,bwmulder.20040411225517,bwmulder.20040414140029,bwmulder.20040413103739.2,bwmulder.20040413103739.3,bwmulder.20040413103739.4,bwmulder.20040413103739.5,bwmulder.20040413103922,bwmulder.20040413103739.6,bwmulder.20040413103739.7,bwmulder.20040413104121,bwmulder.20040413103739.8,bwmulder.20040413103739.9,bwmulder.20040413103739.10,bwmulder.20040413103739.11,bwmulder.20040413103739.12,bwmulder.20040413103739.13,bwmulder.20040413103739.14,bwmulder.20040413103739.15,bwmulder.20040413103739.1,bwmulder.20040414071730,bwmulder.20040413165431,bwmulder.20040413103739.2,bwmulder.20040413103739.3,bwmulder.20040413103739.4,bwmulder.20040413103739.5,bwmulder.20040413103922,bwmulder.20040413103739.6,bwmulder.20040413103739.7,bwmulder.20040413104121,bwmulder.20040413103739.8,bwmulder.20040413103739.9,bwmulder.20040413103739.10,bwmulder.20040413103739.11,bwmulder.20040413103739.12,bwmulder.20040413103739.13,bwmulder.20040413103739.14,bwmulder.20040413103739.15,bwmulder.20040414140329,bwmulder.20040413165431,bwmulder.20040411224315,bwmulder.20040414140329.1,bwmulder.20040411225818,bwmulder.20040411225818.1"><vh>@file mod_LeoSubfolderPlugin.py</vh>
<v t="bwmulder.20040412145811"><vh>&lt;&lt;docstring&gt;&gt;</vh></v>
<v t="bwmulder.20040411130914.1"><vh>&lt;&lt;imports&gt;&gt;</vh></v>
<v t="bwmulder.20040414072713.1"><vh>removing sentinels</vh>
<v t="bwmulder.20040414073616"><vh>utilities</vh>
<v t="bwmulder.20040413103739"><vh>is_sentinel</vh></v>
<v t="bwmulder.120603131812.3"><vh>write_if_changed</vh></v>
<v t="bwmulder.121303212121"><vh>copy_time</vh></v>
<v t="bwmulder.20040413134012"><vh>marker_from_extension</vh></v>
<v t="bwmulder.20040414135728"><vh>classes</vh>
<v t="bwmulder.120603131812.5"><vh>class sourcereader</vh>
<v t="bwmulder.120603131812.7"><vh>__init__</vh></v>
<v t="bwmulder.120603131812.8"><vh>index</vh></v>
<v t="bwmulder.120603131812.9"><vh>get</vh></v>
<v t="bwmulder.120603131812.10"><vh>sync</vh></v>
<v t="bwmulder.120603131812.11"><vh>size</vh></v>
<v t="bwmulder.20040412185825"><vh>atEnd</vh></v>
</v>
<v t="bwmulder.120603131812.12"><vh>class sourcewriter</vh>
<v t="bwmulder.120603131812.13"><vh>__init__</vh></v>
<v t="bwmulder.120603131812.14"><vh>push</vh></v>
<v t="bwmulder.120603131812.15"><vh>index</vh></v>
<v t="bwmulder.120603131812.16"><vh>getlines</vh></v>
</v>
</v>
</v>
<v t="bwmulder.20040414073616.1"><vh>push</vh>
<v t="bwmulder.121303192118"><vh>push_file</vh></v>
<v t="bwmulder.120703170308"><vh>push_filter</vh></v>
<v t="bwmulder.120803131809"><vh>push_filter_lines</vh></v>
</v>
<v t="bwmulder.20040414073917"><vh>pull</vh>
<v t="bwmulder.120603131812.17"><vh>class sentinel_squasher</vh>
<v t="bwmulder.120903101940"><vh>report_mismatch</vh></v>
<v t="bwmulder.120603131812.19"><vh>create_back_mapping</vh></v>
<v t="bwmulder.120603131812.20" a="M"><vh>copy_sentinels</vh></v>
<v t="bwmulder.120603131812.21" a="M"><vh>pull_source (propagate changes from nosent file to sent file)</vh>
<v t="EKR.20040503170912"><vh>&lt;&lt; init pull_source vars &gt;&gt;</vh></v>
<v t="bwmulder.120803144940"><vh>&lt;&lt;establish the loop invariant&gt;&gt;</vh></v>
<v t="bwmulder.120803130808"><vh>&lt;&lt; update and check the loop invariant&gt;&gt;</vh></v>
<v t="EKR.20040503154643"><vh>&lt;&lt; handle 'equal' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.1"><vh>&lt;&lt; handle 'replace' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.2"><vh>&lt;&lt; handle 'delete' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.3"><vh>&lt;&lt; handle 'insert' tag &gt;&gt;</vh></v>
<v t="EKR.20040503154643.4"><vh>&lt;&lt; copy the sentinels at the end of the file &gt;&gt;</vh></v>
<v t="bwmulder.120903191818"><vh>&lt;&lt;final paranoia check&gt;&gt;</vh></v>
</v>
</v>
</v>
</v>
<v t="bwmulder.20040414072713"><vh>Integration into Leo</vh>
<v t="bwmulder.20040411140005"><vh>applyConfiguration</vh></v>
<v t="bwmulder.20040412162613"><vh>Modifying Leos behaviour</vh>
<v t="bwmulder.20040411140303"><vh>putInHooks</vh></v>
<v t="bwmulder.20040411145427" a="M"><vh>LeoSubfolderPluginOpen</vh>
<v t="bwmulder.20040411225517"><vh>Check_for_replacement</vh></v>
</v>
</v>
<v t="bwmulder.20040414140029"><vh>goto line command</vh>
<v t="bwmulder.20040413103739.2"><vh>goToLineNumber &amp; allies</vh>
<v t="bwmulder.20040413103739.3"><vh>&lt;&lt; set root to the nearest @file, @silentfile or @rawfile ancestor node &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.4"><vh>&lt;&lt; read the file into lines &gt;&gt; in OnGoToLineNumber</vh>
<v t="bwmulder.20040413103739.5"><vh>&lt;&lt;bwm: check for Leo subfolder&gt;&gt;</vh></v>
<v t="bwmulder.20040413103922"><vh>&lt;&lt;bwm: construct linenumber mapping&gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.6"><vh>&lt;&lt; get n, the line number, from a dialog &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.7"><vh>&lt;&lt; count outline lines, setting v,n2,found &gt;&gt; (@file-nosent only)</vh></v>
<v t="bwmulder.20040413104121" a="M"><vh>&lt;&lt;bwm: apply linemapping&gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.8"><vh>&lt;&lt; set v to the node given by vnodeName and childIndex or n &gt;&gt;</vh>
<v t="bwmulder.20040413103739.9"><vh>&lt;&lt; 4.x: scan for the node using tnodeList and n &gt;&gt;</vh>
<v t="bwmulder.20040413103739.10"><vh>&lt;&lt; set tnodeIndex to the number of +node sentinels before line n &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.11"><vh>&lt;&lt; set v to the first vnode whose tnode is tnodeList[tnodeIndex] or set ok = false &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.12"><vh>&lt;&lt; set v to the first node whose headline matches vnodeName &gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.13"><vh>&lt;&lt; 3.x: scan for the node with the given childIndex &gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.14"><vh>&lt;&lt; select v and make it visible &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.15"><vh>&lt;&lt; put the cursor on line n2 of the body text &gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.1"><vh>push_filter_mapping</vh></v>
</v>
<v t="bwmulder.20040414071730"><vh>lifted from 4.1 code</vh>
<v t="bwmulder.20040413165431"><vh>massageComent</vh></v>
<v t="bwmulder.20040413103739.2"><vh>goToLineNumber &amp; allies</vh>
<v t="bwmulder.20040413103739.3"><vh>&lt;&lt; set root to the nearest @file, @silentfile or @rawfile ancestor node &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.4"><vh>&lt;&lt; read the file into lines &gt;&gt; in OnGoToLineNumber</vh>
<v t="bwmulder.20040413103739.5"><vh>&lt;&lt;bwm: check for Leo subfolder&gt;&gt;</vh></v>
<v t="bwmulder.20040413103922"><vh>&lt;&lt;bwm: construct linenumber mapping&gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.6"><vh>&lt;&lt; get n, the line number, from a dialog &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.7"><vh>&lt;&lt; count outline lines, setting v,n2,found &gt;&gt; (@file-nosent only)</vh></v>
<v t="bwmulder.20040413104121" a="M"><vh>&lt;&lt;bwm: apply linemapping&gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.8"><vh>&lt;&lt; set v to the node given by vnodeName and childIndex or n &gt;&gt;</vh>
<v t="bwmulder.20040413103739.9"><vh>&lt;&lt; 4.x: scan for the node using tnodeList and n &gt;&gt;</vh>
<v t="bwmulder.20040413103739.10"><vh>&lt;&lt; set tnodeIndex to the number of +node sentinels before line n &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.11"><vh>&lt;&lt; set v to the first vnode whose tnode is tnodeList[tnodeIndex] or set ok = false &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.12"><vh>&lt;&lt; set v to the first node whose headline matches vnodeName &gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.13"><vh>&lt;&lt; 3.x: scan for the node with the given childIndex &gt;&gt;</vh></v>
</v>
<v t="bwmulder.20040413103739.14"><vh>&lt;&lt; select v and make it visible &gt;&gt;</vh></v>
<v t="bwmulder.20040413103739.15"><vh>&lt;&lt; put the cursor on line n2 of the body text &gt;&gt;</vh></v>
</v>
</v>
<v t="bwmulder.20040414140329"><vh>reading</vh>
<v t="bwmulder.20040413165431"><vh>massageComent</vh></v>
</v>
<v t="bwmulder.20040411224315"><vh>read</vh></v>
<v t="bwmulder.20040414140329.1"><vh>writing</vh>
<v t="bwmulder.20040411225818" a="M"><vh>writeclass</vh></v>
<v t="bwmulder.20040411225818.1"><vh>write</vh></v>
</v>
</v>
</v>
</v>
<v t="EKR.20040503213839" a="TV"><vh>class perfectImport</vh>
<v t="EKR.20040503213839.1"><vh>__init__</vh></v>
<v t="EKR.20040503221740"><vh>marker_from_extension</vh></v>
<v t="EKR.20040503213839.2"><vh>report_mismatch</vh></v>
<v t="EKR.20040503213839.3"><vh>create_mapping</vh></v>
<v t="EKR.20040504145724"><vh>update_file</vh>
<v t="EKR.20040504145724.1"><vh>&lt;&lt; create backup copy of targetfile &gt;&gt;</vh></v>
</v>
<v t="EKR.20040504123809.10"><vh>copy_sentinels</vh></v>
<v t="EKR.20040504144803"><vh>pull_source</vh>
<v t="EKR.20040504123809.1"><vh>&lt;&lt; init pull_source vars &gt;&gt;</vh></v>
<v t="EKR.20040504123809.9"><vh>&lt;&lt;paranoia check&gt;&gt;</vh></v>
</v>
<v t="EKR.20040504123809" a="M"><vh>mulderUpdateAlgorithm</vh>
<v t="EKR.20040504145724.2"><vh>&lt;&lt; init mulderUpdateAlgorithm vars &gt;&gt;</vh></v>
<v t="EKR.20040504123809.2"><vh>&lt;&lt; copy the sentinels at the beginning of the file &gt;&gt;</vh></v>
<v t="EKR.20040504123809.3"><vh>&lt;&lt; update and check the loop invariant&gt;&gt;</vh></v>
<v t="EKR.20040504123809.4"><vh>&lt;&lt; handle 'equal' tag &gt;&gt;</vh></v>
<v t="EKR.20040504123809.5"><vh>&lt;&lt; handle 'replace' tag &gt;&gt;</vh></v>
<v t="EKR.20040504123809.6"><vh>&lt;&lt; handle 'delete' tag &gt;&gt;</vh></v>
<v t="EKR.20040504123809.7"><vh>&lt;&lt; handle 'insert' tag &gt;&gt;</vh></v>
<v t="EKR.20040504123809.8"><vh>&lt;&lt; copy the sentinels at the end of the file &gt;&gt;</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="EKR.20040503154643"># nothing is to be done.  Leave the Leo file alone.
# Copy the lines from the leo file to the new sourcefile.
# This loop copies both text and sentinels.
while leo_reader.index() &lt;= mapping[i2 - 1]:
	line = leo_reader.get()
	if testing: print "Equal: copying ", line,
	writer.push(line)

if testing:
	print "Equal: synch i file from ", i_reader.i, " to ", i2
	print "Equal: synch j file from ", j_reader.i, " to ", j2

i_reader.sync(i2)
j_reader.sync(j2)

# now we must copy the sentinels which might follow the lines which were equal.       
self.copy_sentinels(writer, leo_reader, mapping, i2 - 1, i2)</t>
<t tx="EKR.20040503154643.1">@ Replace lines that may span sentinels.

For now, we put all the new contents after the first sentinels.

A more complex approach: run the difflib across the different lines and try to
construct a mapping changed line =&gt; orignal line.
@c

while j_reader.index() &lt; j2:
	line = j_reader.get()
	if testing: print "Replace: copy j line:", line,
	writer.push(line)

# Copy the sentinels which might be between the changed code.         
self.copy_sentinels(writer,leo_reader,mapping,i1,i2)
i_reader.sync(i2)</t>
<t tx="EKR.20040503154643.2"># We have to delete lines.
# However, we NEVER delete sentinels, so they must be copied over.

if testing:
	print "delete: synch i file from ", i_reader.i, " to ", i1
	print "delete: synch j file from ", j_reader.i, " to ", j1
	
# sync the readers
j_reader.sync(j2)
i_reader.sync(i2)

self.copy_sentinels(writer, leo_reader, mapping, i1, i2)</t>
<t tx="EKR.20040503154643.3">while j_reader.index() &lt; j2:
	line = j_reader.get()
	if testing:
		print "insert: copy line:", line,
	writer.push(line)

# Since (only) lines are inserted, we do not have to reposition any reader.</t>
<t tx="EKR.20040503154643.4">while leo_reader.index() &lt; leo_reader.size():
	writer.push(leo_reader.get())</t>
<t tx="EKR.20040503170912">marker = marker_from_extension(sourcefile) # The sentinel comment marker.
	
sourcelines = file(sourcefile).readlines() # Has sentinels.
targetlines = file(targetfile).readlines() # No sentinels.

strippedSourceLines,mapping = self.create_back_mapping(sourcelines,marker)

writer = sourcewriter() # Accumulates the new file.
i_reader = sourcereader(strippedSourceLines) # Unmodified file, no sentinels.
j_reader = sourcereader(targetlines) # Modified file, no sentinels.
leo_reader = sourcereader(sourcelines) # The file with sentinels.

matcher = difflib.SequenceMatcher(None,strippedSourceLines,targetlines)</t>
<t tx="EKR.20040503213839">import leoGlobals as g
from leoGlobals import true,false

class perfectImport:
	
	"""
	
	Correct the results of an import operation as needed to
	ensure that the outline when written will be identical to
	the original imported file.
	
	Based on an algorithm by Bernhard Mulder.
	"""

	@others</t>
<t tx="EKR.20040503213839.1">def __init__ (self,p,fileName):
	
	self.root = p
	self.fileName = fileName
	self.marker = self.marker_from_extension(sourcefile) # The sentinel comment marker.
	self.matcher = difflib.SequenceMatcher(None,strippedSourceLines,targetlines)
	
	self.testing = true</t>
<t tx="EKR.20040503213839.2">def report_mismatch (self,lines1,lines2,message,lines1_message,lines2_message):

	"""
	Generate a report when something goes wrong.
	"""

	print '='*20
	print message
	
	if 0:
		print lines1_message
		print '-'*20
		for line in lines1:
		  print line,
		 
		print '='*20
	
		print lines2_message
		print '-'*20
		for line in lines2:
			print line,</t>
<t tx="EKR.20040503213839.3">def create_mapping (self,lines,marker):
	"""

	'lines' is a list of lines of a file with sentinels.
 
	Returns:

	result: lines with all sentinels removed.

	mapping: a list such that result[mapping[i]] == lines[i]
	for all i in range(len(result))

	"""

	mapping = [] ; result = []
	for i in xrange(len(lines)):
		line = lines[i]
		if not is_sentinel(line,marker):
			result.append(line)
			mapping.append(i)

	# Create a last mapping entry for copy_sentinels.
	mapping.append(i)

	return result, mapping</t>
<t tx="EKR.20040503221740">def marker_from_extension(self,filename):
	"""
	Tries to guess the sentinel leadin
	comment from the filename extension.
	
	This code should probably be shared
	with the main Leo code.
	"""
	root, ext = os.path.splitext(filename)
	if ext == '.tmp':
		root, ext = os.path.splitext(root)
	if ext in ('.h', '.c'):
		marker = "//@"
	elif ext in (".py", ".cfg", ".bat", ".ksh"):
		marker = "#@"
	else:
		assert 0, "extension %s not handled by this plugin" % ext
	return marker</t>
<t tx="EKR.20040504123809">def mulderUpdateAlgorithm(self,sourcefile,targetfile):
	
	"""Propagate diffs between i/j_lines into fat_lines.
	
	i/j_lines have no sentinels.  fat_lines does."""

	&lt;&lt; init mulderUpdateAlgorithm vars &gt;&gt;
	&lt;&lt; copy the sentinels at the beginning of the file &gt;&gt;
	for tag, i1, i2, j1, j2 in matcher.get_opcodes():
		if testing:
			print ; print "Opcode",tag,i1,i2,j1,j2 ; print
		&lt;&lt; update and check the loop invariant &gt;&gt;
		if tag == 'equal':
			&lt;&lt; handle 'equal' tag &gt;&gt;
		elif tag == 'replace':
			&lt;&lt; handle 'replace' tag &gt;&gt;
		elif tag == 'delete':
			&lt;&lt; handle 'delete' tag &gt;&gt;
		elif tag == 'insert':
			&lt;&lt; handle 'insert' tag &gt;&gt;
		else: assert 0,"bad tag"
	&lt;&lt; copy the sentinels at the end of the file &gt;&gt;
	return write_lines</t>
<t tx="EKR.20040504123809.1">@
We compare the 'targetLines' with 'strippedSourceLines' and propagate the
changes back into 'write_lines' while making sure that all sentinels of 'sourceLines'
are copied as well.
@c

marker = marker_from_extension(sourcefile) # The sentinel comment marker.

# Create the readers.
fat_lines = sourceLines = file(sourcefile).readlines() # Has sentinels.
j_lines   = targetLines = file(targetfile).readlines() # No sentinels.

i_lines   = strippedSourceLines,mapping = self.create_mapping(sourceLines,marker)
</t>
<t tx="EKR.20040504123809.2">while fat_pos &lt; mapping[0]:
	line = fat_lines[fat_pos]
	write_lines.append(line)
	if testing: print "copy initial line",fat_pos,line
	fat_pos += 1</t>
<t tx="EKR.20040504123809.3"># We need the ranges returned by get_opcodes to completely cover the source lines being compared.
# We also need the ranges not to overlap.

assert(i2_old in (-1,i1))
assert(j2_old in (-1 j1))

i2_old = i2 ; j2_old = j2

# Check the loop invariants.
assert i_pos == i1
assert j_pos == j1
assert fat_pos == mapping[i1]

if 0: # not yet.
	if testing: # A bit costly.
		t_sourcelines,t_sentinel_lines = push_filter_lines(write_lines, marker)
		# Check that we have all the modifications so far.
		assert t_sourcelines == j_lines[:j1],"t_sourcelines == j_lines[:j1]"
		# Check that we kept all sentinels so far.
		assert t_sentinel_lines == push_filter_lines(fat_lines[:fat_pos], marker)[1]</t>
<t tx="EKR.20040504123809.4"># Copy the lines, including sentinels.
while fat_pos &lt;= mapping[i2-1]:
	line = fat_lines[fat_pos]
	if 0: # too verbose.
		if testing: print "Equal: copying ", line,
	write_lines.append(line)
	fat_pos += 1

if testing:
	print "Equal: synch i", i_pos,i2
	print "Equal: synch j", j_pos,j2

i_pos = i2
j_pos = j2

# Copy the sentinels which might follow the lines.       
fat_pos = self.copy_sentinels(write_lines,fat_lines,fat_pos,mapping,i2-1,i2)</t>
<t tx="EKR.20040504123809.5">@ Replace lines that may span sentinels.

For now, we put all the new contents after the first sentinel.

A more complex approach: run the difflib across the different lines and try to
construct a mapping changed line =&gt; orignal line.
@c

while j_pos &lt; j2:
	line = j_lines[j_pos]
	if testing: print "Replace:", line,
	write_lines.append(line)
	j_pos += 1
	
i_pos = i2

# Copy the sentinels which might be between the changed code.         
fat_pos = self.copy_sentinels(write_lines,fat_lines,fat_pos,mapping,i1,i2)</t>
<t tx="EKR.20040504123809.6">if testing:
	print "delete: i",i_pos,i1
	print "delete: j",j_pos,j1

j_pos = j2
i_pos = i2

# Restore any deleted sentinels.
fat_pos = self.copy_sentinels(write_lines,fat_lines,fat_pos,mapping,i1,i2)</t>
<t tx="EKR.20040504123809.7">while j_pos &lt; j2:
	line = j_lines[j_pos]
	if testing: print "Insert:", line,
	write_lines.append(line)
	j_pos += 1

# The input streams are already in synch.</t>
<t tx="EKR.20040504123809.8">while fat_pos &lt; len(fat_lines):
	line = fat_lines[fat_pos]
	write_lines.append(line)
	if testing: print "Append last line",line
	fat_pos += 1</t>
<t tx="EKR.20040504123809.9"># Check that 'push' will re-create the changed file.
strippedLines,sentinel_lines = push_filter(sourcefile)

if strippedLines != targetLines:
	self.report_mismatch(strippedLines, targetLines,
		"Pull did not work as expected",
		"Content of sourcefile:",
		"Content of modified file:")

# Check that no sentinels got lost.
old_strippedLines,old_sentinel_lines = push_filter_lines(sourceLines, marker)

if sentinel_lines != old_sentinel_lines:
	self.report_mismatch(sentinel_lines, old_sentinel_lines,
		"Pull modified sentinel lines:",
		"Current sentinel lines:",
		"Old sentinel lines:")</t>
<t tx="EKR.20040504123809.10">@ This script retains _all_ sentinels.  If lines are replaced, or deleted,
we restore deleted sentinel lines by checking for gaps in the mapping.
@c

def copy_sentinels (self,write_lines,fat_lines,fat_pos,mapping,startline,endline):
	"""
	
	Copy sentinel lines from fat_lines to write_lines.

	Copy all sentinels _after_ the current reader postion up to,
	but not including, mapping[endline].

	"""

	j_last = mapping[startline]
	i = startline + 1
	while i &lt;= endline:
		j = mapping[i]
		if j_last + 1 != j:
			fat_pos = j_last + 1
			# Copy the deleted sentinels that comprise the gap.
			while fat_pos &lt; j:
				line = fat_lines[fat_pos]
				write_lines.append(line)
				if testing: print "Copy sentinel:",fat_pos,line,
				fat_pos += 1
		j_last = j ; i += 1

	fat_pos = mapping[endline]
	return fat_pos</t>
<t tx="EKR.20040504144803">def pull_source(self,sourcefile,targetfile):
	
	&lt;&lt; init pull_source vars &gt;&gt;
	
	write_lines = self.mulderUpdateAlgorithm()
	
	try:
		f = file(targetfilename)
		copy = write_lines != f.readlines()
		f.close()
	else:
		copy = true

	if copy:
		self.update_file(write_lines,targetfile,sourcefile)
		&lt;&lt; paranoia check&gt;&gt;</t>
<t tx="EKR.20040504145724">def update_file(lines, sourcefilename, targetfilename):

	if testing:
		print "Copying ", sourcefilename, " to ", targetfilename, " without sentinals"

	if do_backups:
		&lt;&lt; create backup copy of targetfile &gt;&gt;

	outfile = open(targetfilename, "w")
	for line in lines:
		outfile.write(line)
	outfile.close()
	copy_time(sourcefilename, targetfilename)</t>
<t tx="EKR.20040504145724.1"># Keep the old file around while we are debugging this script
if os.path.exists(targetfilename):
	count = 0
	backupname = "%s.~%s~" % (targetfilename, count)
	while os.path.exists(backupname):
		count += 1
		backupname = "%s.~%s~" % (targetfilename, count)
	os.rename(targetfilename, backupname)
	if print_copy_operations:
		print "backup file in ", backupname</t>
<t tx="EKR.20040504145724.2"># Indices into i_lines, j_lines &amp; fat_lines.
i_pos = j_pos = fat_pos = 0

# These vars check that all ranges returned by get_opcodes() are contiguous.
i2_old = j2_old = -1

# Create the output lines.
write_lines = []

matcher = difflib.SequenceMatcher(None,strippedSourceLines,targetLines)</t>
<t tx="bwmulder.120603131249">@
This is an experimental script intended to show that sentinels in files are not really necessary.

The script can either be run standalone, or it can be run as a plugin to Leo.</t>
<t tx="bwmulder.120603131812">@language python
"""
Proof of concept implementation of sentinel free Leo files.

This script operates on files. It maps files with sentinels to files
without sentinels, and back.

The mapping itself is given in a configuration file:

[sentinel]
s1 = file1
d1 = file2
extensions = &lt;extension1&gt; &lt;extension2&gt; ...

maps 'file1' to 'file2'. 'file1' is the file produce by Leo, with
sentinels, 'file2' is the file without sentinels.

The names 's1' and 'd1' do not mean anything; they are just used to
match an input name to an output name. The configuration script reader
just looks at the first character, if it is a 's' or 'd'. If there is
something of the form s&lt;string&gt; in the configuration file, then the
name d&lt;string&gt; must be in the configuration file too, and vice versa,
where &lt;string&gt; is some arbitrary identifier.

The name  'sourcedirectory' is *not* taken to be the indication of
a sourcefile. You can use this to define one sourcedirectory.
Similarly, the name 'destinationdirectory' is explicitly checked for.

If you have many files with the same extensions, you can also use
the form:
	extensions = .c .py .bat .cfg
	
Then all files with those extensions will be copied as well. Both
the source and the target directories are checked.


It supports the following operations:

  sync:   update s1 or d1 depending on date.
  push:   update d1 from s1
  pull:   update s1 from d1

call:

sentinel.py &lt;configuration_file&gt; &lt;operation&gt;

I intend to evolve this script to a plugin eventually. Salient features:

	- The configuration options are minimal: I chose the smallest interface
		which allows the job to be done.
	
	- The script treats Leo as a black box: no change whatsoever is
		required in Leo.
	
		Of course, the logic implemented here can and should be
		integrated into Leo.  But since I do not really know or
		understand the Leo internals, it deemed me to be faster to get
		to results by completely ignoring how Leo does things
		internally.

Despite this, the script tries to implement a complete solution.

The current version of the script is programmed very defensivly. It
has extra internal checks, and keeps backup versions of files
around. This is only temporary until I have some confidence in the
program.

The standalone version of this script might be obsolete once
the functionality is available as a plugin.
"""

testing = False
print_copy_operations = True # True: tell if files are copied?
do_backups = True

@others

if __name__ == '__main__':
	if (len(sys.argv) == 4 and
		 sys.argv[1] == 'setup'):
		create_ext(directory=sys.argv[2], sourcedir=sys.argv[3])
	else:
		main(sys.argv[1], sys.argv[2])</t>
<t tx="bwmulder.120603131812.1">from ConfigParser import ConfigParser
import difflib
import sys, os, shutil

</t>
<t tx="bwmulder.120603131812.2">def get_filenames(configfilename):
	"""
	Get the source and destination files.

	Later, we might get the module level variables too.
	
	"""
	global testing, print_copy_operations, do_backups

	cp = ConfigParser()
	cp.read(configfilename)
	sectionkey = 'sentinel'
	assert cp.has_section(sectionkey)
	keys = cp.options(sectionkey)
	keys.sort()
	mapping = {}
	files = []
	for key in keys:
		if key in ('sourcedir', 'targetdir'):
			continue
		if key in ('testing', 'print_copy_operations', 'do_backups'):
			value = cp.getboolean(sectionkey, key)
			if key == 'testing':
				testing = value
			elif key == 'print_copy_operations':
				print_copy_operations = value
			elif key == 'do_backups':
				do_backups = value
			else:
				assert 0
			continue
		if key == 'extensions':
			# Copy all files with the extensions
			extensions = cp.get(sectionkey, 'extensions').split()
			sourcedir = cp.get(sectionkey, 'sourcedir')
			targetdir = cp.get(sectionkey, 'targetdir')
			s, t = {}, {}
			for filename in os.listdir(sourcedir) + os.listdir(targetdir):
				rootname, ext = os.path.splitext(filename)
				if ext in extensions:
					files.append((os.path.join(sourcedir, filename), os.path.join(targetdir, filename)))
		continue
		assert len(key) &gt;= 2
		assert key[0] in ('s', 'd'), "Invalid keyword in configfile:" + key
		if key[0] == 's':
			dkey = 'd' + key[1:]
			if not dkey in keys:
				print "key %s is in the section, then so must %s" % (key, dkey)
				assert 0
			files.append((cp.get(sectionkey, key), cp.get(sectionkey, dkey)))
	return files
</t>
<t tx="bwmulder.120603131812.3">def write_if_changed(lines, sourcefilename, targetfilename):
	"""
	
	Checks if 'lines' matches the contents of
	'targetfilename'. Refreshes the targetfile with 'lines' if not.

	Produces a message, if wanted, about the overrite, and optionally
	keeps the overwritten file with a backup name.

	"""
	if not os.path.exists(targetfilename):
		copy = True
	else:
		copy = lines != file(targetfilename).readlines()
	if copy:
		if print_copy_operations:
			print "Copying ", sourcefilename, " to ", targetfilename, " without sentinals"

		if do_backups:
			# Keep the old file around while we are debugging this script
			if os.path.exists(targetfilename):
				count = 0
				backupname = "%s.~%s~" % (targetfilename, count)
				while os.path.exists(backupname):
					count += 1
					backupname = "%s.~%s~" % (targetfilename, count)
				os.rename(targetfilename, backupname)
				if print_copy_operations:
					print "backup file in ", backupname
		outfile = open(targetfilename, "w")
		for line in lines:
			outfile.write(line)
		outfile.close()
		copy_time(sourcefilename, targetfilename)
	return copy</t>
<t tx="bwmulder.120603131812.4">def push(files):
	"""
	
	Copies the sourcefiles from the source location to the target
	location, deleting all sentinels.
	
	"""
	for sourcefilename, targetfilename in files:
		push_file(sourcefilename, targetfilename)
</t>
<t tx="bwmulder.120603131812.5">class sourcereader:
	"""
	A simple class to read lines sequentially.
	
	The class keeps an internal index, so that each
	call to get returns the next line.
	
	Index returns the internal index, and sync
	advances the index to the the desired line.
	
	The index is the *next* line to be returned.
	
	The line numbering starts from 0.
	
	"""

	@others
</t>
<t tx="bwmulder.120603131812.7">def __init__(self, lines):
	self.lines = lines
	self.length = len(self.lines)
	self.i = 0
</t>
<t tx="bwmulder.120603131812.8">def index(self):
	return self.i
</t>
<t tx="bwmulder.120603131812.9">def get(self):
	result = self.lines[self.i]
	self.i += 1
	return result</t>
<t tx="bwmulder.120603131812.10">def sync(self, i):
	self.i = i
</t>
<t tx="bwmulder.120603131812.11">def size(self):
	return self.length
</t>
<t tx="bwmulder.120603131812.12">class sourcewriter:
	
	"""
	Convenience class to capture output to a file.
	"""

	@others


</t>
<t tx="bwmulder.120603131812.13">def __init__(self):
	self.i = 0
	self.lines = []
</t>
<t tx="bwmulder.120603131812.14">def push(self, line):
	self.lines.append(line)
	self.i += 1
</t>
<t tx="bwmulder.120603131812.15">def index(self):
	return self.i
</t>
<t tx="bwmulder.120603131812.16">def getlines(self):
	return self.lines
</t>
<t tx="bwmulder.120603131812.17">class sentinel_squasher:
	"""
	The heart of the script.
	
	Creates files without sentinels from files with sentinels.
	
	Propagates changes in the files without sentinels back
	to the files with sentinels.
	
	"""

	@others</t>
<t tx="bwmulder.120603131812.19">def create_back_mapping (self,lines,marker):
	"""

	'lines' is a list of lines of a file with sentinels.
 
	Returns:

	result: lines with all sentinels removed.

	mapping: a list such that result[mapping[i]] == lines[i]
	for all i in range(len(result))

	"""

	mapping = [] ; result = []
	for i in xrange(len(lines)):
		line = lines[i]
		if not is_sentinel(line,marker):
			result.append(line)
			mapping.append(i)

	# Create a last mapping entry for copy_sentinels.
	mapping.append(i)

	return result, mapping</t>
<t tx="bwmulder.120603131812.20">@ Sentinels are NEVER deleted by this script. They are changed as a result of user actions in the Leo.

If code is replaced, or deleted, then we must make sure that the sentinels are still in the Leo file.

We have two options to detect sentinel lines:
  1. We could detect sentinel lines by examining the lines of the leo file.
  2. We can check for gaps in the mapping.
We choose the second approach because @verbatim complicates the recognition of sentinels.
@c

def copy_sentinels (self,writer,leo_reader,mapping,startline,endline):
	"""
	
	Copy lines from leo_reader to writer if those lines contain sentinels.

	Copy all sentinels after the current reader postion up to,
	but not including, mapping[endline].

	"""

	j_last = mapping[startline]
	i = startline + 1
	while i &lt;= endline:
		j = mapping[i]
		if j_last + 1 != j:
			leo_reader.sync(j_last + 1)
			# Copy the deleted sentinels that comprise the gap.
			while leo_reader.index() &lt; j:
				line = leo_reader.get()
				if testing: print "Copy sentinels:", line,
				writer.push(line)
		j_last = j ; i += 1

	leo_reader.sync(mapping[endline])</t>
<t tx="bwmulder.120603131812.21">def pull_source(self, sourcefile, targetfile):
	"""

	Propagate the changes of targetfile back to sourcefile.
	sourcefile has sentinels, and targetfile does not.

	This is the heart of the script.

	"""
	if testing: g.trace(sourcefile,targetfile)
	&lt;&lt; init pull_source vars &gt;&gt;
	&lt;&lt; establish the loop invariant &gt;&gt;
	for tag, i1, i2, j1, j2 in matcher.get_opcodes():
		if testing: print "%7s"%tag,"i1,i2",i1,i2,"j1,j2",j1,j2
		&lt;&lt; update and check the loop invariant &gt;&gt;
		if tag == 'equal':
			&lt;&lt; handle 'equal' tag &gt;&gt;
		elif tag == 'replace':
			&lt;&lt; handle 'replace' tag &gt;&gt;
		elif tag == 'delete':
			&lt;&lt; handle 'delete' tag &gt;&gt;
		elif tag == 'insert':
			&lt;&lt; handle 'insert' tag &gt;&gt;
		else: assert 0
	&lt;&lt; copy the sentinels at the end of the file &gt;&gt;
	written = write_if_changed(writer.getlines(),targetfile,sourcefile)
	if written:
		&lt;&lt;final paranoia check&gt;&gt;</t>
<t tx="bwmulder.120603131812.22">def pull(files):
	"""
	
	Propagate the changes back to the files with sentinels.
	
	"""
	sq = sentinel_squasher()
	for sourcefile, targetfile in files:
		sq.pull_source(sourcefile, targetfile)
</t>
<t tx="bwmulder.120603223857">@doc
This is what a configuration file for 'sentinel.py' might look like.
@code
[sentinel]
testing = False
# should this script use extra test code?

print_copy_operations = True
# Should this script tell if files are copied?

do_backups = True
# Should rename existing files (true), or just overwrite (false)

sourcedir=c:/leo/cmp_new
targetdir=c:/leo/cmp_run

s0=%(sourcedir)s/addressmodes.py
d0=%(targetdir)s/addressmodes.py
# and so on...
</t>
<t tx="bwmulder.120603223949">@doc
This is some basic testing.</t>
<t tx="bwmulder.120603231230"></t>
<t tx="bwmulder.120603231306"></t>
<t tx="bwmulder.120603231526">[Main]
test_to_run = all
# use all to run all tests.

cleanup = True
# Set to true if you want all files deleted.

leodir = C:/bwm/ftptoot/Cleo-4.1-beta-5</t>
<t tx="bwmulder.120703000133">@others</t>
<t tx="bwmulder.120703000133.1">import os
from unittest import TestCase, TestSuite, TextTestRunner
import sentinel
import shutil
</t>
<t tx="bwmulder.120703000409">class insert_test(sentinel_test):
	@others</t>
<t tx="bwmulder.120703001355">class sentinel_test(TestCase):
	@others</t>
<t tx="bwmulder.120703001355.1">def setup_inputfile(self, input):
	classname = self.__class__.__name__
	self.input_filename = os.path.join('test/s_%s.txt' % classname)
	self.output_filename = os.path.join('test/d_%s.txt' % classname)
	outfile = file(self.input_filename, "w")
	for line in input:
		outfile.write(line)
	outfile.close()
	
	
 
</t>
<t tx="bwmulder.120703001355.2">def setUp(self):
	sentinel_test.setUp(self)
	self.setup_inputfile(self.prefix + 
["Proof of concept implementation of sentinel free Leo files.\n",
"We try to insert a line after here\n",
"This should be after the inserted line\n",
"This should be the last line in the file\n"]
 + self.postfix)

	# here are the same lines, without sentinels
	self.lines = ["Proof of concept implementation of sentinel free Leo files.\n",
	 "We try to insert a line after here\n",
	 "This should be after the inserted line\n",
	 "This should be the last line in the file\n"]
	self.setup_configfile()
</t>
<t tx="bwmulder.120703001355.3">def runTest(self):
	"""
	
	Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
	
	"""
	
	# First, produce the sentinel free output.
	sentinel.main(self.configfilename, "push")
	
	# Verify this first step.
	assert os.path.exists(self.output_filename)
	assert file(self.output_filename).readlines() == self.lines
	
	# then insert one line in the sentinel free output.
	lines = self.lines
	lines[2:2] = ["This is an inserted line\n"]
	outfile = file(self.output_filename, "w")
	for line in lines:
		outfile.write(line)
	outfile.close()
	
	# get the sources back.
	sentinel.main(self.configfilename, "pull")
	
	# re-generate the output.
	sentinel.main(self.configfilename, "push")
	
	# and check for equality.
	assert file(self.output_filename).readlines() == lines
	
	
	
	
	
	



</t>
<t tx="bwmulder.120703002020">if __name__ == '__main__':
	#fileName = os.path.join(os.getcwd(),"testing.ini")
	#config = ConfigParser.ConfigParser()
	#config.read(fileName)
	#main = "Main"
	#leodir = config.get(main, "leodir")
	#test_to_run = config.get(main, "test_to_run")
	test_to_run = 'all'
	
	if os.path.exists("test"):
		shutil.rmtree("test")
	os.mkdir("test")
	suite = TestSuite()
	if test_to_run == 'all':
		for testclass in (
			insert_test,
			replace_test,
			replace_test2,
			replace_test3,
			regression_test_1,         
		):
			suite.addTest(testclass())
	else:
		suite.addTest(globals()[test_to_run]())
	testrunner = TextTestRunner()
	testrunner.run(suite)
 </t>
<t tx="bwmulder.120703002843">def setup_configfile(self):
	self.configfilename = "test/sentinel.cfg"
	outfile = file(self.configfilename, "w")
	outfile.write("[sentinel]\n")
	outfile.write("\ns1=%s\n" % self.input_filename)
	outfile.write("\nd1=%s\n" % self.output_filename)
	outfile.close()

</t>
<t tx="bwmulder.120703004049">def main(configuration_file, command):
	files = get_filenames(configuration_file)
	if command == 'sync':
		sync(files)
	elif command == 'push':
		push(files)
	else:
		assert command == 'pull'
		pull(files)
	
</t>
<t tx="bwmulder.120703004433"></t>
<t tx="bwmulder.120703004433.1"></t>
<t tx="bwmulder.120703105944">class replace_test(sentinel_test):
	"""
	Replace a single line.
	"""
	@others</t>
<t tx="bwmulder.120703105944.1">def setUp(self):
	sentinel_test.setUp(self)
	self.lines = [
	 "Proof of concept implementation of sentinel free Leo files.\n",
	 "This line should be replaced\n",
	 "This should be the last line in the file\n"]
	self.setup_inputfile(self.prefix + self.lines + self.postfix)

	# here are the same lines, without sentinels
	self.setup_configfile()
</t>
<t tx="bwmulder.120703105944.2">def runTest(self):
	"""
	
	Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
	
	"""
	
	# First, produce the sentinel free output.
	sentinel.main(self.configfilename, "push")
	
	# Verify this first step.
	assert os.path.exists(self.output_filename)
	assert file(self.output_filename).readlines() == self.lines
	
	# then insert one line in the sentinel free output.
	lines = self.lines
	lines[2:2] = ["This is a replaced line\n"]
	outfile = file(self.output_filename, "w")
	for line in lines:
		outfile.write(line)
	outfile.close()
	
	# get the sources back.
	sentinel.main(self.configfilename, "pull")
	
	# re-generate the output.
	sentinel.main(self.configfilename, "push")
	
	# and check for equality.
	assert file(self.output_filename).readlines() == lines
	
	
	
	
	
	



</t>
<t tx="bwmulder.120703141328">def setUp(self):
	self.prefix = ["#@+leo-ver=4\n",
"#@+node:@file sentinel.py\n",
"#@@language python\n"]
	self.postfix = ["#@-node:@file sentinel.py\n",
"#@-leo\n"]
</t>
<t tx="bwmulder.120703170308">def push_filter(sourcefilename):
	"""
	
	Removes sentinels from the lines of 'sourcefilename'.
	
	"""

	return push_filter_lines(file(sourcefilename).readlines(), marker_from_extension(sourcefilename))</t>
<t tx="bwmulder.120803112447">class replace_test2(sentinel_test):
	"""
	Replace two lines.
	"""
	@others</t>
<t tx="bwmulder.120803112447.1">def setUp(self):
	sentinel_test.setUp(self)
	self.lines = [
	"Line 0\n",    #0
"   Line 1\n",    #1
"   Line 2.\n",   #2
"   Line 3.\n",   #3
"   Line 4\n",    #4
"\n", #5
" We have two subclasses:\n", #6
"   single_clss represents a (condition, register) =&gt; (expression_number, linenumber) mapping.\n", #7
"   set_class represents a set of (condition, register) =&gt; (expression_number, linenumber) mapping.\n", #8
"\n", #9
" Line 10\n", #10
" Line 11\n" #11
]
	self.setup_inputfile(self.prefix + self.lines + self.postfix)

	# here are the same lines, without sentinels
	self.setup_configfile()
</t>
<t tx="bwmulder.120803112447.2">def runTest(self):
	"""
	
	Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
	
	"""
	
	# First, produce the sentinel free output.
	sentinel.main(self.configfilename, "push")
	
	# Verify this first step.
	assert os.path.exists(self.output_filename)
	assert file(self.output_filename).readlines() == self.lines
	
	# then insert two lines in the sentinel free output.
	lines = self.lines
	lines[7:9] = ["   single_class represents a (condition, register) =&gt; (expression_number, linenumber) mapping.\n", #7
					  "   set_class represents a set of (condition, register) =&gt; (expression_number, linenumber) mappings.\n", #8
					 ]
	outfile = file(self.output_filename, "w")
	for line in lines:
		outfile.write(line)
	outfile.close()
	
	# get the sources back.
	sentinel.main(self.configfilename, "pull")
	
	# re-generate the output.
	sentinel.main(self.configfilename, "push")
	
	# and check for equality.
	assert file(self.output_filename).readlines() == lines
	
	
	
	
	
	



</t>
<t tx="bwmulder.120803130808"># We need the ranges returned by get_opcodes to completely cover the source lines being compared.
# We also need the ranges not to overlap.
if i2_old != -1:
	assert i2_old == i1
	assert j2_old == j1
i2_old = i2 ; j2_old = j2

@ Loosely speaking, the loop invariant is that we have processed everything up to,
but not including, the lower bound of the ranges returned by the iterator.

We have to check the three readers, i_reader, j_reader, and leo_reader. For the
writer, the filter must reproduce the modified file up until, but not including,
j1. In addition, all the sentinels of the original Leo file, up until
mapping[i1], must be present in the new_source_file.

@code

# Check the loop invariant.
assert i_reader.i == i1
assert j_reader.i == j1
assert leo_reader.i == mapping[i1]
if testing: # A bit costly.
	t_sourcelines,t_sentinel_lines = push_filter_lines(writer.lines, marker)
	# Check that we have all the modifications so far.
	assert t_sourcelines == j_reader.lines[:j1]
	# Check that we kept all sentinels so far.
	assert t_sentinel_lines == push_filter_lines(leo_reader.lines[:leo_reader.i], marker)[1]</t>
<t tx="bwmulder.120803131809">def push_filter_lines(lines, marker):
	"""
	
	Removes sentinels from lines.
	
	"""
	result, sentinel_lines = [], []
	for line in lines:
		if is_sentinel(line, marker):
			sentinel_lines.append(line)
		else:
			result.append(line)
	return result, sentinel_lines
</t>
<t tx="bwmulder.120803144940">@ 
We compare the 'targetlines' with 'strippedSourceLines' and propagate the
changes back into 'writer' while making sure that all sentinels of 'sourcelines'
are copied as well.

The loop invariant is that all three readers are in sync. Also, writer has
accumulated the new file, which is going to replace leo_reader.
@c

# Check that all ranges returned by get_opcodes() are contiguous
i2_old = j2_old = -1

# Copy the sentinels at the beginning of the file.
while leo_reader.index() &lt; mapping[0]:
	line = leo_reader.get()
	writer.push(line)</t>
<t tx="bwmulder.120803161509">@nocolor
Add deletion test.

Make sure that an insertion at the end of a file gets put into the file *before* the last sentinel.

</t>
<t tx="bwmulder.120803171348">class replace_test3(sentinel_test):
	"""
	Replace the lines of a whole node.
	"""
	@others</t>
<t tx="bwmulder.120803171348.1">def setUp(self):
	sentinel_test.setUp(self)
	self.lines = [
	"#@+node:main\n",
	"node 1: line 1\n", # 1
	"node 1: line 2\n", # 2
	"#@-node:main\n",
	"#@-others\n",
	"node 2: line 3\n", # 3
	"node 2: line 4\n", # 4
	"#@-node:@file sentinel.py\n",
	]
	self.setup_inputfile(self.prefix + self.lines + self.postfix)

	# here are the same lines, without sentinels
	self.setup_configfile()
</t>
<t tx="bwmulder.120803171348.2">def runTest(self):
	"""
	
	Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
	
	"""
	
	# First, produce the sentinel free output.
	sentinel.main(self.configfilename, "push")
	
	# Verify this first step.
	assert os.path.exists(self.output_filename)
	filtered_lines = sentinel.push_filter_lines(self.lines)[0]
	assert file(self.output_filename).readlines() == filtered_lines
	
	# then insert one line in the sentinel free output.
	filtered_lines [2:4] = [   "These lines should be totally different\n",
	"and be replaced across sentinel blocks,\n",

					 ]
	outfile = file(self.output_filename, "w")
	for line in filtered_lines:
		outfile.write(line)
	outfile.close()
	
	# get the sources back.
	sentinel.main(self.configfilename, "pull")
	
	# re-generate the output.
	sentinel.main(self.configfilename, "push")
	
	# and check for equality.
	assert file(self.output_filename).readlines() == filtered_lines
	
	
	
	
	
	



</t>
<t tx="bwmulder.120803234359">class replace_test4(sentinel_test):
	"""
	Replace the lines of a whole node.
	"""
	@others</t>
<t tx="bwmulder.120803234359.1">def setUp(self):
	sentinel_test.setUp(self)
	self.lines = [
	"#@+node:main\n",
	"node 1: line 1\n", # 1
	"node 1: line 2\n", # 2
	"#@-node:main\n",
	"#@-others\n",
	"node 2: line 3\n", # 3
	"node 2: line 4\n", # 4
	"#@-node:@file sentinel.py\n",
	]
	self.setup_inputfile(self.prefix + self.lines + self.postfix)

	# here are the same lines, without sentinels
	self.setup_configfile()
</t>
<t tx="bwmulder.120803234359.2">def runTest(self):
	"""
	
	Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
	
	"""
	
	# First, produce the sentinel free output.
	sentinel.main(self.configfilename, "push")
	
	# Verify this first step.
	assert os.path.exists(self.output_filename)
	filtered_lines = sentinel.push_filter_lines(self.lines)[0]
	assert file(self.output_filename).readlines() == filtered_lines
	
	# then insert one line in the sentinel free output.
	filtered_lines [1:3] = [   "These lines should be totally different\n",
	"and be replaced across sentinel blocks,\n",

					 ]
	outfile = file(self.output_filename, "w")
	for line in filtered_lines:
		outfile.write(line)
	outfile.close()
	
	# get the sources back.
	sentinel.main(self.configfilename, "pull")
	
	# re-generate the output.
	sentinel.main(self.configfilename, "push")
	
	# and check for equality.
	assert file(self.output_filename).readlines() == filtered_lines
	
	
	
	
	
	



</t>
<t tx="bwmulder.120903095722"></t>
<t tx="bwmulder.120903095722.1"></t>
<t tx="bwmulder.120903095722.2">@doc
these are tests representing errors which I encountered during the development of the code.</t>
<t tx="bwmulder.120903095939">class regression_test_1(sentinel_test):
	"""
	Replace a single line.
	"""
	@others</t>
<t tx="bwmulder.120903095939.1">def setUp(self):
	self.lines = [
"#@+leo-ver=4\n",
"#@+node:@file driver.py\n",
"#@@language python\n",
"#@+others\n",
"#@+node:imports\n",
"# Analyse an IA64 assembly file:\n",
"#   1. Identify basic blocks.\n",
"#   2. Track the contents of registers symbolically.\n",
"import os, sys, cmp_globals\n",
"\n",
"#@-node:imports\n",
"#@+node:process_file\n",
"def process_file(infile, pyname_full, configfile, firststep, laststep):\n",
"   \n",
"      proc()\n",
"#@nonl\n",
"#@-node:process_file\n",
"#@-others\n",
"#@-node:@file driver.py\n",
"#@-leo\n"
]
	self.setup_inputfile(self.lines)

	# here are the same lines, without sentinels
	self.setup_configfile()
</t>
<t tx="bwmulder.120903095939.2">def runTest(self):
	"""
	
	Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
	
	"""
	
	# First, produce the sentinel free output.
	sentinel.main(self.configfilename, "push")
	
	# Verify this first step.
	assert os.path.exists(self.output_filename)
	assert file(self.output_filename).readlines() == sentinel.push_filter_lines(self.lines)[0]
		
	# get the sources back.
	sentinel.main(self.configfilename, "pull")
	
	# Now check that the source has not been changed.
	assert file(self.input_filename).readlines() == self.lines   
	
	
	
	
	



</t>
<t tx="bwmulder.120903101940"># was check_lines_for_equality

def report_mismatch (self,lines1,lines2,message,lines1_message,lines2_message):

	"""
	Generate a report when something goes wrong.
	"""

	print '='*20
	print message

	print lines1_message
	print '-'*20
	for line in lines1:
	  print line,
	 
	print '='*20

	print lines2_message
	print '-'*20
	for line in lines2:
		print line,

	print
	assert 0,message</t>
<t tx="bwmulder.120903191818">@ For the initial usage, we check that the output actually makes sense.
	We check two things:
	1. Applying a 'push' operation will produce the modified file.
	2. Our new sourcefile still has the same sentinels as the replaced one.
@c

s_outlines,sentinel_lines = push_filter(sourcefile)

# Check that 'push' will re-create the changed file.
if s_outlines != targetlines:
	self.report_mismatch(s_outlines, targetlines,
		"Pull did not work as expected",
		"Content of sourcefile:",
		"Content of modified file:")

# Check that no sentinels got lost.
old_sentinel_lines = push_filter_lines(leo_reader.lines[:leo_reader.i], marker)[1]
if sentinel_lines != old_sentinel_lines:
	self.report_mismatch(sentinel_lines, old_sentinel_lines,
		"Pull modified sentinel lines:",
		"Current sentinel lines:",
		"Old sentinel lines:")</t>
<t tx="bwmulder.120903214930">@ignore</t>
<t tx="bwmulder.121303184116.8">def sync(files):
	"""
	Do either a pull or push, depending on the date of the files.
	"""
	
	none, push, pull = 'None', 'push', 'pull'
	for sourcefilename, targetfilename in files:
		sourcetime = targettime = operation = None
		if os.path.exists(sourcefilename):
			sourcetime = os.path.getmtime(sourcefilename)
		if os.path.exists(targetfilename):
			targettime = os.path.getmtime(targetfilename)
		if sourcetime:
			if targettime:
				if sourcetime &gt; targettime:
					operation = push
				elif sourcetime &lt; targettime:
					operation = pull
			else:
				operation = push
		elif targettime:
			operation = pull
		if operation == push:
			if print_copy_operations:
				print push, sourcefilename, targetfilename
			push_file(sourcefilename, targetfilename)
			copy_time(sourcefilename, targetfilename)
		elif operation == pull:
			if print_copy_operations:
				print pull, sourcefilename, targetfilename
			if sourcetime:
				sq = sentinel_squasher()
				sq.pull_source(sourcefilename, targetfilename)
				copy_time(targetfilename, sourcefilename)
			else:
				shutil.copy2(targetfilename, sourcefilename)</t>
<t tx="bwmulder.121303192118">def push_file(sourcefilename, targetfilename):
	outlines, sentinel_lines = push_filter(sourcefilename)
	write_if_changed(outlines, sourcefilename, targetfilename)
</t>
<t tx="bwmulder.121303212121">def copy_time(sourcefilename, targetfilename):
	"""
	Set the modification time of the targetfile the same
	as the sourcefilename
	"""
	st = os.stat(sourcefilename)
	if hasattr(os, 'utime'):
		os.utime(targetfilename, (st.st_atime, st.st_mtime))
	elif hasattr(os, 'mtime'):
		os.mtime(targetfilename, st.st_mtime)
	else:
		assert 0, "Sync operation can't work if no modification time can be set"</t>
<t tx="bwmulder.20040411130852">@tabwidth 4
@doc
Purpose of this plugin:
	- Separate Leo comments from regular code.
	- Put a 'regular' Leo file into a Leo subfolder.
	- Update the derived file and the shadow file
	  simultaneously.
	- Correct the linenumber command in the presence
	  of shadow files.
	
</t>
<t tx="bwmulder.20040411130914">@language python
&lt;&lt;docstring&gt;&gt;
&lt;&lt;imports&gt;&gt;
@others

testing = False

print_copy_operations = False
# Should this script tell if files are copied?

do_backups = False
# Just in case something goes wrong, there will always be
# a backup file around

def stop_testing():
	global testing
	testing = False
	
applyConfiguration()

if active:
	print "Hooks put into Leo..."
	putInHooks()
	# Register the handlers...
	# ?leoPlugins.registerHandler("idle", autosave)
	__version__ = "0.2"
	g.es("Plugin enabled: Use a Leo subfolder for files with Leo sentinels",color="orange")</t>
<t tx="bwmulder.20040411130914.1">import leoPlugins
import leoGlobals as g
from leoGlobals import true,false

from ConfigParser import ConfigParser

import difflib
import sys, os, shutil, inspect

from leoGlobals import es, scanDirectives, os_path_join, app, skip_ws, match

import leoCommands, leoImport

import leoAtFile

</t>
<t tx="bwmulder.20040411140005">def applyConfiguration(config=None):

	"""Called when the user presses the "Apply" button on the Properties form.
	
	Not sure yet if we need configuration options for this plugin."""

	global active
	if config is None:
		fileName = os.path.join(g.app.loadDir,"../","plugins","mod_LeoSubFolder.ini")
	config = ConfigParser()
	if os.path.exists(fileName):
		config.read(fileName)
		active = config.get("Main", "Active")
	else:
		active = True</t>
<t tx="bwmulder.20040411140303">def putInHooks():
	"""
	Put in hooks to use the Leo subfolder.
	
	We have to intercept open calls which open
	file to read and write derived files.
	
	goToLineNumber and messageCommment are
	replaced.
	"""
	leoAtFile.__dict__['open'] = LeoSubfolderPluginOpen
	setattr(leoCommands.Commands, 'goToLineNumber', goToLineNumber)
	setattr(leoImport.leoImportCommands, 'massageComment', massageComment)</t>
<t tx="bwmulder.20040411145427">def LeoSubfolderPluginOpen(*args, **kw):
	"""
	Replacement for the standard open.
	
	Used, because the read / write functions are so huge.
	"""
	@others

	# Check if the should replace the standard open.
	if len(kw) != 0:
		return open(*args, **kw)
	if len(args) == 2:
		filename = args[0]
		if args[1] == 'rb':
			try:
				# if testing: import pdb; pdb.set_trace()
				leofilename = Check_for_replacement(filename, 'read')
				if leofilename:
					g.es("Reading %s instead of %s" %  (leofilename, filename), color="orange")
					return read(leofilename, filename)
			except:
				import traceback; traceback.print_exc()
				raise
		elif args[1] == 'wb':
			try:
				leofilename = Check_for_replacement(filename, 'openWriteFile')
				if leofilename:
					g.es("writing %s instead of %s" %  (leofilename, filename), color="orange")
					return write(leofilename, filename)
			except:
				import traceback; traceback.print_exc()
				raise
	return open(*args, **kw)</t>
<t tx="bwmulder.20040411224315">def read(leofilename, filename):
	"""
	Loefilename is the name of the Leo File.
	Filename is the name of the file specified by the user.
	"""
	sq = sentinel_squasher()
	# special check for filelength 0:
	if os.path.getsize(filename) == 0:
		# assume that we have to copy the file leofilename to
		# filename.
		es("Copy %s to %s without sentinels" % (leofilename, filename))
		push_file(sourcefilename=leofilename, targetfilename=filename)
	else:
		sq.pull_source(sourcefile = leofilename, targetfile = filename)
	return open(leofilename, 'rb')
	
	
	
</t>
<t tx="bwmulder.20040411225517">def Check_for_replacement(filename, functionname):
	"""
	Check if the open call should be replaced.
	
	Check the caller: the caller function
	should be named 'read', and the simple filename
	should be 'leoAtFile.py.
	
	A file with the same name should be in a subfolder
	called Leo. This file, rather than filename,
	should be returned.
	
	Return the Leo filename if this is the case.
	"""
	replace = False
	try:
		currentframe = inspect.currentframe()
		functionframe = currentframe.f_back.f_back
		caller = functionframe.f_code.co_name
		sourcefile   = inspect.getsourcefile(functionframe)
		if sourcefile:
			simplename = os.path.split(sourcefile)[1]
		else:
			simplename = ''
		replace = functionname == caller and simplename == 'leoAtFile.py'
	except:
		pass
	if replace:
		# Check if a subfolder called 'Leo' exists, and if this subfolder
		# contains a source with the same name.
		dir, simplename = os.path.split(filename)
		leofilename = os.path.join(dir, 'Leo', simplename)
		leofilenameroot, ext = os.path.splitext(leofilename)
		if ext == '.tmp':
			# special handling for save operation.
			replace = os.path.exists(leofilenameroot)
			if replace:
				# copy both files, with and without sentinels,
				# to temp files.
				shutil.copy2(leofilenameroot, leofilename)
				shutil.copy2(os.path.splitext(filename)[0], filename)
		else:
			replace = os.path.exists(leofilename)
	if replace:
		return leofilename
	else:
		return None

</t>
<t tx="bwmulder.20040411225818">class writeclass(file):
	"""
	Small class to remove the sentinels from the Leo
	file and write the result back to the derived file.
	This happens at the close operation of the file.
	"""
	def __init__(self, leofilename, filename):
		self.leo_originalname = filename
		self.leo_filename = leofilename
		file.__init__(self, leofilename, 'wb')
	
	def close(self):
		file.close(self)
		leo_filename, leo_originalname = self.leo_filename, self.leo_originalname
		assert leo_filename.endswith(".tmp")
		shutil.copy2(leo_filename, leo_filename[:-4])
		# we update regular file in the Leo subdirectory, otherwise structural changes get lost.
		push_file(sourcefilename = self.leo_filename, targetfilename = self.leo_originalname)
		os.unlink(leo_filename)
	

</t>
<t tx="bwmulder.20040411225818.1">def write(leofilename, filename):
	"""
	Loefilename is the name of the Leo File.
	Filename is the name of the file specified by the user.
	This case is slightly more complicated:
		everything must be done at the close.
	"""
	return writeclass(leofilename, filename) 
	
</t>
<t tx="bwmulder.20040412145811">"""
By Bernhard Mulder

Use a Leo subfolder for files with Leo comments.

This is experimental code.

The hookup with Leo is not satisfactory. I am missing suitable hooks for implementing
an input / output filter, and the read / write functions
are too big to overwrite.

The goToLineNumber has been copied from 4.1, with the
insertions marked by bwm:.

I do not know how to avoid the code duplication.

To start using this plugin:
	- Create a Leo subfolder in your source directory.
	- Move all files into this subfolder.
	- Create 0 length files for all moved files.
	
As soon as you modify a file, the plugin will update
your files in the usual place.

The plugin has special code to deal with 0 length derived files.
"""
</t>
<t tx="bwmulder.20040412162613">@doc
Is this the canonical way to overwrite code?</t>
<t tx="bwmulder.20040412185825">def atEnd(self):
	return self.index &gt;= self.length</t>
<t tx="bwmulder.20040413103739">def is_sentinel(line, marker):
	"""
	Check if line starts with a Leo marker.
	
	Leo markers are filtered away by this script.
	
	Leo markers start with a comment character, which dependends
	on the language used. That's why the marker is passed in.
	"""
	return line.lstrip().startswith(marker)</t>
<t tx="bwmulder.20040413103739.1">def push_filter_mapping(filelines, marker):
	"""
	Given the lines of a file, filter out all
	Leo sentinels, and return a mapping:
		
		stripped file -&gt; original file
		
	Filtering should be the same as
	push_filter_lines
	"""
	
	mapping = [None]
	for linecount, line in enumerate(filelines):
		if not is_sentinel(line, marker):
			mapping.append(linecount+1)
	return mapping
</t>
<t tx="bwmulder.20040413103739.2">def goToLineNumber (self):

	c = self ; v = c.currentVnode()
	&lt;&lt; set root to the nearest @file, @silentfile or @rawfile ancestor node &gt;&gt;
	&lt;&lt; read the file into lines &gt;&gt;
	&lt;&lt; get n, the line number, from a dialog &gt;&gt;
	# trace("n:"+`n`)
	if n==1:
		v = root ; n2 = 1 ; found = true
	elif n &gt;= len(lines):
		v = root ; found = false
		n2 = v.bodyString().count('\n')
	elif root.isAtSilentFileNode():
		&lt;&lt; count outline lines, setting v,n2,found &gt;&gt;
	else:
		&lt;&lt;bwm: apply linemapping&gt;&gt;
		vnodeName,childIndex,n2,delim = self.convertLineToVnodeNameIndexLine(lines,n,root)
		found = true
		if not vnodeName:
			es("invalid derived file: " + fileName)
			return
		&lt;&lt; set v to the node given by vnodeName and childIndex or n &gt;&gt;
	&lt;&lt; select v and make it visible &gt;&gt;
	&lt;&lt; put the cursor on line n2 of the body text &gt;&gt;
</t>
<t tx="bwmulder.20040413103739.3"># Search the present node first.
j = v.t.joinList
if v in j:
	j.remove(v)
j.insert(0,v)

# 10/15/03: search joined nodes if first search fails.
root = None ; fileName = None
for v in j:
	while v and not fileName:
		if v.isAtFileNode():
			fileName = v.atFileNodeName()
		elif v.isAtSilentFileNode():
			fileName = v.atSilentFileNodeName()
		elif v.isAtRawFileNode():
			fileName = v.atRawFileNodeName()
		else:
			v = v.parent()
	if fileName:
		root = v
		# trace("root,fileName",root,fileName)
		break # Bug fix: 10/25/03
if not root:
	es("Go to line number: ancestor must be @file node", color="blue")
	return</t>
<t tx="bwmulder.20040413103739.4"># 1/26/03: calculate the full path.
d = scanDirectives(c)
path = d.get("path")

fileName = os_path_join(path,fileName)

&lt;&lt;bwm: check for Leo subfolder&gt;&gt;
try:
	file=open(fileName)
	lines = file.readlines()
	file.close()
except:
	es("not found: " + fileName)
	return
	
&lt;&lt;bwm: construct linenumber mapping&gt;&gt;</t>
<t tx="bwmulder.20040413103739.5">dir, simple_filename = os.path.split(fileName)
leo_subfolder_filename = os.path.join(dir, 'Leo', simple_filename)
leo_subfolder = os.path.exists(leo_subfolder_filename)
if leo_subfolder:
	fileName = leo_subfolder_filename</t>
<t tx="bwmulder.20040413103739.6">n = app.gui.runAskOkCancelNumberDialog("Enter Line Number","Line number:")
if n == -1:
	return</t>
<t tx="bwmulder.20040413103739.7">v = lastv = root ; after = root.nodeAfterTree()
prev = 0 ; found = false
while v and v != after:
	lastv = v
	s = v.bodyString()
	lines = s.count('\n')
	if len(s) &gt; 0 and s[-1] != '\n':
		lines += 1
	# print lines,prev,v
	if prev + lines &gt;= n:
		found = true ; break
	prev += lines
	v = v.threadNext()

v = lastv
n2 = max(1,n-prev)</t>
<t tx="bwmulder.20040413103739.8">after = root.nodeAfterTree()

if childIndex == -1:
	&lt;&lt; 4.x: scan for the node using tnodeList and n &gt;&gt;
else:
	&lt;&lt; 3.x: scan for the node with the given childIndex &gt;&gt;</t>
<t tx="bwmulder.20040413103739.9"># This is about the best that can be done without replicating the entire atFile write logic.

ok = true

if not hasattr(root,"tnodeList"):
	s = "no child index for " + root.headString()
	print s ; es(s, color="red")
	ok = false

if ok:
	tnodeList = root.tnodeList
	&lt;&lt; set tnodeIndex to the number of +node sentinels before line n &gt;&gt;
	tnodeIndex = max(0,tnodeIndex)
	&lt;&lt; set v to the first vnode whose tnode is tnodeList[tnodeIndex] or set ok = false &gt;&gt;
			
if not ok:
	# Fall back to the old logic.
	&lt;&lt; set v to the first node whose headline matches vnodeName &gt;&gt;</t>
<t tx="bwmulder.20040413103739.10">tnodeIndex = -1 # Don't count the @file node.
scanned = 0 # count of lines scanned.

for s in lines:
	if scanned &gt;= n:
		break
	i = skip_ws(s,0)
	if match(s,i,delim):
		i += len(delim)
		if match(s,i,"+node"):
			# trace(tnodeIndex,s.rstrip())
			tnodeIndex += 1
	scanned += 1</t>
<t tx="bwmulder.20040413103739.11">@ We use the tnodeList to find a _tnode_ corresponding to the proper node, so the user will for sure be editing the proper text, even if several nodes happen to have the same headline.  This is really all that we need.

However, this code has no good way of distinguishing between different cloned vnodes in the file: they all have the same tnode.  So this code just picks v = t.joinList[0] and leaves it at that.

The only way to do better is to scan the outline, replicating the write logic to determine which vnode created the given line.  That's way too difficult, and it would create an unwanted dependency in this code.
@c

# trace("tnodeIndex",tnodeIndex)
if tnodeIndex &lt; len(tnodeList):
	t = tnodeList[tnodeIndex]
	# Find the first vnode whose tnode is t.
	v = root
	while v and v != after:
		if v.t == t:
			break
		v = v.threadNext()
	if not v:
		s = "tnode not found for " + vnodeName
		print s ; es(s, color="red") ; ok = false
	elif v.headString().strip() != vnodeName:
		if 0: # Apparently this error doesn't prevent a later scan for working properly.
			s = "Mismatched vnodeName\nExpecting: %s\n got: %s" % (v.headString(),vnodeName)
			print s ; es(s, color="red")
		ok = false
else:
	s = "Invalid computed tnodeIndex: %d" % tnodeIndex
	print s ; es(s, color = "red") ; ok = false</t>
<t tx="bwmulder.20040413103739.12">v = root
while v and v != after:
	if v.matchHeadline(vnodeName):
		break
	v = v.threadNext()

if not v or v == after:
	s = "not found: " + vnodeName
	print s ; es(s, color="red")
	return</t>
<t tx="bwmulder.20040413103739.13">v = root
while v and v != after:
	if v.matchHeadline(vnodeName):
		if childIndex &lt;= 0 or v.childIndex() + 1 == childIndex:
			break
	v = v.threadNext()

if not v or v == after:
	es("not found: " + vnodeName, color="red")
	return</t>
<t tx="bwmulder.20040413103739.14">c.beginUpdate()
c.frame.tree.expandAllAncestors(v)
c.selectVnode(v)
c.endUpdate()</t>
<t tx="bwmulder.20040413103739.15">if found:
	c.frame.body.setInsertPointToStartOfLine(n2-1)
else:
	c.frame.body.setInsertionPointToEnd()
	es("%d lines" % len(lines), color="blue")

c.frame.body.makeInsertPointVisible()</t>
<t tx="bwmulder.20040413103922">if leo_subfolder:
	line_mapping = push_filter_mapping(lines, marker_from_extension(leo_subfolder_filename))</t>
<t tx="bwmulder.20040413104121">if leo_subfolder:
	n = line_mapping[n]</t>
<t tx="bwmulder.20040413134012">def marker_from_extension(filename):
	"""
	Tries to guess the sentinel leadin
	comment from the filename extension.
	
	This code should probably be shared
	with the main Leo code.
	"""
	root, ext = os.path.splitext(filename)
	if ext == '.tmp':
		root, ext = os.path.splitext(root)
	if ext in ('.h', '.c'):
		marker = "//@"
	elif ext in (".py", ".cfg", ".bat", ".ksh"):
		marker = "#@"
	else:
		assert 0, "extension %s not handled by this plugin" % ext
	return marker</t>
<t tx="bwmulder.20040413165431">def massageComment (self,s):

	"""Leo has no busines changing comments!"""

	return s</t>
<t tx="bwmulder.20040414071730">@doc
The following is lifted from the Leo 4.1 code.

Additions in goToLineNumber are in nodes marked bwm:
massageComment is made into a nop.

@code</t>
<t tx="bwmulder.20040414072713"></t>
<t tx="bwmulder.20040414072713.1">@
Here is the code which removes sentinels, and propagates changes back from a sentinel free file to a file with sentinels.

The code can be used either in a free standing script, or integrated with Leo.

In this context, 'push' means creating a file without sentinels from a file with sentinels.

'pull' means propagating changes back from a file without sentinels to a file with sentinels.</t>
<t tx="bwmulder.20040414073616">@doc
A small collection of useful routines and classes which
are not directly tied to the purpose of this plugin.
</t>
<t tx="bwmulder.20040414073616.1">@doc
The following functions filter out Leo comments.

Push file makes sure that the target file is only touched if there are real differences.</t>
<t tx="bwmulder.20040414073917">@doc
The pull operation is more complicated than the pull operation: we must copy back the sources into a Leo files, making sure that the code is in the proper places between the Leo comments.</t>
<t tx="bwmulder.20040414103906">@tabwidth 4</t>
<t tx="bwmulder.20040414135728">@doc
The following classes have a very limited functionality. They help write code
which processes a list of lines slightly more succinctly.

You might consider expanding the code inline.</t>
<t tx="bwmulder.20040414140029"></t>
<t tx="bwmulder.20040414140329"></t>
<t tx="bwmulder.20040414140329.1"></t>
<t tx="bwmulder.20040414181247">def create_leo_subdirectory(files, directory="."):
	"""
	Moves 'files' into a Leo subdirectory.
	
	'files' are replaced with files without sentinels.
	
	files is the list of files which should be shuffled to the subdirectory.
	
	- Checks if a Leo subdirectory exists. If yes, does nothing.
	
	- Moves the files to the Leo subdirectory.
	
	- Creates files without sentinels in the original directory.
	"""
	from os.path import exists, join, split, splitext
	assert exists(directory)
	targetfiles = [join(directory, element) for element in files]
	missing_files = [filename for filename in targetfiles if not exists(filename)]
	assert len(missing_files) == 0,"Files do not exist:%s" % missing_files
		
	leo_directory = join(directory, "Leo")
	if exists(leo_directory):
		print "Directory already exists. Exit"
		return
	os.mkdir(leo_directory)
		
	pairs = [split(filename) for filename in targetfiles]
	sourcefiles = [join(dir, 'Leo', name) for dir, name in pairs]
	full_filenames = zip(sourcefiles, targetfiles)
	for targetfile, sourcefile in full_filenames: os.rename(sourcefile, targetfile)
	push(full_filenames) 
</t>
<t tx="bwmulder.20040414182149">def create_ext(extensions=('.py', '.c', '.cpp', '.h', '.bat'), directory=".", sourcedir=None):
	"""
	Convenience script: calls create_leo_subdirectory for all files in 'directory' with an extension in 'extensions'.
	
	NOTE THAT IF BOTH A DIRECTORY AND A SOURCEDIR ARE SPECIFIED, THIS SCRIPT WILL DELETE THE WHOLE DIRECTORY 'directory'.
	
	"""
	if sourcedir:
		# For quick testing, we make a copy of a directory.
		if os.path.exists(directory):
			shutil.rmtree(directory)
		shutil.copytree(sourcedir, directory)

		# Not sure if this is necessary, but let's delete all .pyc files
		map(os.unlink, [os.path.join(root, filename) 
			for root, dirs, files in os.walk(directory) 
				for filename in files if os.path.splitext(filename)[1] == '.pyc'])
				
	files = [f for f in os.listdir(directory) if os.path.splitext(f)[1] in extensions]
	create_leo_subdirectory (files, directory)</t>
</tnodes>
</leo_file>
