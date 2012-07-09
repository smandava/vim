""" vim:foldmethod=marker:textwidth=78

set nocompatible
let mapleader=","

""" Pathogen {{{1 
set runtimepath=~/vim,$VIMRUNTIME
source ~\vim\bundle\vim-pathogen\autoload\pathogen.vim
call pathogen#infect('~/vim/bundle')
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""" }}}1

"""" Encoding and Internationalisation {{{1

set encoding=utf-8 " This being the 21st century, I use Unicode
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

"""" Fuzzy Finder {{{1

let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_maxMenuWidth = 250

nnoremap <silent> <Leader>f     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>F     :FufFileWithFullCwd<CR>
nnoremap <silent> <Leader><C-f> :FufFile<CR>

nnoremap <silent> <Leader>r     :FufMruFile<CR>
nnoremap <silent> <Leader>R     :FufMruFileInCwd<CR>
nnoremap <silent> <Leader>c     :FufMruCmd<CR>

nnoremap <silent> <Leader>b     :FufBuffer<CR>
nnoremap <silent> <Leader>l     :FufLine<CR>
nnoremap <silent> <Leader>L     :FufLine!<CR>
nnoremap <silent> <Leader>h     :FufHelp<CR>
nnoremap <silent> <Leader>w     :call fuf#givenfile#launch('', 0, 'WtDev>', readfile('c:\NGT\dat\code.dat'))<CR>
"nnoremap <silent> <Leader>w     :call fuf#givendir#launch('', 0, 'WtDev>', readfile('c:\wtIndex'))<CR>


"nnoremap <silent> <Leader>l     :FufCoverageFileChange<CR>
"nnoremap <silent> <Leader>L     :FufCoverageFileChange<CR>
"nnoremap <silent> <Leader><C-l> :FufCoverageFileRegister<CR>
"nnoremap <silent> <Leader>d     :FufDirWithCurrentBufferDir<CR>
"nnoremap <silent> <Leader>D     :FufDirWithFullCwd<CR>
"nnoremap <silent> <Leader><C-d> :FufDir<CR>
"nnoremap <silent> <Leader>u     :FufBookmarkFile<CR>
"nnoremap <silent> <Leader><C-u> :FufBookmarkFileAdd<CR>
"vnoremap <silent> <Leader><C-u> :FufBookmarkFileAddAsSelectedText<CR>
"nnoremap <silent> <Leader>i     :FufBookmarkDir<CR>
"nnoremap <silent> <Leader><C-i> :FufBookmarkDirAdd<CR>
"nnoremap <silent> <Leader>t     :FufTag<CR>
"nnoremap <silent> <Leader>T     :FufTag!<CR>
"nnoremap <silent> <Leader><C-]> :FufTagWithCursorWord!<CR>
"nnoremap <silent> <Leader>,     :FufBufferTag<CR>
"nnoremap <silent> <Leader><     :FufBufferTag!<CR>
"vnoremap <silent> <Leader>,     :FufBufferTagWithSelectedText!<CR>
"vnoremap <silent> <Leader><     :FufBufferTagWithSelectedText<CR>
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
"""" General Text Editing 
"""" Features used regardless the type of file edited, or for broad purposes
"""" such as 'documentation' and 'programming' in general
"
"" All files without a filetype are presumed to be plain text
""autocmd BufRead,BufNewFile *
""			\ if &filetype == '' |
""			\   setlocal filetype=text |
""			\ endif
"
"" Use light indentation and end sentences with a single space when formatting
"" with gq
""set tabstop=2 shiftwidth=2 nojoinspaces
"
"" Friendlier text editing settings; auto-indentation, narrow (but existent)
"" margins, and auto-format of paragraphs in addition to recognition of
"" numbered lists
""autocmd FileType text
""			\ setlocal autoindent |
""			\ setlocal textwidth=78 |
""			\ setlocal formatoptions+=an
"
"" A comprehensive dictionary file culled from OpenOffice's American and
"" British English dictionaries will be used here. You can get the same
"" dictionary by changing directory to $OOO_ROOT/share/dict/ooo and doing:
""		cat en_*.dic | sort | uniq | perl -pnle 's!/.*$!!'
"set dictionary+=~/.vim/big-dict
"set complete+=k " Add dictionary search (as per dictionary option)
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
"autocmd BufRead,BufNewFile content.txt setfiletype fitnesse
""autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h |endif
"set autochdir
"autocmd FileType python
"    \ set tags+=$HOME/.vim/tags/python.ctags |
"    \ set omnifunc=pythoncomplete#Complete |
"let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax
"set noeb vb t_vb=
"au FileType FITNESSE AlignCtrl=P0p0
"au FileType FITNESSE set nowrap
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
"nnoremap <F10> :vimgrep /<C-R><C-W>/ % <CR>:cope<CR>
"nnoremap <F11> :vimgrep /\<<C-R><C-W>\>/ % <CR>:cope<CR>
"
"runtime! macros/editExisting.vim
"set ts=4
""nnoremap <Leader><C-b> :! c:\NGT\bin\wtIndex.exe -
"
""let g:fuf_coveragefile_globPatterns=['c:\wtDev\**\*.cs','c:\wtdev\**\*.csproj','c:\wtDev\**\*.css', 'c:\wtDev\**\.config','c:\wtDev\**\content.txt']
"
