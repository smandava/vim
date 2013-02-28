function! OpenFitnesseInBrowser(fitnesseFile) abort
    let l:port='8086'
    if a:fitnesseFile =~ "wt\\"|let l:port='8085'| endif
    if a:fitnesseFile =~ "br202\\"|let l:port='8084'| endif
    let l:part = fnamemodify(a:fitnesseFile,':t')
    let l:remaining = a:fitnesseFile
    let l:parts=[]
    while (l:part != '' && l:part !=? "FitNesseRoot")
        call add(l:parts,l:part)
        let l:remaining = fnamemodify(l:remaining,':h')
        let l:part = fnamemodify(l:remaining,':t')
    endwhile
    if (l:part ==? "FitNesseRoot")
        let l:parts = reverse(l:parts)
    else
        let l:parts = []
    endif
    let l:url = 'http://localhost:' . l:port . '/' . join(l:parts,'.')
    execute 'silent !"c:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ' . l:url
endfunction

nnoremap <silent> <Leader>b :call OpenFitnesseInBrowser(expand("%:p:h"))<CR>
"augroup! LetterWriting autocmd FileType text
AlignCtrl=P0p0
set nowrap
