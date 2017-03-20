" Improved vimrc file with plugins using the Vundle package manager
" Author: <Martin Wallace, Martin.V.Wallace@ieee.org>

"set leader key
let mapleader=' '

"removes backwards compatibily with vi
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

"Solarized theme
Plugin 'altercation/vim-colors-solarized'

"Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Autocomplete + Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Syntax highlighting for rust
Plugin 'wting/rust.vim'

" Distraction free mode for vim
"Plugin 'junegunn/goyo.vim'

" Better code folding
Plugin 'tmhedberg/SimpylFold'

" Syntax error checking plugin
"Plugin 'scrooloose/syntastic'
"
" PEP8 checking
"Plugin 'nvie/vim-flake8'

" FileTree
"Plugin 'scrooloose/nerdtree'

" Filetree tabs
"Plugin 'jistr/vim-nerdtree-tabs'

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
set relativenumber

" Highlights matching brackets and quotes
set showmatch

" Display recent commands
set showcmd

" Enable code folding
set foldlevel=99
" Enabling tab for code folding
nnoremap <tab> za

" Enable running the current python script with F9 
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


"{ Open up a URL in firefox
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!firefox ".line
endfunction

"}

let paste_mode = 0
"{ Toggle paste mode 
function! PasteToggle()
    if g:paste_mode == 0
        set paste
        let g:paste_mode = 1
    else
        set nopaste
        let g:paste_mode = 0
    endif
    return
endfunction
"}


"Map my functions
nnoremap <leader>b :call Browser()<CR>
nnoremap <leader>p :call PasteToggle()<CR>


"Set triple leader to save and quit
nnoremap <leader><leader><leader> :wq<CR>


"Set backspace in Visual mode to delete selection
vnoremap <BS> d


" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Enable switching between screens with Ctrl+[hjkl] 
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-H> :wincmd h<CR>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-J>
"nnoremap <C-H> <C-W><C-H>



" Open up file tree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Close vim if only window open is a filetree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"allow more backspacing freedom
set backspace=indent,eol,start

"Strong encryption
set cm=blowfish2

"Highlight current line
set cursorline

"When page starts to scroll, keep the cursor 4 lines from the top and 8 
"lines from the bottom
set scrolloff=4

"Remove highlighting
nnoremap <leader>h :nohl<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

set background=dark
colors solarized

