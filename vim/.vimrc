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
set ttimeoutlen=1

"---------------------------------------------
"            - Define variables -              
"---------------------------------------------

" Vim folder location
let $VIMHOME = $HOME."/.vim/"

" Netrw plugin configuration
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Zenburn theme configuration
let g:zenburn_alternate_Include = 1
let g:zenburn_unified_CursorColumn = 1
let g:zenburn_old_Visual = 1
let g:zenburn_italic_Comment = 1
let g:zenburn_subdued_LineNr = 1
let g:zenburn_disable_Label_underline = 1
let g:zenburn_force_dark_Background = 1

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

" This allows run :Test command from Vader plugin
" SOURCE: https://github.com/junegunn/vader.vim
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
nmap <Leader>p :tabp<CR>
nmap <Leader>n :tabn<CR>
nmap <Leader>sp :set spell!<CR>
nmap <Leader>e :e.<CR>
nmap <Leader>sy :syntax sync fromstart<CR>
nmap <Leader>ns :nohlsearch<CR>
nmap <C-j> :resize +2<Cr>
nmap <C-k> :resize -2<cr>
nmap <C-l> :vertical resize +2<CR>
nmap <C-h> :vertical resize -2<CR>
map <Leader>c :call ToggleComment()<CR>

" Related to shell
nmap <Leader>f :!vim -o `fzf`<CR>
nmap <Leader>gt :!ctags -R .<CR>

" Related to plugins
nmap <Leader>as :SourcetrailRefresh<CR>
nmap <Leader>aa :SourcetrailActivateToken<CR>
nmap <Leader>H :HardTimeToggle<CR>


"---------------------------------------------
"                 - Snippets -              
"---------------------------------------------

nmap <Leader>html :-1read $VIMHOME.skeleton.html<CR>3jwf>a
nmap <Leader>cpp :-1read $VIMHOME.competition.cpp<CR>11j


"---------------------------------------------
"             - Look settings -
"---------------------------------------------

nmap <C-F12> :set  nu! rnu!<CR>
nmap <C-F11> :set  nu!<CR>
nmap <C-F10> :call ToggleColorColumn()<CR>
nmap <C-F9> :call ToggleStatusBar()<CR>
nmap <C-F8> :call ToggleAllVisual()<CR>


"---------------------------------------------
"      - Abbreviations and Corrections -
"---------------------------------------------

iabbrev heigth height
iabbrev heigths heights
iabbrev lenght length
iabbrev lenghts lengths
iabbrev widht width
iabbrev widhts widths
