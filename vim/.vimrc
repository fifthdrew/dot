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
set laststatus=2 modelines=5 display+=lastline
set noswapfile
set number
set relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" NETRW CONFIG 
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" LEADER KEY CONFIG
let mapleader="\<space>"

" TODO: PUT HERE MY VIM FILES LOCATION

" MY KEYBOARD SHORTCUTS
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr> 
nnoremap <leader>html :-1read $VIM_DIR . '/snippets/skeleton.html'<cr>3jwf>a
nnoremap <leader>; A;<esc>
nnoremap <Leader>b :ls<cr>:b<Space>
nnoremap <Leader>t :terminal<cr>
nnoremap <leader>ta :let $VIM_DIR=expand('%:p:h')<cr>:terminal<cr>cd $VIM_DIR && clear<cr>
nnoremap <leader>gt :!ctags -R .<cr>
nnoremap <leader>cl :set colorcolumn=80<cr>

" DISABLE ARROW KEYS
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" MY CUSTOM COMMANDS
command! Light colorscheme light 
command! Dark colorscheme dark 

" MY PLUGINS
call plugpac#begin()
Pack 'k-takata/minpac', {'type': 'opt'}
Pack 'sheerun/vim-polyglot'
call plugpac#end()

