"Toggle toolbar and menu bar.
set guioptions-=r
set guioptions-=T
set guioptions-=m

map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
                        \set guioptions-=T <Bar>
                        \set guioptions-=m <bar> 
						\set guioptions-=r
                    \else <Bar>
                        \set guioptions+=T <Bar>
                        \set guioptions+=m <Bar>
						\set guioptions-=r <Bar>
                    \endif<CR>
"Font.
"set guifont=Monaco
:if (has('win64') || has('win32'))
:	set guifont=Consolas:h11:cANSI
:endif

"colorscheme zenburn
"colorscheme mayansmoke

set vb t_vb=

