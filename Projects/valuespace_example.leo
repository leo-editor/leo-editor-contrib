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
<v t="ville.20110403183730.2488" a="E"><vh>NewHeadline</vh>
<v t="ville.20110403183730.2489"><vh>@a baz</vh></v>
</v>
<v t="ville.20110403184104.2493"><vh>@r foo2</vh></v>
</vnodes>
<tnodes>
<t tx="ville.20110403183730.2488">@x =foo {

Some lines go here

And more lines here


@x }

@x foo2 = foo.grep('line')
</t>
<t tx="ville.20110403183730.2489"></t>
<t tx="ville.20110403184104.2493">Some lines go here
And more lines here</t>
</tnodes>
</leo_file>
