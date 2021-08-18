filetype plugin indent on
syntax on
colorscheme zenburn 

"------------------------------------------
"           - General settings -
"------------------------------------------

" Use vim settings, rather than vi settings
set nocompatible

" Set tabs
set tabstop=4 
set softtabstop=4
set expandtab
set smarttab 
set shiftwidth=4 

" Allow backspacing over everything 
" in INSERT mode
set backspace=indent,eol,start

" Set indentation
set smartindent 
set autoindent

" Ignore case when searching
set ignorecase 
set smartcase

" Set partial search and result 
" highlighting
set hlsearch 
set incsearch

" Ensure that Vim will search all 
" project files
set path+=.,,,**

" Set command line completion
set wildmenu 

" Allow load a buffer in a window that 
" currently has a modified buffer
set hidden

" Make vim wrap long lines
set wrap 
set linebreak 
set nolist

" Read file when modified outside vim
set autoread

" Allow mouse
set mouse=a

" Set encoding
set encoding=utf-8

" Disable modeline because security issues 
set nomodeline

" Do not keep any history
set noswapfile 
set nowb 
set nobackup 
set viminfo='0,:0,<0,@0,f0 

" Show ruler and command visual aid
set showcmd 
set ruler

" Improve Control-x + Control-o 
" auto complete function 
set omnifunc=syntaxcomplete#Complete

" Set spelling check
set nospell 
set spelllang=en_us


"---------------------------------------------
"            - Define variables -              
"---------------------------------------------

" Vim folder location
let $VIMHOME = $HOME."/.vim"

" Netrw configuration        
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Define leader key               
let mapleader="\<space>"


"---------------------------------------------
"            - Utility functions -              
"---------------------------------------------

function! ToggleColorColumn()
    if &colorcolumn == 80
        set colorcolumn=0
    else
        set colorcolumn=80
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


"---------------------------------------------
"           - Keyboard shortcuts -              
"---------------------------------------------

nnoremap <Leader>v :edit $MYVIMRC<CR>
nnoremap <Leader>s :source $MYVIMRC<CR> 
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
nnoremap <Leader>sp :set spell!<CR>
nnoremap <Leader>f :1z=<CR>
nnoremap <Leader>e :e.<CR>


"---------------------------------------------
"                 - Snippets -              
"---------------------------------------------

nnoremap <Leader>html :-1read $VIMHOME/.skeleton.html<CR>3jwf>a


"---------------------------------------------
"           - Optional settings -              
"---------------------------------------------

nnoremap <C-F12> :set  nu! rnu!<CR>
nnoremap <C-F11> :set  nu!<CR>
nnoremap <C-F10> :call ToggleColorColumn()<CR>
nnoremap <C-F9> :call ToggleStatusBar()<CR>
nnoremap <C-F8> :call ToggleAllVisual()<CR>
noremap <C-Down> :resize +2<Cr>
noremap <C-Up> :resize -2<cr>
noremap <C-Right> :vertical resize +2<CR>
noremap <C-Left> :vertical resize -2<CR>


"---------------------------------------------
"           - Disable arrow keys -              
"---------------------------------------------

inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>


"---------------------------------------------
"             - Temporary Options -
"---------------------------------------------

" Kill bad habits
noremap h <nop>
noremap j <nop>
noremap k <nop>
noremap l <nop>


"---------------------------------------------
"       - Abbreviations an Corrections -
"---------------------------------------------

iabbrev heigth height
iabbrev heigths heights
iabbrev lenght length
iabbrev lenghts lengths
