" File: .vimrc
" Maintainer: Vanderson Rodrigues
"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/

filetype plugin indent on
syntax on
colorscheme ron

"------------------------------------------
"           - General settings -
"------------------------------------------

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
set path+=.,,,**

" Set command line completion
set wildmenu

" Allow load a buffer in a window that
" currently has a modified buffer
set hidden

" Make vim wrap long lines
set wrap
set linebreak
set nolist

" Read file when modified outside vim
set autoread

" Allow mouse
set mouse=a

" Set encoding
set encoding=utf-8

" Set terminal colors
"set termguicolors

" Disable modeline because security issues
set nomodeline

" Do not keep any history
set noswapfile
set nowb
set nobackup
set viminfo='0,:0,<0,@0,f0 

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

" Start of default statusline
set statusline=

" NOTE: The line below has a trailing space character
set statusline=%<%{pathshorten(expand('%'))}\ %h%w%m%r\ 

" End of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)

" Set fuzzy finder
set rtp+=~/.fzf

"---------------------------------------------
"            - Define variables -
"---------------------------------------------

" Vim folder location
let $VIMHOME = $HOME."/.vim/"

" Netrw plugin configuration
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'

" Hardtime plugin configuration
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+",
                           \ "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+",
                           \ "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 2000
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 2

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


"---------------------------------------------
"            - Utility functions -
"---------------------------------------------

function! ToggleColorColumn()
    if &colorcolumn == 80
        set colorcolumn=0
    else
        set colorcolumn=80
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
    :set number! relativenumber!
endfunction

function! ToggleInvisibleChars()
  if &list
    set nolist
  else
    set list
    set list listchars=tab:→\ ,trail:·,eol:↲,nbsp:␣
  endif
endfunction

" This allows run :Test command from Vader plugin
" SOURCE: https://github.com/junegunn/vader.vim
" {
function! s:tests()
  if expand('%:e') == 'vim'
    let testfile = printf('%s/%s.vader', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(testfile)
      echoerr 'File does not exist: '. testfile
      return
    endif
    source %
    execute 'Vader' testfile
  else
    let sourcefile = printf('%s/%s.vim', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(sourcefile)
      echoerr 'File does not exist: '. sourcefile
      return
    endif
    execute 'source' sourcefile
    Vader
  endif
endfunction

autocmd BufRead *.{vader,vim}
      \ command! -buffer Test call s:tests()
" }

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


"---------------------------------------------
"           - Keyboard shortcuts -
"---------------------------------------------

" General stuff
nmap <Leader>v :edit $MYVIMRC<CR>
nmap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>; A;<Esc>
nmap <Leader>b :ls<CR>:b<Space>
nmap <Leader>t :term<CR>
nmap <Leader>8 :copen<CR>
nmap <Leader>7 :cnext<CR>
nmap <Leader>6 :cprevious<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nmap <Leader>sp :set spell!<CR>
nmap <Leader>e :e.<CR>
nmap <Leader>sy :syntax sync fromstart<CR>
nmap <Leader>ns :nohlsearch<CR>
nmap <C-j> :resize +10<CR>
nmap <C-k> :resize -10<CR>
nmap <C-l> :vertical resize -10<CR>
nmap <C-h> :vertical resize +10<CR>
map <Leader>c :call ToggleComment()<CR>
nmap <Leader>i :call ToggleInvisibleChars()<CR>
nmap <Leader>f :find<Space>
nmap <Leader>sv :vsplit<CR><C-w>w
nmap <Leader>ss :split<CR><C-w>w
nmap <Leader>tn :tabnew<CR>

" Related to shell
nmap <Leader>fz :FZF<CR>
nmap <Leader>gt :!ctags -R .<CR>

" Related to plugins
nmap <Leader>H :HardTimeToggle<CR>


"---------------------------------------------
"                 - Snippets -
"---------------------------------------------

nmap <Leader>html :-1read $VIMHOME.skeleton.html<CR>3jwf>a
nmap <Leader>cpp :-1read $VIMHOME.competition.cpp<CR>11j


"---------------------------------------------
"             - Look settings -
"---------------------------------------------

nmap <F12> :set  nu! rnu!<CR>
nmap <F11> :set  nu!<CR>
nmap <F10> :call ToggleColorColumn()<CR>
nmap <F9> :call ToggleStatusBar()<CR>
nmap <F8> :call ToggleAllVisual()<CR>


"---------------------------------------------
"      - Abbreviations and Corrections -
"---------------------------------------------

iabbrev heigth height
iabbrev heigths heights
iabbrev lenght length
iabbrev lenghts lengths
iabbrev widht width
iabbrev widhts widths
