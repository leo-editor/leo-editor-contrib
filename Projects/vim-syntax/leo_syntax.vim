"@+leo-ver=5-thin
"@+node:maphew.20101201124731.3123: * @file leo_syntax.vim
"@@language vim
"@+others
"@+node:matt.20110208081851.1592: ** syn main
" Leo editor additions
" to activate change save this file as ~/.vim/after/leo_syntax.vim

" --- Leo directive ---
" We assume anything with one of @@, @+, @- near line start is a leo headline/directive.
" Examples:
"		#@+leo-ver=5-thin
"		#@+node:johndoe.20100928224755.1557: * @file foobar.py
"		#@@first
"		#@+<<docstring> >
"
" Search pattern break down:
"
"	^		beginning of line
"	.		any single character
"	\{,4}	0 to 4 of preceeding pattern (any single character in this case)
"	\zs		Set start of match here (http://vimhelp.appspot.com/pattern.txt.html#%2F\zs)
"	@[@\-+]	match any of: @@, @+, @-
"	.*		include everything after, to end of line
"
"	(better but too hard(?): match only if preceding character is a known comment delimeter)

syn match   leoSentinel  "^.\{,4}\zs@[@\-+].*"	 containedin=ALL
	" why did this stop this working with html files?

" Resume normal emphasis within leoHeadline after last asterisk (*)
" Idea is to keep the node's name (headline contents) prominent
syn match   Comment         "\* .*$"hs=s+1  containedin=leoSentinel

highlight leoSentinel guifg=grey ctermfg=darkgrey


"@+node:matt.20110208081851.1593: *3* Wishlist
"@+at
" Q: background highlight entire node line. Idea is to still communicate or delineate the Leo node boundaries, but hide the noisy stuff. As is now the headline text kind of floats in the middle of nowhere.
" 
" Apparently not possible:
" @url http://stackoverflow.com/questions/2150220/how-do-i-make-vim-syntax-highlight-a-whole-line
" 
" 
" Q: would rather the headline colour say 'x% lighter than comment colour, in same hue'. This would be more adaptable to different colour schemes.
" 
" Possible, but probably not worth it:
" @url http://stackoverflow.com/questions/1331213/how-to-modify-existing-highlight-group-in-vim
"@-others
"@-leo
