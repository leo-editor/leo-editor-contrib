"@+leo-ver=5-thin
"@+node:matt.20101212004153.1446: * @file filetype.vim
"@@language vim
"@+others
"@+node:matt.20101212004153.1442: ** ftype main
" Leo editor additions
" to activate save this file as ~/.vim/after/filetype.vim

if !exists("after_autocmds_loaded")
    let after_autocmds_loaded = 1
    au BufNewFile,BufRead * source ~/.vim/after/leo_syntax.vim
endif
"@+node:matt.20101212004153.1441: *3* notes
"@+at
" The name 'filetype.vim' seems to be sourced BEFORE the syntax files, even when
" in 'after' dir, so it gets overwritten by the default syntax file. Therefore we
" resort to this.
" @url http://stackoverflow.com/questions/4301716/extend-modify-vim-highlighting-for-all-filetypes-at-once/4301809#4301809
"@-others
"@-leo
