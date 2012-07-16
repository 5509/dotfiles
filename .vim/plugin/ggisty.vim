" Ggisty
" capture the gisty grep output.
" needs gisty grep to use this. see the pages below.
" http://d.hatena.ne.jp/swdyh/20081207/1228655198
" TODO: needs to handle 'No match' error
"
" write the code somewhere to define gists root
" 
"let g:ggistyRootPath = '~/dev/gists'
"
command! -nargs=+ Ggisty call s:ggisty(<q-args>)
function! s:ggisty(args)
	silent execute 'vimgrep /' . a:args . '/j ' . g:ggistyRootPath . '/** | cw'
	if len(getqflist()) != 0
		copen
	else
		exit
	endif
endfunction
