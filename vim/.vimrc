call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'franbach/miramare'
	Plug 'sheerun/vim-polyglot'
call plug#end()

set encoding=utf-8
set hidden
set number
set relativenumber
set mouse=a

if exists('+termguicolors')
	set termguicolors
endif

let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'
"let g:airline_theme='simple'
let g:airline_theme = 'miramare'

let g:tmuxline_powerline_separators = 1

let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
let g:miramare_enable_bold = 1

colorscheme miramare
"colorscheme default
