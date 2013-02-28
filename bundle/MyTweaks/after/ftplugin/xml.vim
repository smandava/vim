let b:foldEnabled=1
let g:xml_syntax_folding=1
setlocal foldmethod=syntax
setlocal foldlevel=2

function! s:ToggleFoldMethod() abort
	if b:foldEnabled 
                let b:foldEnabled=0
		setlocal foldmethod=manual
		echo "foldmenthod is manual"
	else 
                let b:foldEnabled=1
		setlocal foldmethod=syntax
		echo "foldmenthod is syntax"
	endif
endfunction

nnoremap <buffer> <Leader>zt :call <SID>ToggleFoldMethod()<Cr>

au BufRead  *.xaml setfiletype XML
au FileType xml let &l:equalprg='xmllint --format --recover -'
" au FileType xml vmap <buffer> <Leader>c <esc>a--><esc>'<i<!--<esc>'>$
runtime! macros/matchit.vim
finish
