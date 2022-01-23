" Vim color file
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
" Modification based on default ASCII colors

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "default"

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
call SetColor("Normal",        "NONE",        "White",       "NONE")
call SetColor("NonText",       "NONE",        "DarkBlue",    "NONE")
call SetColor("Comment",       "NONE",        "Cyan",        "Italic")
call SetColor("Constant",      "NONE",        "Magenta", "Bold")
call SetColor("Identifier",    "NONE",        "DarkCyan",    "NONE")
call SetColor("Statement",     "NONE",        "DarkYellow",  "NONE")
call SetColor("Preproc",       "NONE",        "LightBlue")
call SetColor("Type",          "NONE",        "LightGreen", "NONE")
call SetColor("Special",       "NONE",        "LightMagenta")
call SetColor("ErrorMsg",      "NONE",        "DarkRed", "NONE")
call SetColor("WarningMsg",    "NONE",        "DarkYellow", "NONE")
call SetColor("MoreMsg",       "NONE",        "DarkGreen", "NONE")
call SetColor("ModeMsg",       "NONE",        "white", "NONE")
call SetColor("Error",         "DarkRed",     "Black")
call SetColor("Todo",          "DarkYellow",  "Black")
call SetColor("Search",        "DarkYellow",  "Black")
call SetColor("IncSearch",     "Black",       "DarkYellow")
call SetColor("LineNr",        "NONE",        "DarkYellow")
call SetColor("ShowMarksHL",   "Black",       "DarkYellow", "bold")
call SetColor("MatchParen",    "DarkGray",       "NONE", "NONE")
call SetColor("String",        "NONE",        "DarkMagenta", "Italic")
call SetColor("Number",        "NONE",        "Magenta", "bold")
call SetColor("TabLine",       "White",       "black", "NONE")
call SetColor("TabLineSel",    "NONE",        "white", "NONE")
call SetColor("StatusLine",    "black",       "white")
call SetColor("StatusLineNC",  "black",       "white")
call SetColor("Label",         "NONE",        "Yellow")
call SetColor("Operator",      "NONE",        "Yellow")
call SetColor("ColorColumn",   "Red",         "black")
call SetColor("Folded",        "DarkGray",    "White")
call SetColor("FoldColumn",    "Gray",        "White")
call SetColor("cIf0",          "NONE",        "Gray")
call SetColor("Directory",     "NONE",        "DarkCyan", "NONE")
call SetColor("CursorLine",    "NONE",        "NONE", "Bold")
call SetColor("CursorLineNR",  "NONE",        "DarkYellow", "Bold")
call SetColor("Title",         "NONE",        "Magenta", "bold")
call SetColor("Pmenu",         "Magenta",     "white")
call SetColor("PmenuSel",      "Black",       "White")
call SetColor("PmenuSbar",     "White",       "NONE")
call SetColor("PmenuThumb",    "Black",       "NONE")
call SetColor("SpellBad",      "DarkRed",     "Black")
call SetColor("Label",         "NONE",        "DarkYellow")
call SetColor("WildMenu",      "DarkYellow",  "Black", "Bold")
call SetColor("Question",      "NONE",        "DarkGreen")


" Netrw:      syntax           background   foreground
call SetColor("NetrwMakeFile", "NONE",      "Magenta")
call SetColor("NetrwTags",     "NONE",      "Magenta")

" HTML:       syntax        background  foreground
call SetColor("htmlTag",    "NONE",     "DarkCyan")
call SetColor("htmlEndTag", "NONE",     "DarkCyan")

" CSS:        syntax       background foreground
call SetColor("cssBraces", "NONE",    "cyan")

" Javascript Syntax
call SetColor("jsGlobalNodeObjects", "NONE", "DarkCyan", "bold")
call SetColor("jsGlobalObjects", "NONE", "DarkCyan", "bold")
call SetColor("jsNull", "NONE", "DarkCyan", "bold")
call SetColor("jsArguments", "NONE", "Magenta", "bold")
call SetColor("jsFunction", "NONE", "LightGreen")
call SetColor("jsArrowFunction", "NONE", "LightGreen")
call SetColor("jsStorageClass", "NONE", "LightGreen")
call SetColor("jsTry", "NONE", "DarkYellow")
call SetColor("jsCatch", "NONE", "DarkYellow")
call SetColor("jsUndefined", "NONE", "LightGreen", "Bold")
call SetColor("jsOperatorKeyword", "NONE", "Yellow", "Bold")

" JSON Syntax
call SetColor("jsonNull", "NONE", "DarkCyan", "bold")

" JSX Syntax
call SetColor("jsxComponentName", "NONE", "DarkCyan", "bold")
call SetColor("jsxTagName", "NONE", "DarkCyan", "bold")
call SetColor("jsxAttrib", "NONE", "LightGreen")

" Typescript syntax
call SetColor("typescriptImport", "NONE", "LightBlue")
call SetColor("typescriptExport", "NONE", "LightBlue")
call SetColor("typescriptBraces", "NONE", "White")
call SetColor("typescriptDecorator", "NONE", "Magenta", "Bold")
call SetColor("typescriptIdentifier", "NONE", "LightGreen", "Bold")
call SetColor("typescriptVariable", "NONE", "LightGreen")

" Remove functions
delf SetColor
delf SetVisual
