set guioptions-=r
set guioptions-=T
set guioptions-=m
set mouse=a
"Toggle toolbar and menu bar.


noremap <silent> <Leader><C-M> :if &guioptions =~# 'T' <Bar>
                        \set guioptions-=T <Bar>
                        \set guioptions-=m <Bar>
			\set guioptions-=r <CR>
                    \else <Bar>
                        \set guioptions+=T <Bar>
                        \set guioptions+=m <Bar> 
			\set guioptions+=r <Bar>
                    \endif<CR>
"Font.
"set guifont=Monaco
:if (has('win64') || has('win32'))
:	set guifont=Consolas:h11:cANSI
:endif

"colorscheme zenburn
"colorscheme mayansmoke

set background=dark
colors solarized
call togglebg#map("<Leader><F5>")

set vb t_vb=

