scriptencoding cp932

"load colorscheme
colorscheme mycolor
"colorscheme railscasts2

" hilight searched chars
set hlsearch

"---------------------------------------------------------------------------
" window
"
" window width
set columns=80

" window height
set lines=30

" typography
set guifont=Menlo:h14
set linespace=3

"---------------------------------------------------------------------------
" key mapping
"

" stop the beep
map <ESC> :silent <ESC>

" tab change
map <F2> :silent <ESC>:bp<CR>
map <F3> :silent <ESC>:bn<CR>
map <F4> :silent <ESC>:bw<CR>
map <S-F4> :silent <ESC>:bw!<CR>
map <F9> :silent <ESC>:Kwbd<CR>
map <S-F9> :silent <ESC>:FKwbd2<CR>

" gui tab
map <F5> :silent <ESC>:tabprevious<CR>
map <F6> :silent <ESC>:tabnext<CR>
map <F7> :silent <ESC>:tabnew<CR>
map <F8> :silent <ESC>:tabclose<CR>

"---------------------------------------------------------------------------
" macrolike useful small scripts
"
" show japanese charactors (this works only if this file was saved as Sfhit-jis)
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#555555
au BufNewFile,BufRead * match ZenkakuSpace /Å@/

" :Kwbd - delete buffer but splitted window remains there
com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn 
com! Kwbd2 let kwbd_bn= bufnr("%")|enew|exe "bdel! ".kwbd_bn|unlet kwbd_bn 

fun! g:SurroundBugFix()
	set imdisable
	set noimdisable
endfun
com! SurroundBugFix call g:SurroundBugFix()

"number of screen lines to show around the cursor
set scrolloff=5

" minimal number of columns to keep left and right of the cursor
set sidescrolloff=3

" automatically change pwd to where the buffer exsists
set browsedir=buffer

" hide toolbars
set guioptions-=T

" don't allow to send selected text to the clipboard automatically in visual mode
set guioptions-=a

" use console dialog instead of popup dialogs for simple choice?
set guioptions+=c

" enable horizontal scrollbar
set guioptions+=b

" show GUI tab always
set showtabline=2

" disable IME when insert, search mode.
set iminsert=0 imsearch=0

" disable IME when search mode.
inoremap <C-j> <ESC>:set iminsert=1<CR>:set iminsert=0<CR>
inoremap <ESC> <ESC>:set iminsert=1<CR>:set iminsert=0<CR>
"nnoremap / :set imsearch=1<CR>:set imsearch=0<CR>/
"nnoremap ? :set imsearch=1<CR>imsearch=0<CR>?

" transparent window
set transparency=9

" change window size
nnoremap <silent> <S-Left> †:5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up> † †:5wincmd -<CR>
nnoremap <silent> <S-Down> †:5wincmd +<CR>
