call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'victorze/foo'
	Plug 'chriskempson/base16-vim'
call plug#end()

syntax enable
colorscheme hyper

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
set number
set mouse=a
set encoding=utf-8
set backspace=indent,eol,start
set termguicolors

" BASE16 COLOR CONFIG	
let base16colorspace=256

" VIM-AIRLINE AND VIN-AIRLINE-THEME CONFIG	
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 0
let g:airline_theme = 'minimalist'

" TMUXLINE CONFIG
let g:tmuxline_powerline_separators = 0

" NETRW CONFIG
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3

" LEADER KEY CONFIG
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>v :vsplit ~/dotfiles/vim/.vimrc<cr>
nnoremap <leader>s :source ~/dotfiles/vim/.vimrc<cr> 
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>t :terminal<cr>
