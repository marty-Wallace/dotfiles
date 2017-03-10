" Improved vimrc file with plugins using the Vundle package manager
" Author: <Martin Wallace, Martin.V.Wallace@ieee.org>

" removes backwards compatibily with vi
set nocompatible

" set spacing stuff
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" set filetype off while installing plugins
filetype off

" Load plugins from here
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle -- vim package manager
Plugin 'gmarik/Vundle.vim'
" Syntax highlighting for rust
Plugin 'wting/rust.vim'
" Distraction free mode for vim
Plugin 'junegunn/goyo.vim'
" Better code folding
Plugin 'tmhedberg/SimpylFold'
" Syntax error checking plugin
"Plugin 'scrooloose/syntastic'
" PEP8 checking
Plugin 'nvie/vim-flake8'
" FileTree
Plugin 'scrooloose/nerdtree'
" Filetree tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Git commands in vim 
Plugin 'tpope/vim-fugitive'

" All plugins should be loaded before this is called 
call vundle#end()

" Ignore certain files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

" Set syntax highlighting on
filetype on
syntax on

" Filetype dependent indenting
filetype plugin indent on


" Move up and down editor lines rather than full lines
noremap j gj
noremap k gk


" Displays the current line and column
set ruler
" no f$#!ing beeping
set visualbell

" Set encoding type
set encoding=utf-8

" Buffers screen updates, may help with scrolling lag
set lazyredraw
"display line numbers
set number

" Highlights matching brackets and quotes
set showmatch

" Display recent commands
set showcmd

" Enable code folding
set foldmethod=indent
set foldlevel=99
" Enabling space bar for code folding
nnoremap <space> za

" Enable running the current python script with F9 
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


" Enable switching between screens with Ctrl+[hjkl] 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>

" Open up file tree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Close vim if only window open is a filetree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

