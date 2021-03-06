" ============================================================================
" Vim-Plug
" ============================================================================
call plug#begin('~/.vim/plugged')

" GitHub Repos
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'brodie/cram', {'do': 'mkdir -p syntax; cp -f contrib/*.vim syntax/'}
Plug 'bronson/vim-trailing-whitespace'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'fisadev/vim-isort'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kergoth/vim-bitbake'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'isRuslan/vim-es6'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjbach/lusty'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/NSIS-syntax-highlighting'

call plug#end()

filetype plugin indent on

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

" Backspace
set backspace=indent,eol,start

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

autocmd FileType cucumber   setlocal colorcolumn=10
autocmd FileType javascript setlocal colorcolumn=100

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
    autocmd FileType python,xml,markdown,vim,lua,dosini,javascript,cucumber autocmd BufWritePre <buffer> :FixWhitespace
    autocmd FileType python,xml,markdown,vim,lua,dosini,javascript,cucumber autocmd BufWritePre <buffer> :call TrimEndLines()
augroup END

autocmd BufRead,BufNewFile *.dash setf dosini
autocmd BufRead,BufNewFile *.t set filetype=cram

autocmd FileType html,xml setlocal expandtab
autocmd FileType html,xml,cucumber setlocal shiftwidth=2
autocmd FileType html,xml,cucumber setlocal tabstop=2
autocmd FileType make setlocal noexpandtab

" ============================================================================
" Plugins
" ============================================================================

" Markdown Plugin
let g:vim_markdown_folding_disabled=1

" Syntastic Plugin
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_python_checkers = ["python3", "pycodestyle", "pylint"]
let g:syntastic_lua_checkers = ["luac"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_python_pycodestyle_args='--ignore=E501,E402'
let g:syntastic_cucumber_checkers        = ['cucumber']
let g:syntastic_cucumber_cucumber_args   = '--profile syntastic'

" Color and syntax
silent! colorscheme solarized

" Airline Plugin
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_spell = 0

" Gundo Plugin
let g:gundo_preview_bottom = 1
let g:gundo_width = 45
let g:gundo_help = 0

" Tagbar Plugin
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Isort Plugin
nnoremap <leader>i :Isort<CR>

" Git Gutter
let g:gitgutter_realtime=0
let g:gitgutter_map_keys=0
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" ============================================================================
" Shortcuts and Key Mappings
" ============================================================================

" Shortcut mappings
nnoremap <leader>mm :NumbersToggle<CR>
nnoremap <leader>er :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>ec :SyntasticCheck<CR>
nnoremap <leader>en :lnext<CR>
nnoremap <leader>ep :lprev<CR>

" Function Key Mappings
    "    <F1> Caught by gnome
nnoremap <F2> :set invpaste<cr>
nnoremap <F3> :FixWhitespace<cr>
nnoremap <F4> :GundoToggle<CR>
nnoremap <F5> :TagbarToggle<CR>
nnoremap <F6> :FZF<CR>
    "    <F10> Caught by gnome
    "    <F11> Caught by gnome
