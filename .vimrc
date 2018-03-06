" vimrc file with plugins using the Vundle package manager
" Author: Martin Wallace <Martin.V.Wallace@ieee.org> """"""""""""""""""""""""""""""""""""""
"    Configuration Section
"
" Basic vim configuration stuff
"""""""""""""""""""""""""""""""""""""""
set encoding=utf-8 
set nocompatible
syntax on

" Get rid of stupid error bell/noise/flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"use space for leaderkey
let mapleader=' '

" fix backspace
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


" # of screen lines to keep above and below cursor
set scrolloff=15
"Highlight current line
set cursorline
" displays current line and column
set ruler
" line number on current line and relative line numbers on other lines
set number relativenumber

set showmatch
set showcmd

" Buffers screen updates, may help with scrolling lag
set lazyredraw

" Enable switching between screens with Ctrl+[hjkl]
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-H> :wincmd h<CR>

if has('unix')
    nnoremap <C-S-C> :w !xclip -selection -c<Cr>
endif

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

"Set backspace in Visual mode to delete selection
vnoremap <BS> d

"Remove highlighting
nnoremap <leader>h :nohl<CR>

" Sorta like hard mode but arrow keys now have a purpose
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
    Plugin 'gmarik/Vundle.vim'    " required fourth

    "Appearance Plugins
    Plugin 'flazz/vim-colorschemes'
    Plugin 'felixhummel/setcolors.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    " Utility Plugins
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'junegunn/goyo.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'vim-syntastic/syntastic'

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

    " Javascript Plugins
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'

    " Solidity Plugins
    Plugin 'tomlion/vim-solidity'

call vundle#end()
filetype on
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""
"   Goyo Configuration Section
"
""""""""""""""""""""""""""""""""""""""
map <C-_> :Goyo<CR>
let g:goyo_width="95%"
let g:goyo_height="95%"


""""""""""""""""""""""""""""""""""""""
"   NerdTree Configuration Section
"
""""""""""""""""""""""""""""""""""""""
" Ignore certain files in nerdtree
let NERDTreeIgnore=['\.pyc$', 'bin', 'node_modules',  '\~$']

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
"   Tagbar Configuration Section
"
""""""""""""""""""""""""""""""""""""""
map <C-t> :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""
"   SimpylFold Configuration Section
"
""""""""""""""""""""""""""""""""""""""
" Enable code folding
set foldlevel=99

" Enabling tab for code folding
nnoremap <tab><tab> za


""""""""""""""""""""""""""""""""""""""
"   Custom functions section
"
""""""""""""""""""""""""""""""""""""""
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   \"\']*")
   exec "!firefox ".line
endfunction

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

" Enable running the current python script with F9
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

"autocmd FileType javascript setlocal tabstop=2 shiftwidth=2

"Map my functions
nnoremap <leader>b :call Browser()<CR>
nnoremap <leader>p :call PasteToggle()<CR>



""""""""""""""""""""""""""""""""""""""
"   Rust Configuration section
"
""""""""""""""""""""""""""""""""""""""
let g:tagbar_type_rust = {
            \ 'ctagstype' : 'rust',
            \ 'kinds' : [
            \'T:types,type definitions',
            \'f:functions,function definitions',
            \'g:enum,enumeration names',
            \'s:structure names',
            \'m:modules,module names',
            \'c:consts,static constants',
            \'t:traits,traits',
            \'i:impls,trait implementations',
            \]
            \}


""""""""""""""""""""""""""""""""""""""
"   Ultisnips Configuration section
"
""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"


""""""""""""""""""""""""""""""""""""""
"   Vim-Airline Configuration section
"
""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1



""""""""""""""""""""""""""""""""""""""
"   Syntastic Configuration section
"
""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['flake8']


let g:syntastic_error_symbol = '⚡'
let g:syntastic_style_error_symbol = '⛔'
let g:syntastic_warning_symbol = 'ℹ'
let g:syntastic_style_warning_symbol = '🐭'

" UTF-8 symbols that show up nice in vim 
" 🐮 ☘ ⛴  🌒 🌗 🌕 🌘 ⛈  ⚡🃏 ☎ 
" ✉ ✂ ⚙ ⛔☢ ✡ ☪ ☮ ⛎ ⏏ ❎ ⁉ ‼ 🆒
" ⛑ 🐵 🐭 🌐 ⛰  ℹ 🙃 ⛳

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>


""""""""""""""""""""""""""""""""""""""
"   JSX Configuration section
"
""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0


""""""""""""""""""""""""""""""""""""""
"    Appearance Section
"
""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win64")
    set guifont=InputMono_Medium:h10:cANSI:qDRAFT
else
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
endif

autocmd VimEnter * SetColors xoria256 Benokai 256-jungle Tomorrow-Night-Eighties 256-grayvim lucius

set background=dark
colorscheme lucius

" This will set the matching parens colors to be magenta and bold with no background
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
highlight Comment cterm=italic
