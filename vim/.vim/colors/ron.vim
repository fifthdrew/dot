" Vim color file
" Maintainer: Vanderson Rodrigues
" Modification based on ron theme 

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "ron"
hi comment      cterm=italic
hi ShowMarksHL  ctermfg=cyan ctermbg=lightblue cterm=bold
hi clear        Visual
hi Visual       term=reverse cterm=reverse
hi MatchParen   ctermfg=NONE ctermbg=8 cterm=NONE
hi String       ctermfg=13   cterm=italic
hi Number       ctermfg=magenta cterm=bold
hi cssBraces    ctermfg=cyan
hi htmlTag      ctermfg=cyan
hi htmlEndTag   ctermfg=cyan
