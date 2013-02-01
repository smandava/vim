" Use light indentation and end sentences with a single space when formatting
" with gq
" Friendlier text editing settings; auto-indentation, narrow (but existent)
" margin, and auto-format of paragraphs in addition to recognition of
" numbered lists
"augroup LetterWriting
"autocmd FileType text 
"		\ setlocal autoindent |
"		\ setlocal textwidth=78 |
"		\ setlocal formatoptions+=an | 
"		\ set tabstop=2 shiftwidth=2 nojoinspaces
"augroup END
