" File: .vimrc
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/

"{{{ GENERAL SETTINGS

setlocal foldmethod=marker

set background=dark

" Use vim settings, rather than vi settings
set nocompatible

" Set tabs
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set shiftwidth=4

" Allow backspacing over everything
" in INSERT mode
set backspace=indent,eol,start

" Set indentation
set smartindent
set autoindent

" Ignore case when searching
set ignorecase
set smartcase

" Set partial search and result
" highlighting
set hlsearch
set incsearch

" Ensure that Vim will search all
" project files
set path+=.,**

" Set command line completion
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

" Allow load a buffer in a window that
" currently has a modified buffer
set hidden

" This makes Vim not wrap long lines
set nowrap

" Read file when modified outside vim
set autoread

" Allow mouse
set mouse=a

" Set encoding
set encoding=utf-8

" Set terminal colors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Disable modeline because security issues
set nomodeline

" Show ruler and command visual aid
set showcmd
set ruler

" Improve Control-x + Control-o
" auto complete function
set omnifunc=syntaxcomplete#Complete

" Set spelling check
set nospell
set spelllang=en_us

" Minimize the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=0

" Character used on vertical splits
" NOTE: https://pt.piliapp.com/symbol/line/
" Options:▕ │ ▏
set fillchars+=vert:\▕

" Removes '~' chars in the end of file
" set fillchars+=eob:\  

" Change the characters used in the folding
" set fillchars+=fold:\—
set fillchars+=fold:\—

" Invisible characters
" set listchars=tab:→\ ,space:·,trail:·,eol:↲,nbsp:␣
set listchars=tab:→\ ,trail:·,eol:↲,nbsp:␣

" Start of default statusline
set statusline=

" NOTE: The line below has a trailing space character
set statusline=%<%{FilePath()}\ %h%w%m%r\ 

" End of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P\ %)

" Set appearance of text folded
set foldtext=SetFoldText()

" Press F3 to enter paste insert mode
" This removes automatic indentation on pasting
set pastetoggle=<F3>

" Performance things
" https://vi.stackexchange.com/questions/10495/most-annoying-slow-down-of-a-plain-text-editor/10496
" set regexpengine=1
set lazyredraw
" set synmaxcol=200

" faster scrolling
set ttyfast

" http://bugs.debian.org/608242
" set t_RV=

" Automatically invoke completion mode in mappings
" This is necessary for the following:
" nnoremap <leader>B :buffer <C-z><S-Tab>
set wildcharm=<C-z>

" Set the working directory to wherever the open file lives
set autochdir

" To allow all operations work with the OS clipboard
" Seems to work only when Gvim and xclip are installed
" Check if '+clipboard' (vim --version | grep clipboard)
set clipboard^=unnamed,unnamedplus

" Send vim temporary files to /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Set tags option for the command ctags
set tags=tags;

set showmatch

set shellcmdflag=-ic

set splitright

" }}}
"{{{ DEFINE AND SET VARIABLES

" Vim folder location
let $VIMHOME = $HOME."/.vim/"

" Netrw plugin configuration
let g:netrw_banner = 0
"let g:netrw_altv = 1
"let g:netrw_liststyle = 3
let dotfiles_regex = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide = 0
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',' . dotfiles_regex
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_special_syntax= 1
let g:netrw_cursor = 2
let g:netrw_fastbrowse = 0

" Explore
let g:explore_is_open = 0

" Value used in colorcolumn option
let g:limit_column_start = 81
let g:limit_column_end = g:limit_column_start * 2
let g:cc = join(range(g:limit_column_start,g:limit_column_end),",")

" Termdebug plugin configuration
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Markdown suport configuration
let g:markdown_fenced_languages = [
            \   'html',
            \   'python',
            \   'javascript',
            \   'typescript',
            \   'vim'
            \ ]

let g:solarized_termcolors = 256
let g:solarized_italics = 1
" Solarized themes configuration
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_visibility = 'low'
let g:solarized_statusline = 'flat'
let g:solarized_extra_hi_groups = 1

" Gruvbox themes configuration
let g:gruvbox_termcolors = 256
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_contrast_dark ='soft'
let g:gruvbox_color_column = 'bg1'
let g:gruvbox_invert_selection = 0
let g:gruvbox_improved_warnings = 0

" Define leader key
let mapleader="\<space>"
let maplocalleader=","

" Quickfix
let g:quickfix_is_open = 0

" Comment characters for each language
" SOURCE: https://stackoverflow.com/questions/1676632
let s:comment_map = {
            \   "c": '\/\/',
            \   "cpp": '\/\/',
            \   "go": '\/\/',
            \   "java": '\/\/',
            \   "javascript": '\/\/',
            \   "lua": '--',
            \   "scala": '\/\/',
            \   "php": '\/\/',
            \   "python": '#',
            \   "ruby": '#',
            \   "rust": '\/\/',
            \   "sh": '#',
            \   "desktop": '#',
            \   "fstab": '#',
            \   "conf": '#',
            \   "profile": '#',
            \   "bashrc": '#',
            \   "bash_profile": '#',
            \   "mail": '>',
            \   "eml": '>',
            \   "bat": 'REM',
            \   "ahk": ';',
            \   "vim": '"',
            \   "tex": '%',
            \ }

" Set cursor shape for each mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"}}}
" {{{ UTILITY FUNCTIONS
function! SetFoldText()
   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
   let lines_count = v:foldend - v:foldstart + 1
   let lines_count_text = printf("%10s", lines_count . ' lines ')
   let foldchar = matchstr(&fillchars, 'fold:\zs.')
   " let foldchar = '―'
   " let foldchar = ' '
   let foldtextstart = strpart('⤷ ' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
   let foldtextend = lines_count_text . repeat(foldchar, 5)
   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . ' ' . foldtextend
endfunction

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
    if &laststatus == 2
        tabdo windo set laststatus=0
    else
        tabdo windo set laststatus=2
    endif
endfunction

function! ToggleTabLineDisplay()
  if &showtabline == 1
    tabdo windo set showtabline=0
  else
    tabdo windo set showtabline=1
  endif
endfunction

function! ActivateRelativeNumber()
  if &number=='nonumber'
    tabdo windo set norelativenumber
  else
    tabdo windo set relativenumber
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

function! SplitVertically()
    :call ActivateAllComponentsDisplay()
    :execute "normal :vsplit \<CR>\<C-w>w"
endfunction

function! SplitHorizontally()
    :call ActivateAllComponentsDisplay()
    :execute "normal :split \<CR>\<C-w>w"
endfunction

" To comment lines with a command
" SOURCE: https://stackoverflow.com/questions/1676632
function! ToggleComment()
  if has_key(s:comment_map, &filetype)
    let comment_leader = s:comment_map[&filetype]
    if getline('.') =~ "^\\s*" . comment_leader . " "
      " Uncomment the line
      execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else
      if getline('.') =~ "^\\s*" . comment_leader
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
      else
        " Comment the line
        execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
      end
    end
  else
      echo "No comment leader found for filetype"
  end
endfunction

" This function returns the full or shortened path of the current file
" SOURCE: https://www.reddit.com/r/vim/comments/m7yald/is_there_any_way_to_apply_pathshortern_to/
function! FilePath() abort
    if expand('%:h') ==# ''
      return '▏' . '[No Name]'
    endif
    let l:path = expand('%:p:h')
    let l:home = '/home/' . $USER
    if stridx(l:path, l:home) !=# -1
      let l:path = substitute(l:path, l:home, '~', "")
    endif
    if winwidth(0) <= 80
        " let l:path = pathshorten(l:path)
        return '▏' . expand('%:t')
    endif
    return '▏' . l:path . '/' . expand('%:t')
endfunction

function! SaveSession()
    execute 'mksession! /tmp/session.vim'
endfunction

function! RestoreSession()
    if filereadable('/tmp/session.vim')
        execute 'so /tmp/session.vim'
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
endfunction

function! IsNotDiff()
  return expand('%:e') != 'diff'
endfunction

function! IsNotCommitEditMsg()
  return expand('%:t') != 'COMMIT_EDITMSG'
endfunction

function! SaveOrRestoreSession(event)
  if IsNotDiff() && IsNotCommitEditMsg()
    if a:event == 'VimLeave'
      :SaveSession
    elseif a:event == 'VimEnter'
      :RestoreSession
    endif
  endif
endfunction

function! ToggleExplore()
    if g:explore_is_open
        let g:explore_is_open = 0
        :Rexplore
    else
        let g:explore_is_open = 1
        :Explore
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

function! OpenRanger()
	let l:tempname = tempname()
	" ranger --choosefile=file
	execute 'silent !ranger --choosefile=' . fnameescape(l:tempname)
	try
		execute 'cfile ' . l:tempname
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction

" Print the syntax group of the text where the cursor is
" SOURCE: shorturl.at/ckEJZ
function! PrintSyntaxGroup() abort
    :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

function! SetCursorShape()
    call system('bash -c "echo -ne "\e[3 q" > /dev/null 2>&1"')
endfunction

" }}}
" {{{ CUSTOM COMMANDS

command! FZF call FZF()
command! Ranger call OpenRanger()
command! PrintSyntaxGroup call PrintSyntaxGroup()
command! SaveSession call SaveSession()
command! RestoreSession call RestoreSession()

" }}}
" {{{ AUTOMATIC COMMANDS

" augroup session
  " autocmd VimLeave * call SaveOrRestoreSession('VimLeave')
  " autocmd VimEnter * call SaveOrRestoreSession('VimEnter')
" augroup END

inoremap <C-c> <Esc>
augroup number
    autocmd number InsertEnter * :set norelativenumber
    autocmd number InsertLeave * :call ActivateRelativeNumber()
augroup END

augroup cursor
    autocmd!
    autocmd VimLeave * call SetCursorShape()
augroup END

" autocmd BufWritePost *.md silent !toemoji %

" }}}
" {{{ KEYBOARD SHORTCUT MAPPINGS

" Use this when clipboard not working properly
" nnoremap yy "+y
" vnoremap y "+y
" nnoremap p "+p

" Open and source my configuration file respectively
nmap <Leader>v :edit $MYVIMRC<CR>
nmap <Leader>s :source $MYVIMRC<CR>

" Create and source my session file
nmap <Leader>cs :mksession! /tmp/session.vim<CR>
nmap <Leader>ls :source /tmp/session.vim<CR>

" Put a semicolon at the and of the actual line
nnoremap <Leader>; A;<Esc>

" List buffers and ask for the target buffer
nnoremap <Leader>b :ls<CR>:b<Space>

" List buffers and ask for the target buffer (with completion mode)
nnoremap <leader>B :buffer <C-z><S-Tab>

" List marks and ask for the target mark
nnoremap <Leader>m :marks<CR>:'

" Open builtin terminal
nmap <Leader>t :term<CR>

" Quick fix operations
nmap <Leader>qq :call ToggleQuickfix()<CR>
nmap <Leader>qn :cnext<CR>
nmap <Leader>qp :cprevious<CR>

" Toggle the spell checking
nmap <Leader>sp :set spell!<CR>

" Toggle the spell language between Portuguese and English
nmap <Leader>sl :call ToggleSpellLang()<CR>

" Open file explorer (Netrw) on the current directory
nnoremap <Leader>ee :call :OpenRanger<CR>
nmap <Leader>e :call ToggleExplore()<CR>

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
nmap <Leader>* :grep -R <cword> * --exclude-dir={.git,tmp,log,node_modules}<CR><CR>

" Open a new fresh tab
nmap <Leader>tn :tabnew<CR>

" Split window vertically
nmap <Leader>sv :call SplitVertically()<CR>

" Split window horizontally
nmap <Leader>sh :call SplitHorizontally()<CR>

" Re-size windows
nmap <Down> :resize +10<CR>
nmap <Up> :resize -10<CR>
nmap <Right> :vertical resize -10<CR>
nmap <Left> :vertical resize +10<CR>

" Move lines up and down
" SOURCE: https://github.com/noopkat/dotfiles/blob/master/.vimrc
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Generate tags file on the current directory
nmap <Leader>gt :!ctags -R .<CR>

" Utilities
vnoremap <Leader>, :call ToggleComment()<CR>
nnoremap <Leader>, :call ToggleComment()<CR>
nnoremap <Leader>i :call ToggleInvisibleChars()<CR>
nnoremap <Leader>w :call ToggleWrapLines()<CR>

" Output the current syntax group
nnoremap <F4> :PrintSyntaxGroup<CR>

" Shortcut for typing commands
nnoremap ; :

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

" }}}
" {{{ KEYBOARD SHORTCUT MAPPINGS FOR MOVEMENT

" Translate from 'inside parentheses'
" to 'parameters'
onoremap p i(

" Until find the word return
onoremap b /return<CR>

" }}}
" {{{ KEYBOARD SHORTCUT MAPPINGS FOR DISPLAY SETTINGS

nmap <F10> :call ToggleAllComponentsDisplay()<CR>
nmap <F9> :call ToggleTabLineDisplay()<CR>
nmap <F8> :call ToggleStatusBarDisplay()<CR>
nmap <F7> :call ToggleColorColumnDisplay()<CR>
nmap <F6> :tabdo windo set number!<CR>
nmap <F5> :tabdo windo set relativenumber!<CR>

" }}}
" {{{ SNIPPETS

"TODO: Create a snippet to write the log command according to the current file
"extension and insert the comment as a reminder for future removal of the
"same, including the Github user

" }}}
" {{{ ABBREVIATIONS AND CORRECTIONS

" Common typos
iabbrev heigth height
iabbrev heigths heights
iabbrev lenght length
iabbrev lenghts lengths
iabbrev widht width
iabbrev widhts widths

" Git signature
iabbrev gsig Vanderson Rodrigues <vanderson@tutamail.com>

" }}}
" {{{ FILETYPE OPTIONS

" Detect type of file
filetype on

" Load plugin file for specific file type
filetype plugin on

" Load indent file for specific file type
filetype indent on

" }}}
" {{{ SYNTAX AND COLORS

" Turn syntax highlighting on by default
syntax on

" Set my color theme
colorscheme solarized8
" colorscheme gruvbox
" colorscheme tomorrow

" prevent colors from syntax file from being overwritten when source .vimrc
runtime! after/syntax/gitcommit.vim
" }}}
" {{{ PLUGINS
" }}}
