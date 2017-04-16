" Improved vimrc file with plugins using the Vundle package manager
" Author: Martin Wallace <Martin.V.Wallace@ieee.org>


""""""""""""""""""""""""""""""""""""""
"    Configuration Section
"
" basic vim configuration stuff
"""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set nocompatible
syntax on

"use space for leaderkey
let mapleader=' '

" fix stupid backspace issues
set backspace=indent,eol,start

" set tabbing stuff
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

" Move up and down editor lines rather than full lines
noremap j gj
noremap k gk

"Highlight current line
set cursorline

" # of screen lines to keep above and below cursor
set scrolloff=20

" displays current line and column
set ruler
set relativenumber

" Never beep again
set visualbell
set showmatch
set showcmd

" Buffers screen updates, may help with scrolling lag
set lazyredraw

" Enable switching between screens with Ctrl+[hjkl]
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-H> :wincmd h<CR>

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

"Set backspace in Visual mode to delete selection
vnoremap <BS> d

"Set triple leader to save and quit
nnoremap <leader><leader><leader> :wq<CR>
"Remove highlighting
nnoremap <leader>h :nohl<CR>

" Elite mode
nnoremap <silent> <Up>     :resize +2<CR>
nnoremap <silent> <Down>   :resize -2<CR>
nnoremap <silent> <Left>   :vertical resize +2<CR>
nnoremap <silent> <Right>  :vertical resize -2<CR>


""""""""""""""""""""""""""""""""""""""
"    Plugins using Vundle
"
""""""""""""""""""""""""""""""""""""""
filetype off                      " required first
set rtp+=~/.vim/bundle/Vundle.vim " required second
call vundle#begin()               " required third
Plugin 'gmarik/Vundle.vim'        " required fourth

"Appearance Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/promptline.vim'

" Utility Plugins
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmhedberg/SimpylFold'
Plugin 'junegunn/goyo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Tag Plugins
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'majutsushi/tagbar'

" FileTree Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"Git plugins
Plugin 'tpope/vim-fugitive'

"Python Plugins
Plugin 'nvie/vim-flake8'

" Rust Plugins
Plugin 'wting/rust.vim'

call vundle#end()
filetype on
filetype plugin indent on




""""""""""""""""""""""""""""""""""""""
"   NerdTree Configuration Section
"
""""""""""""""""""""""""""""""""""""""
" Ignore certain files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Close vim if only window open is a filetree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Map Ctrl-N to Nerd tree
map <C-f> :NERDTreeToggle<CR>

"Change default arrows"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Start up NERDTree if vim is started on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif



""""""""""""""""""""""""""""""""""""""
"   SimpylFold Configuration Section
"
""""""""""""""""""""""""""""""""""""""

" Enable code folding
set foldlevel=99

" Enabling tab for code folding
nnoremap <tab><tab> za


""""""""""""""""""""""""""""""""""""""
"   tagbar Configuration Section
"
""""""""""""""""""""""""""""""""""""""
"let g:tagbar_ctags_bin="~/.vim/bundle/exuberant-ctags/"



""""""""""""""""""""""""""""""""""""""
"   Custom functions section
"
""""""""""""""""""""""""""""""""""""""

"{ Open up a URL in firefox
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!firefox ".line
endfunction

"}

"{ Toggle paste mode
let paste_mode = 0
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

" Enable running the current python script with F9
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

"Map my functions
nnoremap <leader>b :call Browser()<CR>
nnoremap <leader>p :call PasteToggle()<CR>





""""""""""""""""""""""""""""""""""""""
"   Ultisnips Configuration section
"
""""""""""""""""""""""""""""""""""""""

" ultisnips mapping
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"



""""""""""""""""""""""""""""""""""""""
"   Vim-Airline Configuration section
"
""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1



""""""""""""""""""""""""""""""""""""""
"   Promptline.vim Configuration section
"
""""""""""""""""""""""""""""""""""""""

let g:promptline_preset = 'full'

" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd({ 'dir_limit': 2}) ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}


""""""""""""""""""""""""""""""""""""""
"    Appearance Section
"
""""""""""""""""""""""""""""""""""""""

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set background=dark
colors solarized

