call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'chriskempson/base16-vim'
	Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme base16-classic-dark
"colorscheme base16-default-dark 
"colorscheme darkblue
syntax on

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
let g:airline_theme = 'base16'
"let g:airline_theme = 'base16_classic'
"let g:airline_theme = 'dark'

" TMUXLINE CONFIG
let g:tmuxline_powerline_separators = 0

" LEADER KEY CONFIG
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>v :vsplit ~/dotfiles/vim/.vimrc<cr>
nnoremap <leader>s :source ~/dotfiles/vim/.vimrc<cr> 
nnoremap <Leader>b :ls<CR>:b<Space>

