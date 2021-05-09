call plug#begin('~/.vim/plugged')
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'chriskempson/base16-vim'
call plug#end()

syntax enable
colorscheme base16-tomorrow-night

set background=dark
set autoindent
set ignorecase
set smartcase
set linebreak
set path+=**
set wildmenu 
set hlsearch
set incsearch
set hidden
set mouse=a
set encoding=utf-8
set backspace=indent,eol,start
set termguicolors
set laststatus=2

" BASE16 COLOR CONFIG	
let base16colorspace=256

" NETRW CONFIG 
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" LEADER KEY CONFIG
let mapleader="\<space>"

" MY CUSTOM COMMANDS
nnoremap <leader>; A;<esc>
nnoremap <leader>v :vsplit ~/dotfiles/vim/.vimrc<cr>
nnoremap <leader>s :source ~/dotfiles/vim/.vimrc<cr> 
nnoremap <Leader>b :ls<cr>:b<Space>
nnoremap <Leader>t :terminal<cr>
nnoremap <leader>ta :let $VIM_DIR=expand('%:p:h')<cr>:terminal<cr>cd $VIM_DIR && clear<cr>
nnoremap <leader>html :-1read ~/dotfiles/vim/.vim/snippets/.skeleton.html<cr>3jwf>a
nnoremap <leader>gt :!ctags -R .<cr>
