filetype plugin indent on
syntax on
colorscheme dark

set tabstop=4 softtabstop=4 expandtab smarttab shiftwidth=4 
set backspace=indent,eol,start
set smartindent autoindent
set ignorecase smartcase
set hlsearch incsearch
set linebreak
set path+=**
set wildmenu 
set hidden
set mouse=a
set encoding=utf-8
set termguicolors
set modelines=5 display+=lastline
set noswapfile
set showcmd
set undofile undodir="~/.vim/undo/"

" Improve CTRL+x + CTRL+o autocomplete function 
set omnifunc=syntaxcomplete#Complete

" DEFINE VARIABLES
let $VIMHOME = $HOME."/.vim"

" NETRW CONFIG 
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" LEADER KEY CONFIG
let mapleader="\<space>"

" UTILITY FUNCTIONS
function! ToggleColorColumn()
    if &colorcolumn == 80
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunction

function! ToggleColorTheme()
    if &background == "light"
        :colorscheme dark
    else 
        :colorscheme light
    endif
endfunction

function! ToggleStatusBar()
    if &laststatus == 2
        set laststatus=0
    else
        set laststatus=2
    endif
endfunction

function! ToggleAllVisual()
    :call ToggleStatusBar()
    :call ToggleColorColumn()
    :set number! relativenumber!
endfunction

" TODO: make a function to open especific lang file

" KEYBOARD SHORTCUTS
nnoremap <Leader>v :vsplit $MYVIMRC<CR>
nnoremap <Leader>s :source $MYVIMRC<CR> 
nnoremap <Leader>html :-1read $VIMHOME/.skeleton.html<CR>3jwf>a
nnoremap <Leader>; A;<Esc>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>t :term<CR>
nnoremap <Leader>gt :!ctags -R .<CR>
nnoremap <Leader>8 :copen<CR>
nnoremap <Leader>7 :cnext<CR>
nnoremap <Leader>6 :cprevious<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>p :tabp<CR>
nnoremap <Leader>n :tabn<CR>

" OPTIONAL SETTINGS
nnoremap <C-F12> :set number! relativenumber!<CR>
nnoremap <C-F11> :set number!<CR>
nnoremap <C-F10> :call ToggleColorColumn()<CR>
nnoremap <C-F9> :call ToggleColorTheme()<CR>
nnoremap <C-F8> :call ToggleStatusBar()<CR>

" REMAP ARROW KEYS
noremap <Down> :resize +2<Cr>
noremap <Up> :resize -2<cr>
noremap <Right> :vertical resize +2<CR>
noremap <Left> :vertical resize -2<CR>

" PLUGINS
call plugpac#begin()
Pack 'k-takata/minpac', {'type': 'opt'}
Pack 'sheerun/vim-polyglot'
call plugpac#end()

" CHANGE CURRENT DIRECTORY
autocmd BufEnter * silent! lcd %:p:h 

command! Full :call ToggleAllVisual()
