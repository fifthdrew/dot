" Vim color file
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
" Modification based on default dark theme 

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "default"

if &background == "dark"
    let s:black = "#000000"
    let s:white = "#ffffff"
    let s:red = "#ff7777"
    let s:green =  "#77ff77"
    let s:green_alt = "#77ffc9"
    let s:yellow =  "#ffff77"
    let s:blue  = "#7777ff"
    let s:blue_alt = "#77c9ff"
    let s:magenta = "#ff77ff"
    let s:magenta_alt = "#ffc9ff"
    let s:cyan  = "#77ffff"
    let s:background = s:black
    let s:foreground = s:white 
else
    let s:black = "#040404"
    let s:white = "#fefefe"
    let s:red = "#cc2222"
    let s:green =  "#22cc22"
    let s:green_alt = "#77ff77"
    let s:yellow =  "#cccc22"
    let s:blue  = "#2222cc"
    let s:blue_alt = "#7777ff"
    let s:magenta = "#cc22cc"
    let s:magenta_alt = "#ff77ff"
    let s:cyan  = "#22cccc"
    let s:background = s:white 
    let s:foreground = s:black 
endif

function!  SetGuiColor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

function!  SetTermColor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'ctermbg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'ctermfg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'cterm=' . a:3 . ' '
  endif

  execute histring
endfunction

function! SetVisual()
    :hi clear Visual
    :hi visual term=reverse cterm=reverse gui=reverse
endfunction

call SetVisual()

" General Syntax
call SetGuiColor("Normal", "", s:foreground)
call SetGuiColor("NonText", "NONE", s:blue)
call SetGuiColor("Comment", "NONE", s:cyan, "italic")
call SetTermColor("Comment", "NONE", "cyan", "italic")
call SetGuiColor("Constant", "NONE", s:magenta, "bold")
call SetTermColor("Constant", "NONE", "magenta", "bold")
call SetGuiColor("Identifier", "NONE", s:cyan, "NONE")
call SetGuiColor("Statement", "NONE", s:yellow, "NONE")
call SetGuiColor("Preproc", "NONE", s:blue_alt) 
call SetGuiColor("Type", "NONE", s:green_alt, "bold")
call SetGuiColor("Special", "NONE", s:magenta_alt)
call SetGuiColor("ErrorMsg", s:background, s:red)
call SetTermColor("ErrorMsg", "black", "red")
call SetGuiColor("WarningMsg", s:background, s:yellow)
call SetTermColor("WarningMsg", "black", "yellow")
call SetGuiColor("MoreMsg", s:background, s:green)
call SetTermColor("MoreMsg", "black", "green")
call SetGuiColor("ModeMsg", "NONE", s:foreground, "NONE")
call SetTermColor("ModeMsg", "NONE", "white", "NONE")
call SetGuiColor("Error", s:red, s:background)
call SetGuiColor("Todo", s:yellow, s:background)
call SetGuiColor("Search", s:yellow, s:black)
call SetTermColor("Search", "yellow", "black")
call SetGuiColor("IncSearch", s:black, s:yellow)
call SetTermColor("IncSearch", "yellow", "black")
call SetGuiColor("LineNr", "NONE", s:yellow)
call SetGuiColor("ShowMarksHL", s:background, s:yellow, "bold")
call SetTermColor("ShowMarksHL", "black", "yellow", "bold")
call SetGuiColor("MatchParen", "gray30", "NONE", "NONE")
call SetTermColor("MatchParen", "8", "NONE", "NONE")
call SetGuiColor("String", "NONE", s:magenta, "italic") 
call SetTermColor("String", "NONE", "magenta", "italic") 
call SetGuiColor("Number", "NONE", s:magenta, "bold")
call SetTermColor("Number", "NONE", "magenta", "bold")
call SetTermColor("TabLine", "white", "black", "NONE")
call SetTermColor("TabLineSel", "NONE", "white", "NONE")
call SetGuiColor("StatusLineNC", s:background, s:foreground)
call SetGuiColor("StatusLine", s:background, s:foreground)
call SetGuiColor("Label", "NONE", "gold2")
call SetGuiColor("Operator", "NONE", s:magenta_alt) 
call SetGuiColor("ColorColumn", s:red, s:black)
call SetTermColor("ColorColumn", "red", "black")
call SetGuiColor("Folded", "darkgray", s:foreground)
call SetGuiColor("FoldColumn", "gray", s:foreground)
call SetGuiColor("cIf0", "NONE", "gray") 
call SetGuiColor("Directory", "NONE", s:cyan, "bold")
call SetGuiColor("CursorLine", s:yellow, s:black, "NONE")
call SetTermColor("CursorLine", "yellow", "black", "NONE")
call SetGuiColor("Title", "NONE", s:magenta_alt, "bold")
call SetTermColor("Title", "NONE", "magenta", "bold")
call SetGuiColor("Identifier", "NONE", s:cyan, "NONE")
call SetTermColor("Identifier", "NONE", "cyan", "NONE")
call SetGuiColor("Pmenu", s:magenta, s:white)
call SetTermColor("Pmenu", "magenta", "white")
call SetGuiColor("PmenuSel", "grey", s:white)
call SetTermColor("PmenuSel", "grey", "white")
call SetGuiColor("PmenuSbar", s:white, "NONE")
call SetTermColor("PmenuSbar", "white", "NONE")
call SetGuiColor("PmenuThumb", "grey", "NONE")
call SetTermColor("PmenuThumb", "grey", "NONE")
call SetGuiColor("SpellBad", s:red, s:black)
call SetTermColor("SpellBad", "red", "black")
call SetGuiColor("Label", "NONE", s:yellow) 
call SetTermColor("Label", "NONE", "yellow") 
call SetGuiColor("WildMenu", s:yellow, s:background, "bold")
call SetTermColor("WildMenu", "yellow", "black", "bold")
call SetGuiColor("Question", "NONE", s:green) 
call SetTermColor("Question", "NONE", "green") 
call SetGuiColor("NetrwMakeFile", s:magenta, s:black)
call SetTermColor("NetrwMakeFile", "magenta", "black")

" HTML Syntax
call SetGuiColor("htmlTag", "NONE", s:cyan)
call SetTermColor("htmlTag", "NONE", "cyan")
call SetGuiColor("htmlEndTag", "NONE", s:cyan)
call SetTermColor("htmlEndTag", "NONE", "cyan")

" CSS Syntax
call SetGuiColor("cssBraces", "NONE", s:cyan)
call SetTermColor("cssBraces", "NONE", "cyan")

" Javascript Syntax
call SetGuiColor("jsGlobalNodeObjects", "NONE", s:cyan, "bold")
call SetTermColor("jsGlobalNodeObjects", "NONE", "cyan", "bold")
call SetGuiColor("jsGlobalObjects", "NONE", s:cyan, "bold")
call SetTermColor("jsGlobalObjects", "NONE", "cyan", "bold")
call SetGuiColor("jsxComponentName", "NONE", s:cyan, "bold")
call SetTermColor("jsxComponentName", "NONE", "cyan", "bold")
call SetGuiColor("jsxTagName", "NONE", s:cyan, "bold")
call SetTermColor("jsxTagName", "NONE", "cyan", "bold")
call SetGuiColor("jsNull", "NONE", s:cyan, "bold")
call SetTermColor("jsNull", "NONE", "cyan", "bold")
call SetGuiColor("jsArguments", "NONE", s:magenta_alt, "bold")
call SetTermColor("jsArguments", "NONE", "", "bold")

" Remove functions
delf SetGuiColor
delf SetTermColor
delf SetVisual

" Remove color variables
unlet s:black s:white s:red s:green s:green_alt s:yellow s:blue
unlet s:blue_alt s:magenta s:magenta_alt s:cyan s:background s:foreground
