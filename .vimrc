"FIRST RUN THIS
"git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
"then create the ~/workspace/000_BACKUP folder
"then run vim and run ":PluginInstall"
"and you should be done :)

set nocompatible               " be iMproved
filetype off                   " required!

if has("win32") || has("win16")
set rtp+=c:/Work/vim_conf/vundle
else
set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'jwhitley/vim-matchit'
Bundle 'bufkill.vim'
Bundle 'a.vim'
Bundle 'mbbill/undotree'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/cscope_macros.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'ktchen14/cscope-auto'
" IN TESTING
if has("win32") || has("win16")

else


endif

Bundle 'Shougo/neocomplete.vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'wikitopian/hardmode' 
" NOTE: call HardMode() to enable, EasyMode() to disable
Bundle 'milkypostman/vim-togglelist'
Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'ludovicchabant/vim-gutentags'
Bundle 'will133/vim-dirdiff'
Bundle 'hari-rangarajan/CCTree'

"""" PYTHON STUFF """"
Bundle 'davidhalter/jedi-vim'
"Bundle 'vim-syntastic/syntastic'

" Bundle 'kien/ctrlp.vim' - NOT MAINTAINED, see new link
" Bundle 'Valloric/ListToggle' - does not appear to work
" Bundle 'scrooloose/syntastic' - NO GOOD C LINT ON WINDOWS??
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} - DOES NOT SEEM TO WORK ON WIN
" Bundle 'Lokaltog/vim-powerline' - not MAINTAINED anymore
" Bundle 'taglist.vim'  - OLD One
" Bundle 'fholgado/minibufexpl.vim' - OLD one

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" TO RELOAD the config without restart - :so %
"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if has("win32") || has("win16")
" Set unified temp and backup directory - NOT PORTABLE
set backupdir=c:/Work/000_BACKUP/	" backup (~) stuff
set directory=c:/Work/000_BACKUP//	" swap files

"+++ CTRLP
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" Copy filename/full path to clipboard + substit backslashes
nmap ,cn :let @*=substitute(expand("%:t"), "/", "\\", "g")<CR>
nmap ,cp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>


else

" Set unified temp and backup directory - NOT PORTABLE
set backupdir=~/workspace/000_BACKUP//	" backup (~) stuff
set directory=~/workspace/000_BACKUP//	" swap files

" Copy filename/fullpath to clipboard
nmap ,cn :let @+=expand("%:t")<CR>
nmap ,cp :let @+=expand("%:p")<CR>

endif

 " Trace32 
au BufRead,BufNewFile *.cmm set filetype=trace32
autocmd FileType trace32 setlocal ts=2 sts=2 sw=2 expandtab
"----------------
"---MY CONFIG
"----------------
"NOTE: FONT SETTING REMOVED FOR BETTER RESULTS
" Enable window title
set title

" Mantain contex near pointer
set scrolloff=3

" Enable mouse support
set mouse=a

" Show partial commmands
set showcmd

" Indentation stuff
set autoindent
set smartindent

" TAB config
set tabstop=4		" tab width = 4 spaces
set shiftwidth=4
set smarttab
set expandtab

" Search stuff
set ic
set incsearch
set hlsearch
set smartcase
set magic

" Wrap lines at 120 chars
set textwidth=120

" Syntax
set t_Co=256
syntax on
filetype on
filetype plugin on
filetype indent on

" Auto read a file when it is changed from the outside
set autoread

" Intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Turn line numbers on
set number
set ruler

" Set relative line - auto set on losing focus
" NOTE: use <C-n> to toggle in program (see numbertoggle)
autocmd FocusLost * set number
autocmd FocusGained * set relativenumber

" Stop blinking cursor
set guicursor+=a:blinkon0

" Highlight matchin baces
set showmatch

" Set backup
set backup

" Delete to the left in insert mode with backspace
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Bash-like filename completion
set wildmenu
set wildmode=longest:list,full
set wildignore=*.d,*.o,*.fasl

" Multiple paste after copy
xnoremap p pgvy

"UNDO stuff
set undolevels=10000	" How many undos
set hid					" Hidden buffers, to make sure we don't loose undo history

" Display CSCOPE results in Quickfix window
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Copy-paste from system clipboard
map <C-S-c> "+y

set ttimeoutlen=1

"----------------
"---KEY MAPPINGS 
"----------------
"F2 = save current file (ALL MODES) 
map <F2> :w<CR>
map! <F2> <ESC>:w<CR>

"F3 = DIFF FILE (NEW, WIP)
"Shift-F3 - close all diffs
map <S-F3>c :diffoff!<CR><C-w>c

"F4 OPEN! 
"OLD USAGE: autocmd FileType c map <buffer> <F4> <C-\>g

"F5 OPEN! 
" OLD USAGE: autocmd FileType c map <buffer> <F5> <C-\>s

"F6 OPEN! 
" OLD USAGE: map <F6> <C-\>f

"F7 - switch to .h (ALL MODES)
map <F7> :A<CR>
map! <F7> <ESC>:A<CR>

"F8 = open quickfix window
let g:toggle_list_no_mappings="true"
map <F8> :call ToggleQuickfixList()<CR>

"F9 = Find current file in NERD Tree
map <F9> :NERDTreeFind<CR>

"F10 - Open Buffer Explorer
map <F10> :BufExplorer<CR>

"F11 = Toggle NERD TREE
map <F11> :NERDTreeToggle<CR>

"F12 = Toggle TAGBAR
map <F12> :TagbarToggle<CR>

"Remap keys for faster navigation between windows :)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fast QUIT
nnoremap <leader>q :qall<CR>

" Fast SAVE (for diff)
nnoremap <leader>w :wall!<CR>

"----------------
"---PLUGIN CONFIG
"----------------
"+++ Neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Recommended key-mappings.
" <TAB>: completion. NOTE: CTRL+TAB = TAB without completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y> " : "\<Space>"
" Close popup by <Enter>.
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'

"+++ Supertab
let g:SuperTabDefaultCompletionType = "context"

"Shift-PGUP/PGDOWN - move through quick list witout openning the list
map <S-PageUp> :cp<CR>
map! <S-PageUp> <ESC>:cp<CR>

map <S-PageDown> :cn<CR>
map! <S-PageDown> <ESC>:cn<CR>


"+++ VIM-SESSION
let g:session_autoload="no"
let g:session_autosave="yes"
let g:session_autosave_periodic=10
let g:session_default_overwrite="no"


"+++ A
let g:alternateNoDefaultAlternate=1
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../h'


"+++ VIM-POWERLINE
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#show_message = 0

" remove the encoding part
let g:airline_section_y=''

" unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'
 let g:airline_symbols.linenr = '␊'
 let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 let g:airline_symbols.branch = '⎇'
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 let g:airline_symbols.paste = '∥'
 let g:airline_symbols.whitespace = 'Ξ'

"+++ CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP :pwd'

let g:ctrlp_working_path_mode = '0'

let g:ctrlp_by_filename = 1     "default to filename search, use <c-d> to toggle
let g:ctrlp_max_files = 0       "no limit
let g:ctrlp_max_depth = 100     "max recurse into length
let g:ctrlp_lazy_update = 1200   "only update window 1200ms after typing stopped
let g:ctrlp_regexp = 1          "regex on

let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/workspace/000_ctrlpcache'

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(d|o|as|lo)$',
    \ }


"+++ Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "active_filetypes": ["python"],
	\ "passive_filetypes": ["c","h"]}

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_pylint_exec = 'pylint3'
let g:syntastic_python_checkers = ['pylint3','pylint']
