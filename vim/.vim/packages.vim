command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('sheerun/vim-polyglot')
