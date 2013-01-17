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

nnoremap <buffer> <LocalLeader>z :call <SID>ToggleFoldMethod()<Cr>

finish
