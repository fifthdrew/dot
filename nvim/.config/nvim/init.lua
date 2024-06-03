-- File: init.lua 
-- Maintainer: Vanderson Rodrigues <vanderson@tutamail.com>
--             __
--     __  __ /\_\    ___ ___   _ __   ___
--    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
--  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
-- /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
-- \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/

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
vim.opt.termguicolors=false

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
-- Options:▕ │ ▏
vim.opt.fillchars=vim.opt.fillchars+"vert:▕"

-- Removes '~' chars in the end of file
--vim.opt.fillchars=vim.opt.fillchars+"eob: "

-- Change the characters used in the folding
--vim.opt.fillchars=vim.opt.fillchars+"fold:—"
vim.opt.fillchars=vim.opt.fillchars+"fold:—"

-- Invisible characters
--vim.opt.listchars="tab:→  ,space:·,trail:·,eol:↲,nbsp:␣"
vim.opt.listchars="tab:→  ,trail:·,eol:↲,nbsp:␣"

-- Start of default statusline
--vim.opt.statusline=""

-- NOTE: The line below has a trailing space character
--vim.opt.statusline="%<%{FilePath()} %h%w%m%r "

-- End of default statusline (with ruler)
--vim.opt.statusline=statusline+"%=%(%l,%c%V\ %=\ %P\ %)"

-- Set appearance of text folded
--vim.opt.foldtext=SetFoldText()

-- Press F3 to enter paste insert mode
-- This removes automatic indentation on pasting
vim.opt.pastetoggle="<F3>"

-- Performance things
-- https://vi.stackexchange.com/questions/10495/most-annoying-slow-down-of-a-plain-text-editor/10496
-- vim.open.regexpengine=1
vim.opt.lazyredraw=true
-- vim.open.synmaxcol=200

-- faster scrolling
vim.opt.ttyfast=true

-- http://bugs.debian.org/608242
-- vim.opt.t_RV=""

-- Automatically invoke completion mode in mappings
-- This is necessary for the following:
-- nnoremap <leader>B :buffer <C-z><S-Tab>
vim.cmd("set wildcharm=<C-z>")

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

vim.opt.showmatch=true

vim.opt.shellcmdflag="-ic"

vim.opt.splitright=true

vim.opt.splitbelow=true

-- }}}
-- {{{ DEFINE AND SET VARIABLES

-- }}}
-- {{{ SYNTAX AND COLORS
vim.cmd("colorscheme solarized8")
-- }}}
