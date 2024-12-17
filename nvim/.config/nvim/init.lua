-- {{{ GENERAL SETTINGS

vim.opt.foldmethod="marker"

vim.opt.background="dark"

-- Use vim settings, rather than vi settings
vim.opt.compatible=false

-- Set tabs
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.expandtab=true
vim.opt.smarttab=true
vim.opt.shiftwidth=4

-- Allow backspacing over everything in INSERT mode
vim.opt.backspace="indent,eol,start"

-- Set indentation
vim.opt.smartindent=true
vim.opt.autoindent=true

-- Ignore case when searching
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- Set partial search and result highlighting
vim.opt.hlsearch=true
vim.opt.incsearch=true

-- Ensure that Vim will search all project files
vim.opt.path=vim.opt.path+".,**"

-- Set command line completion
vim.opt.wildmenu=true
vim.opt.wildmode="longest:full,full"
vim.opt.wildignorecase=true
vim.opt.wildignore="*.swp,*.bak"
vim.opt.wildignore=vim.opt.wildignore+"*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*"
vim.opt.wildignore=vim.opt.wildignore+"*/.git/**/*,*/.hg/**/*,*/.svn/**/*"
vim.opt.wildignore=vim.opt.wildignore+"tags"
vim.opt.wildignore=vim.opt.wildignore+"*.tar.*"

-- Allow load a buffer in a window that currently has a modified buffer
vim.opt.hidden=true

-- This makes Vim not wrap long lines
vim.opt.wrap=false

-- Read file when modified outside vim
vim.opt.autoread=true

-- Allow mouse
vim.opt.mouse="a"

-- Set encoding
vim.opt.encoding="utf-8"

-- Set terminal colors
vim.opt.termguicolors=true

-- Disable modeline because security issues
vim.opt.modeline=false

-- Show ruler and command visual aid
vim.opt.showcmd=true
vim.opt.ruler=true

-- Improve Control-x + Control-o auto complete function
vim.opt.omnifunc="syntaxcomplete#Complete"

-- Set spelling check
vim.opt.spell=false
vim.opt.spelllang="en_us"

-- Minimize the delay when hitting esc in insert mode
vim.opt.ttimeout=true
vim.opt.ttimeoutlen=0

-- Character used on vertical splits
-- NOTE: https://pt.piliapp.com/symbol/line/
vim.opt.fillchars=vim.opt.fillchars+"vert:▕"

-- Removes '~' chars in the end of file
--vim.opt.fillchars=vim.opt.fillchars+"eob: "

-- Change the characters used in the folding
vim.opt.fillchars=vim.opt.fillchars+"fold:-"

-- Invisible characters
--vim.opt.listchars="tab:→  ,space:·,trail:·,eol:↲,nbsp:␣"
vim.opt.listchars="tab:→  ,trail:·,eol:↲,nbsp:␣"

-- Show statusline only when are more than one pane
vim.opt.laststatus=1

-- Press F3 to enter paste insert mode
-- This removes automatic indentation on pasting
vim.opt.pastetoggle="<F3>"

-- faster scrolling
vim.opt.ttyfast=true

-- This set the char used to behave like Tab in selection menus
-- This is useful for mappings like:
-- nnoremap <leader>b :buffer <C-n>
vim.cmd("set wildcharm=<C-n>")

-- Set the working directory to wherever the open file lives
vim.opt.autochdir=true

-- To allow all operations work with the OS clipboard
-- Seems to work only when Gvim and xclip are installed
-- Check if '+clipboard' (vim --version | grep clipboard)
vim.cmd("set clipboard^=unnamed,unnamedplus")

-- Send vim temporary files to /tmp
vim.opt.backupdir="/tmp//"
vim.opt.directory="/tmp//"
vim.opt.undodir="/tmp//"

-- Set tags option for the command ctags
vim.opt.tags="tags;"

-- Briefelly shows what is the matching par of character
--vim.opt.showmatch=false

-- }}}
-- {{{ DEFINE AND SET VARIABLES
vim.cmd([[

" Define leader keys
let mapleader="\<Space>"
let maplocalleader=","

" Regular expression to catch dotfiles
let dotfiles_regex = '\(^\|\s\s\)\zs\.\S\+'

" Netrw plugin configuration
let g:netrw_banner = 0
let g:netrw_hide = 0
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',' . dotfiles_regex
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_special_syntax= 1
let g:netrw_cursor = 2
let g:netrw_fastbrowse = 0

" Explore status
let g:explore_is_open = 0

" Quickfix status
let g:quickfix_is_open = 0

" Value used in colorcolumn option
let g:limit_column_start = 81
let g:limit_column_end = g:limit_column_start * 2
let g:cc = join(range(g:limit_column_start,g:limit_column_end),",")

" Termdebug plugin configuration
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Solarized themes configuration
let g:solarized_termcolors = 256
let g:solarized_italics = 1
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_visibility = 'low'
let g:solarized_statusline = 'flat'
let g:solarized_extra_hi_groups = 1

]])
-- }}}
-- {{{ UTILITY FUNCTIONS
vim.cmd([[

function! ActivateAllComponentsDisplay()
    tabdo windo set laststatus=2
    tabdo windo set showtabline=1
    tabdo windo set number relativenumber
endfunction

function! ToggleColorColumnDisplay()
    if &colorcolumn == g:cc
        tabdo windo set colorcolumn=0
    else
        execute "tabdo windo set colorcolumn=" . g:cc
    endif
endfunction

function! ToggleStatusBarDisplay()
    if &laststatus == 2 || &laststatus == 1
        tabdo windo set laststatus=0
    else
        tabdo windo set laststatus=2
    endif
endfunction

function! ToggleTabLineDisplay()
  if &showtabline == 2 || &showtabline == 1
    tabdo windo set showtabline=0
  else
    tabdo windo set showtabline=2
  endif
endfunction

function! ActivateRelativeNumber()
  if &number=='nonumber'
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

function! ToggleAllComponentsDisplay()
    if &cc ==  g:cc && &stal == 0 && &ls == 0 && &nu == 'nu' && &rnu == 'rnu' && &cul == 'cul' ||
    \  &cc ==  0    && &stal == 1 && &ls == 0 && &nu == 'nu' && &rnu == 'rnu' && &cul == 'cul' ||
    \  &cc ==  0    && &stal == 0 && &ls == 2 && &nu == 'nu' && &rnu == 'rnu' && &cul == 'cul' ||
    \  &cc ==  0    && &stal == 0 && &ls == 0 && &nu         && &rnu == 'rnu' && &cul == 'cul' ||
    \  &cc ==  0    && &stal == 0 && &ls == 0 && &nu == 'nu' && &rnu          && &cul == 'cul' ||
    \  &cc ==  0    && &stal == 0 && &ls == 0 && &nu == 'nu' && &rnu == 'rnu' && &cul
        :call ActivateAllComponentsDisplay()
        :call ToggleColorColumnDisplay()
    endif
    :call ToggleStatusBarDisplay()
    :call ToggleColorColumnDisplay()
    :call ToggleTabLineDisplay()
    :tabdo windo set number! relativenumber!
endfunction

function! ToggleInvisibleChars()
  if &list
    set nolist
  else
    set list
  endif
endfunction

function! ToggleSpellLang()
    if &spelllang == "pt_br"
        set spelllang=en_us
        echo "Spell language is now English!"
    else
        set spelllang=pt_br
        echo "Spell language is now Portuguese!"
    endif
endfunction

function! ToggleWrapLines()
    if &wrap
        set nowrap
    else
        set wrap
    endif
endfunction

function! ToggleQuickfix()
    if g:quickfix_is_open
        let g:quickfix_is_open = 0
        :cclose
    else
        let g:quickfix_is_open = 1
        :copen
    endif
endfunction

" Call the fuzzy finder command inside vim
" SOURCE: https://www.reddit.com/r/vim/comments/orfpbd/interactive_fuzzy_finder_in_vim_without_plugins/
function! FZF() abort
    let l:tempname = tempname()
    " fzf | awk '{ print $1":1:0" }' > file
    execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
    try
        execute 'cfile ' . l:tempname
        redraw!
    finally
        call delete(l:tempname)
    endtry
endfunction

function! OpenExternalExplore()
    "let l:tempname = tempname()
    " ranger --choosefile=file
    "execute 'silent !ranger --choosefile=' . fnameescape(l:tempname)
    execute 'silent :enew'
    execute 'silent !ranger'
    "try
        " execute 'cfile ' . l:tempname
        " redraw!
    " finally
        " call delete(l:tempname)
    " endtry
endfunction

" Print the syntax group of the text where the cursor is
" SOURCE: shorturl.at/ckEJZ
function! PrintSyntaxGroup() abort
    :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

]])
-- }}}
-- {{{ CUSTOM COMMANDS
vim.cmd([[
"command! FZF call FZF()
"command! Ranger call OpenExternalExplore()
"command! PrintSyntaxGroup call PrintSyntaxGroup()
]])
-- }}}
--{{{ AUTOMATIC COMMANDS
vim.cmd([[

inoremap <C-c> <Esc>
augroup number
    autocmd number InsertEnter * :set norelativenumber
    autocmd number InsertLeave * :call ActivateRelativeNumber()
augroup END

augroup cursor
    autocmd!
    autocmd VimLeave * !SetCursorShape()
augroup END

" autocmd BufWritePost *.md silent !toemoji %

]])
--}}}
--{{{ KEYBOARD SHORTCUT MAPPINGS
vim.cmd([[

" Use this when clipboard not working properly
" nnoremap yy "+y
" vnoremap y "+y
" nnoremap p "+p

" Open my configuration file
nnoremap <Leader>v :edit $MYVIMRC<CR>
nnoremap <Leader>vv :edit $MYVIMRC<CR>

" Source my configuration file
nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>ss :source $MYVIMRC<CR>

" List buffers and ask for the target buffer
nnoremap <Leader>B :ls<CR>:b<Space>

" List buffers and ask for the target buffer (with completion mode)
" <C-n> is set to behave like <Tab> using the 'wildcharm' option
nnoremap <Leader>b :buffer <C-n>
nnoremap <Leader>bb :buffer <C-n>

" Navigate to next and previous buffers
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

" List marks and ask for the target mark
nnoremap <Leader>m :marks<CR>:'

" Open builtin terminal
nnoremap <Leader>t :term<Space>
nnoremap <Leader>tt :term<Space>

" Quick fix operations
nnoremap <Leader>qq :call ToggleQuickfix()<CR>
nnoremap <Leader>qn :cnext<CR>
nnoremap <Leader>qp :cprevious<CR>

" Toggle the spell checking
nnoremap <Leader>sp :set spell!<CR>

" Toggle the spell language between Portuguese and English
nnoremap <Leader>sl :call ToggleSpellLang()<CR>

" Open file explorer (Netrw) on the current directory
nnoremap <Leader>e :call ToggleExplore()<CR>
nnoremap <Leader>ee :call ToggleExplore()<CR>
nnoremap <Leader>ex :call OpenExternalExplore()<CR>
nnoremap <Leader>el :Lexplore<CR>

" Clear the highlights from the search
nmap <Leader>ns :nohlsearch<CR>

" Re-apply the syntax highlight
nmap <Leader>sy :syntax sync fromstart<CR>

" Open search on the current directory
nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>f :find *
nnoremap <Leader>sf :sfind *
nnoremap <Leader>vf :vert sfind *
nnoremap <Leader>tf :tabfind *
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>Sf :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>Vf :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>Tf :tabfind <C-R>=expand('%:h').'/*'<CR>

" Find all occurrences of a word in all project files
nnoremap <Leader>* :grep -R <cword> * --exclude-dir={.git,tmp,log,node_modules}<CR><CR>

" Open a new fresh tab
nnoremap <Leader>tn :tabnew<CR>

" Re-size windows
nnoremap <Down> :resize +10<CR>
nnoremap <Up> :resize -10<CR>
nnoremap <Right> :vertical resize -10<CR>
nnoremap <Left> :vertical resize +10<CR>

" Move lines up and down
" SOURCE: https://github.com/noopkat/dotfiles/blob/master/.vimrc
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Generate tags file on the current directory
nnoremap <Leader>gt :!ctags -R .<CR>

" Generate list of files in the current directory and sub-directories
" Useful for index
inoremap <LocalLeader>gi <C-R>=glob('**/*')<CR>

" Utilities
nnoremap <Leader>i :call ToggleInvisibleChars()<CR>
nnoremap <Leader>w :call ToggleWrapLines()<CR>

" Output the current syntax group
nnoremap <F4> :PrintSyntaxGroup<CR>

" Shortcut for typing commands
nnoremap ;; :

" Shortcut for close all windows
nnoremap ;q :qa

" Uppercase the current word
inoremap <C-u> <esc>viwUea

" Uppercase the current line
inoremap <C-l> <esc>VUA

" Add double quotes at the current word
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel

" Add single quotes at the current word
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel

]])
--}}}
--{{{ KEYBOARD SHORTCUT MAPPINGS FOR MOVEMENT
vim.cmd([[

" Translate from 'inside parentheses'
" to 'parameters'
onoremap p i(

" Until find the word return
onoremap b /return<CR>

]])
--}}}
--{{{ KEYBOARD SHORTCUT MAPPINGS FOR DISPLAY SETTINGS 
vim.cmd([[

nnoremap <F10> :call ToggleAllComponentsDisplay()<CR>
nnoremap <F9> :call ToggleTabLineDisplay()<CR>
nnoremap <F8> :call ToggleStatusBarDisplay()<CR>
nnoremap <F7> :call ToggleColorColumnDisplay()<CR>
nnoremap <F6> :tabdo windo set number!<CR>
nnoremap <F5> :tabdo windo set relativenumber!<CR>

]])
--}}}
--{{{ SNIPPETS 
--}}}
--{{{ ABBREVIATIONS AND CORRECTIONS
vim.cmd([[

" Common typos
iabbrev heigth height
iabbrev heigths heights
iabbrev lenght length
iabbrev lenghts lengths
iabbrev widht width
iabbrev widhts widths

]])
--}}}
--{{{ FILETYPE OPTIONS
vim.cmd([[

" Detect type of file
filetype on

" Load plugin file for specific file type
filetype plugin on

" Load indent file for specific file type
filetype indent on

]])
--}}}
-- {{{ SYNTAX AND COLORS
vim.cmd([[

" Turn syntax highlighting on by default
syntax on

" Set my color theme
colorscheme solarized8 

]])
-- }}}
-- {{{ PLUGINS
-- }}}
