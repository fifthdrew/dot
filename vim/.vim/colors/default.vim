" Vim color file
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
" Modification based on default dark theme 

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "default"

hi Normal		guifg=white guibg=#000000
hi NonText		guifg=#7777ff guibg=#000000
hi Comment      cterm=italic guifg=cyan
hi Constant		guifg=cyan	gui=bold
hi Identifier	guifg=cyan	gui=NONE
hi Statement	guifg=#ffff77 gui=NONE
hi Preproc		guifg=#00d7d7
hi Type			guifg=#77ff77 gui=bold
hi Special		guifg=#ffafd7
hi ErrorMsg		guifg=black guibg=#ff7777 cterm=bold ctermfg=black ctermbg=red
hi WarningMsg	guifg=black guibg=#ffff77
hi Error		guibg=#ff7777
hi Todo			guifg=Black	guibg=#ffff77
" hi Cursor		guibg=#60a060 guifg=#00ff00
hi Search		guibg=#ffff77 guifg=black gui=bold 
hi IncSearch	guibg=#ffff77 guifg=black gui=bold
hi LineNr		guifg=#ffff77
" hi title		guifg=darkgrey
hi ShowMarksHL  ctermfg=cyan ctermbg=lightblue cterm=bold guifg=yellow guibg=black gui=bold
hi clear Visual
hi visual		term=reverse cterm=reverse gui=reverse
hi MatchParen   ctermfg=NONE ctermbg=8 cterm=NONE
hi String       ctermfg=13   cterm=italic guifg=#ff77ff
hi Number       ctermfg=magenta cterm=bold
hi cssBraces    ctermfg=cyan
hi htmlTag      ctermfg=cyan
hi htmlEndTag   ctermfg=cyan
hi TabLine      cterm=none ctermfg=black ctermbg=white
hi TabLineSel   cterm=none ctermfg=white ctermbg=none
hi StatusLineNC	guifg=darkgray guibg=white
hi StatusLine	guifg=white guibg=black
" hi label		guifg=gold2
hi Operator		guifg=#ffafd7



hi DiffChange   guibg=darkgreen
hi DiffText		guibg=olivedrab
hi DiffAdd		guibg=slateblue
hi DiffDelete   guibg=coral
hi Folded		guibg=darkgray guifg=white
hi FoldColumn	guibg=gray guifg=white
hi cIf0			guifg=gray
hi diffOnly	    guifg=red gui=bold


