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
<v t="matt.20101212004153.1367" a="E"><vh>Vim-Syntax</vh>
<v t="matt.20110208050759.1309"><vh>Docs</vh>
<v t="matt.20110208050759.1308"><vh>References</vh>
<v t="matt.20101204175038.1323"><vh>@url appending syntax</vh></v>
<v t="matt.20101204175038.1324"><vh>@url new filetype</vh></v>
</v>
</v>
<v t="matt.20110208081851.1594" a="E"><vh>code</vh>
<v t="matt.20101212004153.1446" a="E"><vh>@file filetype.vim</vh></v>
<v t="maphew.20101201124731.3123" a="E"><vh>@file leo_syntax.vim</vh></v>
</v>
<v t="matt.20110208081851.1595" a="E"><vh>write to vim profile</vh>
<v t="matt.20101212004153.1440"><vh>@auto filetype.vim</vh></v>
<v t="matt.20101204175038.1322"><vh>@auto leo_syntax.vim</vh></v>
</v>
<v t="matt.20101204140731.1281"><vh>tests</vh>
<v t="maphew.20101201124731.3120"><vh>@@file test.py</vh>
<v t="matt.20101128004159.1266"><vh>Level One</vh>
<v t="matt.20101128232629.1271"><vh>Level Two</vh></v>
</v>
</v>
<v t="maphew.20101201124731.3114"><vh>@@file test.html</vh>
<v t="matt.20101128004159.1266"></v>
</v>
<v t="maphew.20101201124731.3117"><vh>@@file test.css</vh>
<v t="matt.20101128004159.1266"></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="maphew.20101201124731.3114">@language html
@others
</t>
<t tx="maphew.20101201124731.3117">@language css
@others
</t>
<t tx="maphew.20101201124731.3120">@language python
@others
</t>
<t tx="matt.20101128004159.1266">Some text in body of level one
@ followed by
/*
/*
/*
/*
/*
/*
multiline 
comment
*/
*/
*/
*/
*/
*/
</t>
<t tx="matt.20101128232629.1271">this is body
of level 2
</t>
<t tx="matt.20101204140731.1281">@path tests</t>
<t tx="matt.20101204175038.1323">http://vimdoc.sourceforge.net/htmldoc/syntax.html#mysyntaxfile-add</t>
<t tx="matt.20101204175038.1324">http://vimdoc.sourceforge.net/htmldoc/filetype.html#new-filetype</t>
<t tx="matt.20101212004153.1367">@ Towards Leo-aware syntax highlighting in vim.
@url http://bazaar.launchpad.net/~leo-editor-team/leo-editor/contrib/files/head:/Projects/vim-syntax/

Syntax files for vim and gvim which demphasize Leo's metadata chatter without
detracting (much) from the information contained in the headline comments. It's
crude but effective.    

Started by Matt Wilkie &lt;maphew@gmail.com&gt;, fall 2010. Feel free to extend and
improve, I've only a vague idea how all this works. ;-)
</t>
<t tx="matt.20110208050759.1308"></t>
<t tx="matt.20110208050759.1309">@
THEORY

The basic idea is to scan for any occurrence of "@@" or "@+" or "@-" within the
first 5 characters of defined syntax lines. If found the line is called a
"leoSentinel" and changed to lightgrey. Each leoSentinel line is further scanned
for the right most asterisk "*", and the contents to the right of that revert
back to the normal Comment colour.

KNOWN LIMITATIONS

Previously the highlighting was working ing Cream+gvim but not stock (g)vim. Now
it works for (g)vim (and is broken in Cream, *sigh*, but much as I like Cream,
it's not the primary target).

It doesn't work with html files,though it did in earlier experiments

</t>
<t tx="matt.20110208081851.1594"></t>
<t tx="matt.20110208081851.1595">@ To activate:
    1. uncomment the relevant @path line (edit as required)
    2. change '@@auto' to '@auto'

It's not necessary to restart vim, though you do need to switch to another file
(buffer) and back again to force a refresh.
@c

# linux
@path ~/.vim/after

# windows (I think)
# @path %userprofile%\_vim\after\   
</t>
</tnodes>
</leo_file>
