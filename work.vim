autocmd FileType CS if @% =~ "wt\\"|setlocal tags+=c:\ngt\dat\201csharptags| endif
autocmd FileType CS if @% =~ "wtdev\\"|setlocal tags+=c:\ngt\dat\csharptags| endif
nnoremap <silent> <Leader>fw     :call fuf#givenfile#launch('', 0, 'WtDev>', readfile('c:\NGT\dat\code.dat'))<CR>
nnoremap <silent> <Leader>f2     :call fuf#givenfile#launch('', 0, '201>', readfile('c:\NGT\dat\201code.dat'))<CR>
