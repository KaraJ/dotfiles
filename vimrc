" ============================================================================
" NeoBundle
" ============================================================================
if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended by NeoBundle
NeoBundle 'Shougo/vimproc'

" GitHub Repos
NeoBundle "airblade/vim-gitgutter"
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "bling/vim-airline"
NeoBundle "bronson/vim-trailing-whitespace"
NeoBundle "fisadev/vim-isort"
NeoBundle "majutsushi/tagbar"
NeoBundle "myusuf3/numbers.vim"
NeoBundle "othree/xml.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/syntastic"
NeoBundle "sjbach/lusty"
NeoBundle "sjl/gundo.vim"
NeoBundle "tpope/vim-abolish"
NeoBundle "tpope/vim-commentary"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-markdown"
NeoBundle "tpope/vim-repeat"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-unimpaired"

" VimScripts Repos
NeoBundle "NSIS-syntax-highlighting"
NeoBundle "L9"
NeoBundle "FuzzyFinder"

call neobundle#end()

filetype plugin indent on

" Installation check.
NeoBundleCheck

" ============================================================================
" Basic setup for vim that does not involve any plugins.
" ============================================================================

" Syntax Highlighting
syntax on

" Use Dark Colors
set background=dark

" Line Wrapping On
set linebreak

" Hide buffers instead of closing
set hidden

" Searching
set incsearch
set ignorecase
set smartcase

" Map capital letters
:command! WQ wq
:command! Wq wq
:command! BW bw
:command! Bw bw
:command! W w
:command! Q q

" Enable line numbers
set number

" Change the leader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Create new lines in normal mode
nnoremap <silent> <leader>O :pu! _<cr>
nnoremap <silent> <leader>o :pu _<cr>

" Whitespace
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set scrolloff=15

" Command completion
set wildmode=longest,list,full
set wildmenu

" Spelling
set spell

" Folding settings
set foldmethod=indent   "fold based on indent
set foldlevelstart=20
set nofoldenable        "don't fold by default

" Highlight the current line an column
if v:version >= 700
    set cursorline   "highlight current line
    set cursorcolumn "highlight current column
endif

" Highlight 80 Characters wide
set colorcolumn=80

" Directories
set dir=~/.vim/tmp
set backupdir=~/.vim/tmp

" Undo history
set undodir=~/.vim/history
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" ============================================================================
" Misc Settings
" ============================================================================

" Remove blank lines at the end of the file
function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

augroup clear_whitespace
    autocmd!
    autocmd FileType python,markdown,vim,lua,dosini autocmd BufWritePre <buffer> :FixWhitespace
    autocmd FileType python,markdown,vim,lua,dosini autocmd BufWritePre <buffer> :call TrimEndLines()
augroup END

autocmd BufRead,BufNewFile *.dash setf dosini

autocmd FileType html,xml setlocal shiftwidth=2
autocmd FileType html,xml setlocal tabstop=2

" ============================================================================
" Plugins
" ============================================================================

" Markdown Plugin
let g:vim_markdown_folding_disabled=1

" Syntastic Plugin
let g:syntastic_python_checkers = ["python", "pep8", "pylint"]

" Color and syntax
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme solarized

" Airline Plugin
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.branch    = '⭠'
let g:airline_symbols.readonly  = '⭤'
let g:airline_symbols.linenr    = '⭡'

" Gundo Plugin
let g:gundo_preview_bottom = 1
let g:gundo_width = 45
let g:gundo_help = 0

" Tagbar Plugin
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Fuzzy Finder Plugin
let g:fuf_coveragefile_exclude ='\v\~$|\.(o|exe|dll|alk|bak|orig|swp|bz2|gz|wav)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

" Isort Plugin
nnoremap <leader>i :Isort<CR>

" Git Gutter
let g:gitgutter_realtime=0
let g:gitgutter_map_keys=0
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" ============================================================================
" Shortcuts and Key Mappings
" ============================================================================

" Shortcut mappings
nnoremap <leader>mm :NumbersToggle<CR>
nnoremap <leader>er :Errors<CR>
nnoremap <leader>en :lnext<CR>
nnoremap <leader>ep :lprev<CR>

" Function Key Mappings
    "    <F1> Caught by gnome
nnoremap <F2> :set invpaste<cr>
nnoremap <F3> :FixWhitespace<cr>
nnoremap <F4> :GundoToggle<CR>
nnoremap <F5> :TagbarToggle<CR>
nnoremap <F6> :FufCoverageFile<CR>
    "    <F10> Caught by gnome
    "    <F11> Caught by gnome
