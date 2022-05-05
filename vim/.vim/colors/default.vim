" Vim color file
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
" Modification based on default 16 ASCII colors

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "default"

let s:Black         = 0
let s:DarkRed       = 1
let s:DarkGreen     = 2
let s:DarkYellow    = 3
let s:DarkBlue      = 4
let s:DarkMagenta   = 5
let s:DarkCyan      = 6
let s:LightGrey     = 7
let s:DarkGrey      = 8
let s:LightRed      = 9
let s:LightGreen    = 10
let s:LightYellow   = 11
let s:LightBlue     = 12
let s:LightMagenta  = 13
let s:LightCyan     = 14
let s:White         = 15

if &background ==# 'light'
  let s:Foreground       = s:Black
  let s:LightForeground  = s:DarkGrey
  let s:Background       = s:White
  let s:LightBackground  = s:LightGrey
elseif &background ==# 'dark'
  let s:Foreground       = s:LightGrey
  let s:LightForeground  = s:White
  let s:Background       = s:Black
  let s:LightBackground  = s:DarkGrey
endif

function!  SetColor(group, ...)
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

" General:    Syntax           background     foreground     style
call SetColor("Normal",        s:Background,        s:Foreground,       "NONE")
call SetColor("NonText",       "NONE",        s:DarkBlue,    "NONE")
call SetColor("Comment",       "NONE",        s:LightCyan,        "Italic")
call SetColor("Constant",      "NONE",        s:DarkMagenta, "Bold")
call SetColor("Identifier",    "NONE",        s:DarkCyan,    "NONE")
call SetColor("Statement",     "NONE",        s:DarkYellow,  "NONE")
call SetColor("Preproc",       "NONE",        s:LightBlue)
call SetColor("Type",          "NONE",        s:LightGreen, "NONE")
call SetColor("Special",       "NONE",        s:LightMagenta)
call SetColor("ErrorMsg",      "NONE",        s:DarkRed, "NONE")
call SetColor("WarningMsg",    "NONE",        s:DarkYellow, "NONE")
call SetColor("MoreMsg",       "NONE",        s:DarkGreen, "NONE")
call SetColor("ModeMsg",       s:Background,        s:Foreground, "NONE")
call SetColor("Error",         s:DarkRed,     "NONE")
call SetColor("Todo",          s:DarkYellow,  s:Black)
call SetColor("Search",        s:DarkYellow,  s:Black)
call SetColor("IncSearch",     s:Black,       s:DarkYellow)
call SetColor("LineNr",        "NONE",        s:DarkYellow)
call SetColor("ShowMarksHL",   s:Black,       s:DarkYellow, "bold")
call SetColor("MatchParen",    s:DarkGrey,       "NONE", "NONE")
call SetColor("String",        "NONE",        s:DarkMagenta, "Italic")
call SetColor("Number",        "NONE",        s:DarkMagenta, "bold")
call SetColor("TabLine",       s:LightGrey,       s:Background, "NONE")
call SetColor("TabLineFill",       s:LightGrey,       s:Background, "NONE")
call SetColor("TabLineSel",    s:Background,        s:Foreground, "NONE")
call SetColor("VertSplit", s:Background, s:LightGrey)
call SetColor("StatusLine",    s:Background,       s:LightGrey)
call SetColor("StatusLineNC",  s:Background,       s:LightGrey)
call SetColor("Label",         "NONE",        s:DarkYellow)
call SetColor("Operator",      "NONE",        s:DarkYellow)
call SetColor("ColorColumn",   s:DarkRed,         s:Background)
call SetColor("Folded",        s:DarkGrey,    s:White)
call SetColor("FoldColumn",    s:LightGrey,        s:White)
call SetColor("cIf0",          "NONE",        s:LightGrey)
call SetColor("Directory",     "NONE",        s:DarkCyan, "NONE")
call SetColor("CursorLine",    "NONE",        "NONE", "Bold")
call SetColor("CursorLineNR",  "NONE",        s:DarkYellow, "Bold")
call SetColor("Title",         "NONE",        s:DarkMagenta, "bold")
call SetColor("Pmenu",         s:DarkMagenta,     s:White)
call SetColor("PmenuSel",      s:Black,       s:White)
call SetColor("PmenuSbar",     s:White,       "NONE")
call SetColor("PmenuThumb",    s:Black,       "NONE")
call SetColor("SpellBad",      s:DarkRed,     "NONE")
call SetColor("Label",         "NONE",        s:DarkYellow)
call SetColor("WildMenu",      s:DarkYellow,  s:Black, "Bold")
call SetColor("Question",      "NONE",        s:DarkGreen)

" Netrw:      syntax           background   foreground
call SetColor("NetrwMakeFile", "NONE",      s:DarkMagenta)
call SetColor("NetrwTags",     "NONE",      s:DarkMagenta)

" HTML:       syntax        background  foreground
call SetColor("htmlTag",    "NONE",     s:DarkCyan)
call SetColor("htmlEndTag", "NONE",     s:DarkCyan)

" CSS:        syntax       background foreground
call SetColor("cssBraces", "NONE",    "cyan")

" Javascript Syntax
call SetColor("jsGlobalNodeObjects", "NONE", s:DarkCyan, "bold")
call SetColor("jsGlobalObjects", "NONE", s:DarkCyan, "bold")
call SetColor("jsNull", "NONE", s:DarkCyan, "bold")
call SetColor("jsArguments", "NONE", s:DarkMagenta, "bold")
call SetColor("jsFunction", "NONE", s:LightGreen)
call SetColor("jsArrowFunction", "NONE", s:LightGreen)
call SetColor("jsStorageClass", "NONE", s:LightGreen)
call SetColor("jsTry", "NONE", s:DarkYellow)
call SetColor("jsCatch", "NONE", s:DarkYellow)
call SetColor("jsUndefined", "NONE", s:LightGreen, "Bold")
call SetColor("jsOperatorKeyword", "NONE", s:DarkYellow, "Bold")

" JSON Syntax
call SetColor("jsonNull", "NONE", s:DarkCyan, "bold")

" JSX Syntax
call SetColor("jsxComponentName", "NONE", s:DarkCyan, "bold")
call SetColor("jsxTagName", "NONE", s:DarkCyan, "bold")
call SetColor("jsxAttrib", "NONE", s:LightGreen)

" Typescript syntax
call SetColor("typescriptImport", "NONE", s:LightBlue)
call SetColor("typescriptExport", "NONE", s:LightBlue)
call SetColor("typescriptBraces", "NONE", s:Foreground)
call SetColor("typescriptDecorator", "NONE", s:DarkMagenta, "Bold")
call SetColor("typescriptIdentifier", "NONE", s:LightGreen, "Bold")
call SetColor("typescriptVariable", "NONE", s:LightGreen)

" PHP Syntax
call SetColor("phpStaticClasses", "NONE", s:LightGreen, "Bold")
call SetColor("phpVarSelector", "NONE", s:LightMagenta,)

" CSS Syntax
call SetColor("cssImportant", "NONE", s:DarkCyan, "bold")

" Remove functions
delf SetColor
delf SetVisual
