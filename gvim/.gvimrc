set background=light

"remove menu bar
set guioptions-=m 

"remove toolbar
set guioptions-=T  

"remove right-hand scroll bar
set guioptions-=r  

"remove left-hand scroll bar
set guioptions-=L  

set guifont=Hack\ Nerd\ Font\ Mono\ 14

set guicursor+=a:blinkon0

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR> 
