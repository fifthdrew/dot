call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
call plug#end()

set encoding=utf-8
let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'
let g:airline_theme='simple'

let g:tmuxline_powerline_separators = 1

