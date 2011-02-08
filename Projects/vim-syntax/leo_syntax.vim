"@+leo-ver=5-thin
"@+node:maphew.20101201124731.3123: * @file leo_syntax.vim
"@@language vim
"@+others
"@+node:matt.20101204175038.1321: ** main
" Leo editor additions
" to activate change save this file as ~/.vim/after/filetype.vim

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

syn match   leoSentinel  "^.\{,4}\zs@[@\-+].*"	 containedin=Comment,pythonComment,vimComment,vimMtchComment,vimLineComment,perlComment,perlDATA,perlPOD,vimScriptDelim,rubyRegexpComment,rubyComment,rubyDocumentation,rubyData,htmlCommentPart,htmlComment,javaScriptLineComment,javaScriptComment,htmlCssStyleComment,vbComment,vbLineNumber,cssComment
	" why can't we use plain ol 'Comment' group instead of 'pythonComment' etc. ?
	" why did this stop this working with html files?

" Resume normal emphasis within leoHeadline after last asterisk (*)
" Idea is to keep the node's name (headline contents) prominent
syn match   Comment         "\* .*$"hs=s+1  containedin=leoSentinel

highlight leoSentinel guifg=grey


" Wishlist:
"	- background highlight entire node line. Idea is to still communicate or delineate the Leo node boundaries, but hide the noisy stuff. As is now the headline text kind of floats in the middle of nowhere.
"	- would rather the headline colour say 'x% lighter than comment colour, in same hue'. This would be more adaptable to different colour schemes.
"
"@-others
"@-leo
