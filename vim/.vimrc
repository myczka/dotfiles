" Shortcut remaps
nnoremap 0 <^>
inoremap jk <Esc>
vnoremap jk <Esc> 

nnoremap <C-j> m'o<Esc>''
nnoremap <C-k> m'O<Esc>''

" Basic Vim settings
set number          " Show line numbers
syntax on           " Enable syntax highlighting
colorscheme habamax
" Indentation
set tabstop=4       " Tab = 4 spaces
set shiftwidth=4    " Auto-indent size
set expandtab       " Use spaces instead of tabs
set autoindent
set smartindent

" Searching
set ignorecase      " Case-insensitive search
