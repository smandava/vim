function! ultisnipext#FuzzyFindSnippet() abort
    "let completes=pyeval("dict((s.trigger.__str__(),s.description.__str__()) for s in UltiSnips_Manager._snips('',True))")
	let atListener = {}
	function! atListener.onComplete(item, method)
        let beg = match(a:item,'\v\(') + 1
        let ending = match(a:item,'\v\)') - 1
        if (beg < 1 || ending <= 0)
            echom "bad index " . beg . " " . ending
        else
            let pos = getpos('.')
            let snip = a:item[beg : ending]
            let word = matchstr(getline('.'), '\S\+\%'.col('.').'c')
            if (len(word))
                let snip = ' '.snip
            endif
            let before = strpart(getline("."),0, col("."))
            let after  = strpart(getline("."),col("."))
            call setline(line('.'),before.snip.after)
            let pos[2] = pos[2] + len(snip)
            call setpos('.',pos)
        endif
	endfunction
	
	function! atListener.onAbort() abort
	  echo "Abort"
	endfunction

    let completes=pyeval("[s.description.__str__() for s in UltiSnips_Manager._snips('',True)]")
	call fuf#callbackitem#launch('', 0, '> ', atListener, completes,0)
endfunction

" function! ultisnipext#FindSnippet() abort
"     let completes=pyeval("[s.trigger.__str__() for s in UltiSnips_Manager._snips('',True)]")
"     call complete(col('.'),completes)
"     return ''
" endfunction

function! ultisnipext#FindSnippet() abort
	let line  = getline('.')
	let col   = col('.')
	let word  = matchstr(getline('.'), '\S\+\%'.col.'c')
	let words = [word]
	if stridx(word, '.')
		let words += split(word, '\.', 1)
	endif
	let matchlen = 0
	let matches = []
    for trigger in pyeval("[s.trigger.__str__() for s in UltiSnips_Manager._snips('',True)]")
    	for word in words
    		if word == ''
    			let matches += [trigger] " Show all matches if word is empty
    		elseif trigger =~ '^'.word
    			let matches += [trigger]
    			let len = len(word)
    			if len > matchlen | let matchlen = len | endif
    		endif
    	endfor
    endfor

	" This is to avoid a bug with Vim when using complete(col - matchlen, matches)
	" (Issue#46 on the Google Code snipMate issue tracker).
	call setline(line('.'), substitute(line, repeat('.', matchlen).'\%'.col.'c', '', ''))
	call complete(col, matches)
	return ''
endf
