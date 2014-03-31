""" vim:foldmethod=marker:textwidth=78

set nocompatible
let mapleader=","
let maplocalleader=","

""" Pathogen {{{1 
set runtimepath=~/vim,$VIMRUNTIME
source ~/vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('~/vim/bundle/{}')
call pathogen#incubate()
call pathogen#helptags()

""" }}}1

"""" Encoding and Internationalisation {{{1

"set encoding=utf-8 " This being the 21st century, I use Unicode
set delcombine " Delete combining characters individually

"""" }}}1

"""" Filetype and Syntax {{{1

filetype plugin indent on " Turn on all plugins
if &t_Co > 1 || has('gui_running')
	syntax enable " Syntax highlighting should be on for color terminals
endif

"""" }}}1

"""" Search Options {{{1
set incsearch
set hlsearch
set ignorecase
"""" }}}1

"""" Matching {{{1
set showmatch " Show match for closing member of a natural pair with cursor
set matchtime=4 " Jump to matching character briefly (for .4 sec.)
"""" }}}1

"""" Status Line  {{{1
set laststatus=2 " Always show the status line
set ruler " Always show status bar and position in file
set showmode " Show the current editing mode at all times
set showcmd " Show incomplete commands
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"""" }}}1

"""" path and edit existing {{{1
runtime! macros/editExisting.vim
"
" Add the current file's directory to the path if not already present.
"autocmd BufRead *
"      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
"      \ exec "setlocal path+=".s:tempPath
set autochdir

"""" }}}1

"""" Fuzzy Finder {{{1
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_maxMenuWidth = 250
let g:fuf_previewHeight=5

""nnoremap <Leader><C-b> :! c:\NGT\bin\wtIndex.exe -
"
""let g:fuf_coveragefile_globPatterns=['c:\wtDev\**\*.cs','c:\wtdev\**\*.csproj','c:\wtDev\**\*.css', 'c:\wtDev\**\.config','c:\wtDev\**\content.txt']
"
nnoremap <silent> <Leader>ff     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>fF     :FufFileWithFullCwd<CR>
noremap <silent> <Leader>f<C-f> :FufFile<CR>

nnoremap <silent> <Leader>fj     :FufJumpList<CR>
nnoremap <silent> <Leader>f`     :FufChangeList<CR>
nnoremap <silent> <Leader>fr     :FufMruFile<CR>
nnoremap <silent> <Leader>fR     :FufMruFileInCwd<CR>
nnoremap <silent> <Leader>fc     :FufMruCmd<CR>

nnoremap <silent> <Leader>fb     :FufBuffer<CR>
nnoremap <silent> <Leader>fl     :FufLine<CR>
nnoremap <silent> <Leader>fL     :FufLine!<CR>
nnoremap <silent> <Leader>fh     :FufHelp<CR>

nnoremap <silent> <Leader>fd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>fD     :FufDirWithFullCwd<CR>
nnoremap <silent> <Leader>f<C-d> :FufDir<CR>

nnoremap <silent> <Leader>fm     :FufBookmarkFile<CR>
nnoremap <silent> <Leader>fM :FufBookmarkFileAdd<CR>
vnoremap <silent> <Leader>f<C-m> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> <Leader>fi     :FufBookmarkDir<CR>
nnoremap <silent> <Leader>f<C-i> :FufBookmarkDirAdd<CR>

nnoremap <silent> <Leader>fg     :FufCoverageFile<CR>
nnoremap <silent> <Leader>fG     :FufCoverageFileChange<CR>
nnoremap <silent> <Leader>f<C-g> :FufCoverageFileRegister<CR>

nnoremap <silent> <Leader>ft     :FufBufferTag<CR>
nnoremap <silent> <Leader>fT     :FufBufferTag!<CR>
vnoremap <silent> <Leader>ft     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> <Leader>fT     :FufBufferTagWithSelectedText<CR>

nnoremap <silent> <Leader>fe     :FufEditDataFile<CR>

"nnoremap <silent> <Leader>w     :call fuf#givendir#launch('', 0, 'WtDev>', readfile('c:\wtIndex'))<CR>


"nnoremap <silent> <Leader>t     :FufTag<CR>
"nnoremap <silent> <Leader>T     :FufTag!<CR>
"nnoremap <silent> <Leader><C-]> :FufTagWithCursorWord!<CR>
"nnoremap <silent> <Leader>}     :FufBufferTagWithCursorWord!<CR>
"nnoremap <silent> <Leader>.     :FufBufferTagAll<CR>
"nnoremap <silent> <Leader>>     :FufBufferTagAll!<CR>
"vnoremap <silent> <Leader>.     :FufBufferTagAllWithSelectedText!<CR>
"vnoremap <silent> <Leader>>     :FufBufferTagAllWithSelectedText<CR>
"nnoremap <silent> <Leader>]     :FufBufferTagAllWithCursorWord!<CR>
"nnoremap <silent> <Leader>g     :FufTaggedFile<CR>
"nnoremap <silent> <Leader>G     :FufTaggedFile!<CR>
"nnoremap <silent> <Leader>o     :FufJumpList<CR>
"nnoremap <silent> <Leader>p     :FufChangeList<CR>
"nnoremap <silent> <Leader>q     :FufQuickfix<CR>
"nnoremap <silent> <Leader>e     :FufEditDataFile<CR>
"nnoremap <silent> <Leader>r     :FufRenewCache<CR>
"
"""" }}}1

"""" My Shortcuts {{{1

nnoremap <silent> <Leader>t :TagbarToggle<CR>
nnoremap <silent> <Leader><F10> :vimgrep /<C-R><C-W>/ % <CR>:cope<CR>
nnoremap <silent> <Leader><F11> :vimgrep /\<<C-R><C-W>\>/ % <CR>:cope<CR>
nnoremap <silent> <Leader>e :silent !start explorer /e, %:p:h<CR>
nnoremap <silent> <Leader>o :silent !start Launcher %:p<CR>

"""" }}}1

"""" Syntax Checking {{{1

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript','xml'],
                           \ 'passive_filetypes': [] }

nnoremap <silent> <Leader>s :SyntasticCheck<CR>

set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_html_checker='w3'

"""" }}}1

"""" Command Mode behavioir {{{1
set wildmode=list:full
set wildmenu
"""" }}}1

"""" Windows specific {{{1

if (has('win32'))
	behave mswin 
	" se cursor keys wrap to previous/next line 
	set backspace=indent,eol,start whichwrap+=<,>,[,]

	" backspace in Visual mode deletes selection
	vnoremap <BS> d
    let g:snippets_dir='~\vim\bundle\snipmate\snippets,~\vim\bundle\MyTweaks\snippets'
    let g:launcher_application='Launcher'
endif

""""}}}1

"""" Folding {{{1
nnoremap <silent> <Leader>z0   :set foldlevel=0<CR>
nnoremap <silent> <Leader>z1   :set foldlevel=1<CR>
nnoremap <silent> <Leader>z2   :set foldlevel=2<CR>
nnoremap <silent> <Leader>z3   :set foldlevel=3<CR>
nnoremap <silent> <Leader>z4   :set foldlevel=4<CR>
nnoremap <silent> <Leader>z5   :set foldlevel=5<CR>
"""" }}}1

"""" Tab Behavior {{{1
set tabstop=4
set shiftwidth=4
set expandtab
"""" }}}1

"""" Match it plugin {{{1
runtime macros/matchit.vim
autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
"""" }}}1


"""" UltiSnips {{{1
let g:UltiSnipsSnippetsDir='~/vim/UltiSnips'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsDontReverseSearchPath="1"
inoremap <silent> <c-r><tab> <c-r>=ultisnipext#FindSnippet()<cr>
nnoremap <silent> <Leader>fu    :call ultisnipext#FuzzyFindSnippet()<CR>
"""" }}}1

autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) 
	\ set tabstop=50 |
	\ set expandtab |
	\ set nowrap |

" A comprehensive dictionary file culled from OpenOffice's American and
" British English dictionaries will be used here. You can get the same
" dictionary by changing directory to $OOO_ROOT/share/dict/ooo and doing:
"		cat en_*.dic | sort | uniq | perl -pnle 's!/.*$!!'

set dictionary+=~/vim/big-dict
set complete+=k " Add dictionary search (as per dictionary option)

"""" More Instantly Better Vim - Damian Conway tips {{{1

"Hilight 81st column.
highlight ColorColumn ctermbg=magenta ctermfg=blue
call matchadd('ColorColumn', '\%81v', 100)

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call hlnext#HLNext(0.4)<cr>
nnoremap <silent> N   N:call hlnext#HLNext(0.4)<cr>

"""" }}}1
"map <C-Up> :bn<CR>
"map <C-Down> :bp<CR>

"""" Session Persistence 
"""" History Preservation 
""   - Maximum size of a register is 1K
""   - Likewise, these maximum quantities are 1K:
""			- Number of lines for each register
""			- Number of previously edited files which remember marks
""			- Number of lines in the search pattern, command, and input line
""			histories
""   - Convert the encoding if necessary (doubtful)
""   - Save all marks
""   - Save the buffer list, excluding nameless and help buffers
"set viminfo=s1,<1024,'1024,/1024,:1024,@1024,c,f1,%,n~/.viminfo
"
"""" Session Options 
"" Keep these items:
""		- Empty windows
""		- Buffers, including those not framed in a window
""		- Folds
""		- The help window
""		- Options and mappings, global and local
""		- Window positions and sizes (internal Vim windows, that is)
""		- Unix EOL...I refuse to accept that antiquated two-char bunk...we
""		stopped using TTYs c. C.E. 1970's already!
"" Also use forward slash in any case. I will of course do my best to avoid
"" this becoming useful (Suvurnabhumi, being the Pali for 'Land of IT Managers
"" Whose IQs Soar Well into the Triple Digits')
"set sessionoptions=blank,buffers,folds,help,options,localoptions,winsize
"set sessionoptions+=unix,slash
"" No, just kidding, actually it means 'Land of Gold'
"
"" Save the session on exit (at least for GNU screen); I have lines in my
"" .screenrc that go like so:
""		screen sh -c 'while true; do vim -S ~/.vim/screen.vim; done'
""		title v
"autocmd VimLeave * 
"			\ if &term == 'screen' |
"			\ 	mksession! ~/.vim/screen.vim |
"			\ endif
"
"""" 
"
"""" 
"
"""" Backup 
"
"" Backup files and try local .backup directory before $HOME; original file
"" will be named with an extension of .orig
""set backup backupdir=~/.backup patchmode=.orig
"set backup backupdir=~/.backup backupext=.bak
""set backup backupdir=~/.backup
"" Try to make a .backup directory if possible
"
""autocmd BufWritePre * call system('mkdir ' . expand('<afile>:p:h') . '~/.backup')
""
""let mapleader=","
"
"""""""""""""" Text editiong only """"""""""""""""""""""
"
"set wildmode=list:full
"set wildmenu
"
"
"
"
"
"autocmd FileType cs
"      \ setlocal spell |
"
"filetype plugin on
"let g:GetLatestVimScripts_allowautoinstall=1
""autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h |endif
"autocmd FileType python
"    \ set tags+=$HOME/.vim/tags/python.ctags |
"    \ set omnifunc=pythoncomplete#Complete |
"set noeb vb t_vb=
"
"function BizMeta()
"	new \wtDev\Code\Business\System\BusinessMetadata\BusinessMetadata.xml
"endfunction
"
"function UiMeta()
"	new \wtDev\Code\Ui\Metadata\UiMetadata.xml
"endfunction
"
"function SqlServerCreateTables()
"	new \wtDev\Database\SqlServer2008\Scripts\create_tables.sql
"endfunction
"
"function OracleCreateTables()
"	new \wtDev\Database\Oracle11g\Scripts\create_tables.sql
"endfunction
"
"command! -nargs=0 WtBm :call BizMeta()
"command! -nargs=0 WtUm :call UiMeta()
"command! -nargs=0 WtSct :call SqlServerCreateTables()
"command! -nargs=0 WtOct :call OracleCreateTables()
"
"nnoremap <F5> :buffers<CR>:buffer<Space>
"
"runtime! macros/editExisting.vim
"set ts=4

"let g:tagbar_type_javascript = {
"    \ 'ctagsbin' : 'c:\bin\jsctags.bat'
"\ }

