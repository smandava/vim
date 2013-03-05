if !exists('g:launcher_application')
  if has('mac')
    let g:launcher_application='open'
  elseif has('macunix')
    let g:launcher_application='open'
  else
    let g:launcher_application='xdg-open'
  endif
endif

function! s:Searchdochub(doc_type, keyword)
  let url = '"http://dochub.io/\#'.a:doc_type.'/'.a:keyword.'"'
  exe 'silent !' .  g:launcher_application . ' ' . url
endfunction

nnoremap <silent> <Leader>hc :call <SID>Searchdochub('css',substitute(expand('<cWORD>'),'\A*$','',''))<CR>
nnoremap <silent> <Leader>hh :call <SID>Searchdochub('html',substitute(expand('<cword>'),'\A*$','',''))<CR>
nnoremap <silent> <Leader>hjq :call <SID>Searchdochub('jquery',substitute(expand('<cword>'),'\A*$','',''))<CR>
nnoremap <silent> <Leader>hjs :call <SID>Searchdochub('javascript',substitute(expand('<cword>'),'\A*$','',''))<CR>

