function! GetTrnsportMode() abort
	if !exists("b:wtMode") 
		let b:wtMode='202'
	endif
	return b:wtMode
endfunction

function! ChangeTrnsportMode() abort
	let mode = GetTrnsportMode()
	let listener = {}
	function! listener.onComplete(item,method)
		let b:wtMode=a:item
	endfunction
	function! listener.onAbort()
		echo "abort"
	endfunction
	call fuf#callbackitem#launch('', 0, '> ', listener, ['201','202'],0)
endfunction

function! TrnsportFitness() abort
	let atListener = {}
	function! atListener.onComplete(item, method)
		let seperator= (has('win32') && !&shellslash) ? "\\" : "/"
		let file=a:item . seperator . "content.txt"
		if filereadable(file)
			execute "edit " . fnameescape(file)
		else
			exe "lcd " . fnameescape(a:item)
			echo "Current working dir to " . fnameescape(a:item)
		endif
	endfunction
	
	function! atListener.onAbort() abort
	  echo "Abort"
	endfunction
	let mode = GetTrnsportMode()
	call fuf#callbackitem#launch('', 1, mode . '> ', atListener, readfile('c:\NGT\dat\ats_' . mode . '.dat'),0)
endfunction

function! TrnsportCode() abort
	let mode = GetTrnsportMode()
	call fuf#givenfile#launch('', 1, mode . '> ', readfile('c:\NGT\dat\code_' . mode . '.dat'))
endfunction

nnoremap <silent> <Leader>fa    :call TrnsportFitness()<CR>
nnoremap <silent> <Leader>fw    :call TrnsportCode()<CR>
nnoremap <silent> <Leader>fW    :call ChangeTrnsportMode()<CR>

autocmd FileType CS if @% =~ "wt\\"|setlocal tags+=c:\ngt\dat\csharptags_201| endif
autocmd FileType CS if @% =~ "wtdev\\"|setlocal tags+=c:\ngt\dat\csharptags_202| endif
