" Vim color file
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
" Modification based on default dark theme 

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "default"

hi Normal		guifg=white     
hi NonText		guifg=#7777ff   
hi Comment      cterm=italic    guifg=#77ffff
hi Constant		guifg=#77ffff   gui=bold
hi Identifier	guifg=#77ffff   gui=NONE
hi Statement	guifg=#ffff77   gui=NONE
hi Preproc		guifg=#77ccff
hi Type			guifg=#77ffcc   gui=bold
hi Special		guifg=#ffccff
hi ErrorMsg		ctermfg=black   ctermbg=red       guifg=black guibg=#ff7777
hi WarningMsg	guifg=black     guibg=#ffff77
hi Error		guibg=#ff7777
hi Todo			guifg=Black	    guibg=#ffff77
" hi Cursor		guibg=#60a060   guifg=#00ff00
hi Search		guibg=#ffff77   guifg=black       gui=bold 
hi IncSearch	guibg=#ffff77   guifg=black       gui=bold
hi LineNr		guifg=#ffff77
" hi title		guifg=darkgrey
hi ShowMarksHL  ctermfg=cyan    ctermbg=lightblue cterm=bold guifg=yellow guibg=black gui=bold
hi clear Visual
hi visual		term=reverse    cterm=reverse     gui=reverse
hi MatchParen   ctermfg=NONE    ctermbg=8         cterm=NONE guifg=NONE guibg=gray30
hi String       ctermfg=magenta cterm=italic      guifg=#ff77ff gui=italic
hi Number       ctermfg=magenta cterm=bold        guifg=#ff77ff gui=bold
hi cssBraces    ctermfg=cyan    guifg=#77ffff
hi htmlTag      ctermfg=cyan    guifg=#77ffff
hi htmlEndTag   ctermfg=cyan    guifg=#77ffff
hi TabLine      cterm=none      ctermfg=black     ctermbg=white
hi TabLineSel   cterm=none      ctermfg=white     ctermbg=none
hi StatusLineNC	guifg=white     guibg=black
hi StatusLine	guifg=white     guibg=black
" hi label		guifg=gold2
hi Operator		guifg=#ffccff
hi ColorColumn  guibg=#ff7777
hi DiffChange   guibg=darkgreen
hi DiffText		guibg=olivedrab
hi DiffAdd		guibg=slateblue
hi DiffDelete   guibg=coral
hi Folded		guibg=darkgray  guifg=white
hi FoldColumn	guibg=gray      guifg=white
hi cIf0			guifg=gray
hi diffOnly	    guifg=red       gui=bold
