" File: .vimrc
" Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/


"------------------------------------------
"           - General settings -
"------------------------------------------

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
if has("vim")
    set term=xterm-256color
    set termguicolors
    set t_Co=256
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

" Status line configuration
" {

" Start of default statusline
set statusline=

" NOTE: The line below has a trailing space character
set statusline=%<%{FilePath()}\ %h%w%m%r\ 

" End of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)

"}

" Press F3 to enter paste insert mode
" This removes automatic indentation on pasting
set pastetoggle=<F3>

" Performance things
" https://vi.stackexchange.com/questions/10495/most-annoying-slow-down-of-a-plain-text-editor/10496
" set regexpengine=1
" set lazyredraw
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


"---------------------------------------------
"            - Define variables -
"---------------------------------------------

" Vim folder location
let $VIMHOME = $HOME."/.vim/"

" Netrw plugin configuration
" {
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_special_syntax= 1
let g:netrw_cursor = 2
" }

" Hardtime plugin configuration
" {
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+",
                           \ "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+",
                           \ "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

let g:list_of_disabled_keys = []

let g:hardtime_timeout = 2000
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 2
" }

" Termdebug plugin configuration
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Define leader key
let mapleader="\<space>"

" Comment characters for each language
" SOURCE: https://stackoverflow.com/questions/1676632
" {
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
" }

" Send vim temporary files to /tmp 
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//


"---------------------------------------------
"            - Utility functions -
"---------------------------------------------

function! ToggleColorColumn()
    if &colorcolumn == 81
        set colorcolumn=0
    else
        set colorcolumn=81
    endif
endfunction

function! ToggleStatusBar()
    if &laststatus == 2
        set laststatus=0
    else
        set laststatus=2
    endif
endfunction

function! ToggleAllVisual()
    :call ToggleStatusBar()
    :call ToggleColorColumn()
    :set number!
endfunction

function! ToggleInvisibleChars()
  if &list
    set nolist
  else
    set list
    set list listchars=tab:→\ ,trail:·,eol:↲,nbsp:␣
  endif
endfunction

" To comment lines with a command
" SOURCE: https://stackoverflow.com/questions/1676632
" {
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
" }

" This function returns the full or shortened path of the current file
" SOURCE: https://www.reddit.com/r/vim/comments/m7yald/is_there_any_way_to_apply_pathshortern_to/
" {
function! FilePath() abort
    if expand('%:h') ==# ''
      return '[No Name]'
    endif
    let l:path = expand('%:p:h')
    let l:home = '/home/' . $USER . '/'
    if stridx(l:path, l:home) !=# -1
      let l:path = substitute(l:path, l:home, '~/', "")
    endif
    if winwidth(0) <= 80
        let l:path = pathshorten(l:path)
    endif
    return l:path . '/' . expand('%:t')
endfunction
" }


"---------------------------------------------
"           - Keyboard shortcuts -
"---------------------------------------------

" Open and source my configuration file respectively
nmap <Leader>v :edit $MYVIMRC<CR>
nmap <Leader>s :source $MYVIMRC<CR>

" Put a semicolon at the and of the actual line
nnoremap <Leader>; A;<Esc>

" List buffers and ask for the target buffer
nnoremap <Leader>b :ls<CR>:b<Space>

" List buffers and ask for the target buffer (with completion mode)
nnoremap <leader>B :buffer <C-z><S-Tab>

" Open builtin terminal
nmap <Leader>t :term<CR>

" Quick fix operations
nmap <Leader>8 :copen<CR>
nmap <Leader>7 :cnext<CR>
nmap <Leader>6 :cprevious<CR>

" Toggle the spell checking
nmap <Leader>sp :set spell!<CR>

" Open file explorer (Netrw) on the current directory
nmap <Leader>e :e.<CR>

" Clear the highlights from the search
nmap <Leader>ns :nohlsearch<CR>

" Re-apply the syntax highlight
nmap <Leader>sy :syntax sync fromstart<CR>

" Open search on the current directory
nnoremap <Leader>f :find *
nnoremap <Leader>sf :sfind *
nnoremap <Leader>vf :vert sfind *
nnoremap <Leader>tf :tabfind *
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>Sf :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>Vf :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>Tf :tabfind <C-R>=expand('%:h').'/*'<CR>

" Open a new fresh tab
nmap <Leader>tn :tabnew<CR>

" Split window vertically
nmap <Leader>sv :vsplit<CR><C-w>w

" Split window horizontally
nmap <Leader>sh :split<CR><C-w>w

" Re-size windows
nmap <Down> :resize +10<CR>
nmap <Up> :resize -10<CR>
nmap <Right> :vertical resize -10<CR>
nmap <Left> :vertical resize +10<CR>

" Move lines up and down
" SOURCE: https://github.com/noopkat/dotfiles/blob/master/.vimrc
" {
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" }

" Generate tags file on the current directory
nmap <Leader>gt :!ctags -R .<CR>

" Activate and deactivate the Hard Time plugin
nmap <Leader>H :HardTimeToggle<CR>

" Utilities
vmap , :call ToggleComment()<CR>
nmap , :call ToggleComment()<CR>
nmap <Leader>i :call ToggleInvisibleChars()<CR>

" Output the current syntax group
" SOURCE: shorturl.at/ckEJZ
nnoremap <f5> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Shortcut for typing commands
nnoremap ; :

" Uppercase the current word
inoremap <C-u> <esc>viwUA

" Add double quotes at the current word
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel

" Add single quotes at the current word
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel

"---------------------------------------------
"                 - Snippets -
"---------------------------------------------

" Write the default HTML code template
nmap <Leader>html :-1read $VIMHOME.skeleton.html<CR>3jwf>a

" Write my default setup for competitive programming using c++
nmap <Leader>cpp :-1read $VIMHOME.competition.cpp<CR>11j

"TODO: Create a snippet to write the log command according to the current file
"extension and insert the comment as a reminder for future removal of the
"same, including the Github user

"---------------------------------------------
"             - Look settings -
"---------------------------------------------

nmap <F12> :set relativenumber!<CR>
nmap <F11> :set number!<CR>
nmap <F10> :call ToggleColorColumn()<CR>
nmap <F9> :call ToggleStatusBar()<CR>
nmap <F8> :call ToggleAllVisual()<CR>


"---------------------------------------------
"      - Abbreviations and Corrections -
"---------------------------------------------

" Common typos
iabbrev heigth height
iabbrev heigths heights
iabbrev lenght length
iabbrev lenghts lengths
iabbrev widht width
iabbrev widhts widths

" Git signature
iabbrev gsig Vanderson Rodrigues <vanderson@tutamail.com>

"---------------------------------------------
"      - Syntax and Colors -
"---------------------------------------------

" Turn syntax highlighting on by default
syntax on

" Detect type of file
filetype on

" Load plugin file for specific file type
filetype plugin on

" Load indent file for specific file type
filetype indent on

" Set my customization of default theme
colorscheme default
