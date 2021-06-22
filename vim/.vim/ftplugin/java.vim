" Java specific configuration
:set suffixesadd=.java
:set makeprg=javac\ -g\ %
:set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

nnoremap <Leader>1 :call CompileJava()<CR>
nnoremap <Leader>2 :call RunClass()<CR>

func! CompileJava()
	:w
	:!javac -g "%"
endfunc

func! RunClass()
	:!java -cp "%:p:h" "%:t:r"
endfunc
