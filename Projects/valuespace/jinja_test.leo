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
<v t="ville.20110409224656.5734"><vh>prelude</vh>
<v t="ville.20110409225443.1446"><vh>@a</vh></v>
</v>
<v t="ville.20110409224656.5735" a="E"><vh>Set vars</vh>
<v t="ville.20110409224656.5737"><vh>@a</vh></v>
</v>
<v t="ville.20110409224656.5736"><vh>@= mytest</vh></v>
<v t="ville.20110409224656.5738"><vh>@r mytest</vh></v>
</vnodes>
<tnodes>
<t tx="ville.20110409224656.5734">@x {
from leo.plugins.jinjarender import JinjaCl

jinja = JinjaCl(c)

@x }
</t>
<t tx="ville.20110409224656.5735">@x {
foo = "hello"
bar = "world"
@x }
</t>
<t tx="ville.20110409224656.5736">@cl jinja

Some template
that should do {{ foo }} 
and {{ bar }}</t>
<t tx="ville.20110409224656.5737"></t>
<t tx="ville.20110409224656.5738">
Some template
that should do hello 
and world</t>
<t tx="ville.20110409225443.1446">
</t>
</tnodes>
</leo_file>
