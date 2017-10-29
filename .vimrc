" settings {{{
colo desert
syntax on
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set history=100
set ruler
set showcmd
set incsearch
set hlsearch
set smartcase
set ignorecase
set nowrap
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set number
set list listchars=tab:\ \ ,trail:·
set laststatus=2
set encoding=utf-8
set autoread
set cursorline
set showmatch
set shortmess+=I
set t_Co=256
" }}}

" {{ Plugins
execute pathogen#infect()
filetype plugin indent on

" vim-markdown
let g:vim_markdown_folding_disabled = 1   " disable folding
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_math = 1               " latex math
" vim-table-mode
let g:table_mode_corner_corner='+'        " rst
let g:table_mode_header_fillchar='='
"}}
