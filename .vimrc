" Vim タブ設定まとめ
" 
" set tabstop=4 " 画面上でタブ文字が占める幅
" set expandtab " <Tab>の代わりに空白を使う
" set smarttab  " <Tab>押すとshiftwidthの数だけ空白を挿入する
" set shiftwidth=4 " インデントに使われる空白の数
" set shiftround " インデントをshiftwidthの倍数にする
" 
" <Tab>キーの対応と「インデント」の対応が別々にあるので...
" [2/16/12 6:49:49 PM] 福田 泰雄: タブを可視化するには↓
" 
" set listcharslistcharslistchars=tab:»»
" 
" 2文字めがタブ数分だけ連続する。

" git calls the old version vim. This avoids load this config.
" http://nanasi.jp/articles/howto/install/vim7_install_to_tiger.html
:if ! has("migemo")
	:finish
:endif

"load colorscheme
colorscheme koehler

" never make backup/swap
set nobackup
set noswapfile

"share clipboard with other applications
set clipboard=unnamed

"number ruler
set number

" define backup dir
"set backupdir=$HOME/.vimbackup
"set directory=$HOME/.vimbackup

"enable ftplugin
filetype plugin on

" auto
set autoread

" ignore case in search
set ignorecase

" consider case if the search pattern contains uppercase
set smartcase

" incsearch
set noincsearch

" seach ends at the end of the buffer
set nowrapscan

" tab = 2space
set tabstop=4
set softtabstop=4
" backspace can delete linefeed, tab, space
set backspace=2
" tab = 4 space chars
set shiftwidth=4
" tab is tab. doesnot expand to space.
set noexpandtab

" allow autoindent
set autoindent

" hilight another brace if the cursor was on it
set showmatch

" add extra features to command-line
set wildmenu

" show ruler
set ruler

" show whitespace chars
set list

" show whitespace chars as following
set lcs=tab:>-,eol:$,trail:_,extends:\

" doesnt allow textwrap
set nowrap

" show status line
set laststatus=2

" commandline height
set cmdheight=1

" show commandline
set showcmd

" show filename on titlebar
set title

" hilight cursor line
"autocmd WinEnter *  setlocal cursorline
"autocmd WinLeave *  setlocal nocursorline
set cursorline

"shell slash \ to /
set shellslash

"---------------------------------------------------------------------------
" macrolike useful small scripts
"
"encoding commands
"command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
"command! Iso2022jp edit ++enc=iso-2202-jp
command! Utf8 edit ++enc=utf-8
"command! Jis Iso2022jp
command! Sjis ++enc=cp932

"change encoding commands
"command! ChgencCp932 set fenc=cp932
command! ChgencEucjp set fenc=euc-jp
"command! ChgencIso2022jp set fenc=iso-2202-jp
command! ChgencUtf8 set fenc=utf-8
"command! ChgencJis ChgencIso2022jp
command! ChgencSjis set fenc=cp932

"escape patterns in search offset
"cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
"cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

command! Crlf set fileformat=dos
command! Lf set fileformat=unix

"---------------------------------------------------------------------------
" key mapping
"
" change hjkl behavior for line wrap
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" gm to select last modified text
" nnoremap gm '[v']
" vnoremap gm :<C-u>normal gm<Enter>
" onoremap gm :<C-u>normal gm<Enter>


"---------------------------------------------------------------------------
" misc
"
" automatically change directory where the buffer's file exists
set autochdir

" enable multi buffer edit
set hidden

" dont use annoying indent
set nosmartindent
set nosmarttab

" make me go to next line
set whichwrap=b,s,h,l,<,>,[,]

" statusline
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" show wrap break
set showbreak=++++

" escape slash
vnoremap s y:%s/<C-r>=substitute(@0, '/', '\\/', 'g')<Return>//g<Left><Left>

" operator replace
map R <Plug>(operator-replace)

"-----------------------
" autocmd
" https://github.com/hokaccha/dotfiles/blob/master/.vimrc
"------------------------

augroup MyAutoCmd
  autocmd!
augroup END

" .mt, .tt is htm
"mtとttをhtmlに
autocmd MyAutoCmd BufNewFile,BufReadPost *.mt,*.mtml,*.tt set filetype=html

"psgiとtはperl
autocmd MyAutoCmd BufNewFile,BufReadPost *.psgi,*.t set filetype=perl

"ruをrubyに
autocmd MyAutoCmd BufNewFile,BufReadPost *.ru set filetype=ruby

"asをactionscriptに
autocmd MyAutoCmd BufNewFile,BufReadPost *.as set filetype=actionscript

"markdownのfiletypeをセット
autocmd MyAutoCmd BufNewFile,BufReadPost *.md,*.txt set filetype=md

"なぜかnoexpandtabになることがあるので
"autocmd MyAutoCmd BufNewFile,BufReadPost * set expandtab

"ディレクト自動移動
autocmd MyAutoCmd BufNewFile,BufReadPost *
\ execute ":lcd " . substitute(expand("%:p:h"), ' ', '\\ ', 'g')

" I hate indents
set nocindent
autocmd FileType html set indentexpr&
autocmd FileType xhtml set indentexpr&
autocmd FileType javascript set indentexpr&
autocmd FileType python set indentexpr&

" オレオレgrep
command! -complete=file -nargs=+ Grep call s:grep(<q-args>)
function! s:grep(args)
    execute 'vimgrep' '/' . a:args . '/j **/*'
    if len(getqflist()) != 0 | copen | endif
endfunction

"-----------------------
" 文字コードとかの設定
" https://github.com/hokaccha/dotfiles/blob/master/.vimrc
"------------------------
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"改行コード
set fileformats=unix,dos,mac

" タブラインの設定
" from :help setting-tabline
set tabline=%!MyTabLine()

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " 強調表示グループの選択
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " タブページ番号の設定 (マウスクリック用)
    let s .= '%' . (i + 1) . 'T'

    " ラベルは MyTabLabel() で作成する
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " 最後のタブページの後は TabLineFill で埋め、タブページ番号をリセッ
  " トする
  let s .= '%#TabLineFill#%T'

  " カレントタブページを閉じるボタンのラベルを右添えで作成
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return expand("#".buflist[winnr - 1].":t")
endfunction

" 開いてるファイルにのディレクトリに移動
command! -nargs=0 CD :execute 'lcd ' . expand("%:p:h")

"pasteモードトグル
nnoremap <Space>tp :<C-u>set paste!<CR>

"git
nnoremap <Space>g :<C-u>!git<Space>

" jslint
function! Jslint()
    let msg = system('/usr/local/bin/jsl -process ' . expand('%:p'))
    let m = matchlist(msg, '\(\d\+\) error(s), \(\d\+\) warning(s)')
    let error = m[1]
    let warn  = m[2]
    if (error == 0 && warn == 0)
        echo 'syntax ok'
    else
        let msgs = split(msg, '\n')
        let errors = []
        for line in msgs
            let m = matchlist(line, expand('%:p').'(\(\d\+\)): \(.*\)')
            if len(m) != 0
                call add(errors, printf('%s:%s: %s',
                \                        expand('%:p'), m[1], m[2]))
            endif
        endfor
        setlocal errorformat=%f:%l:%m
        cgetexpr join(errors, "\n")
        copen
    endif
endfunction
autocmd! FileType javascript nnoremap <Space>jl :<C-u>call Jslint()<CR>

"" こういうHTMLがあったときに
"" <div id="hoge" class="fuga">
"" ...
"" </div>
""
"" 実行するとこうなる
"" <div id="hoge" class="fuga">
"" ...
"" <!-- /div#hoge.fuga --></div>
"
"function! Endtagcomment()
"    let reg_save = @@
"
"    try
"        silent normal vaty
"    catch
"        execute "normal \<Esc>"
"        echohl ErrorMsg
"        echo 'no match html tags'
"        echohl None
"        return
"    endtry
"
"    let html = @@
"
"    let start_tag = matchstr(html, '\v(\<.{-}\>)')
"    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')
"
"    let id = ''
"    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
"    if exists('id_match[1]')
"        let id = '#' . id_match[1]
"    endif
"
"    let class = ''
"    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
"    if exists('class_match[1]')
"        let class = '.' . join(split(class_match[1], '\v\s+'), '.')
"    endif
"
"    execute "normal `>va<\<Esc>`<"
"
"    let comment = g:endtagcommentFormat
"    let comment = substitute(comment, '{%tag_name}', tag_name, 'g')
"    let comment = substitute(comment, '{%id}', id, 'g')
"    let comment = substitute(comment, '{%class}', class, 'g')
"    let @@ = comment
"
"    normal ""P
"
"    let @@ = reg_save
"endfunction
"let g:endtagcommentFormat = '<!-- /{%tag_name}{%id}{%class} -->'
"nnoremap ,t :<C-u>call Endtagcomment()<CR>

" ディレクトリが存在しなくてもディレクトリつくってファイル作成
function! s:newFileOpen(file)
    let dir = fnamemodify(a:file, ':h')
    if !isdirectory(dir)
        call mkdir(dir, 'p')
    endif
    execute 'edit ' . a:file
endfunction
command! -nargs=1 -complete=file New call s:newFileOpen(<q-args>)

" define gisty root path
let g:ggistyRootPath = '~/dev/gists'

" complcss3prop
function! CSS3PropertyDuplicate()
  let reg_save = @@

  silent normal Y
  let css3 = @@
  let ind = matchlist(css3, '\v(\s*)(.*)')
  let webkit = ind[1] . "-webkit-" . ind[2]
  let moz    = ind[1] . "-moz-"    . ind[2]
  let ms     = ind[1] . "-ms-"     . ind[2]
  let o      = ind[1] . "-o-"      . ind[2]

  let @@ = webkit . moz . ms . o
  normal ""P

endfunction
nnoremap ,c :<C-u>call CSS3PropertyDuplicate()<CR>

map <C-m> :silent <ESC>:NERDTreeToggle<CR>
nnoremap <silent> <C-C> :CoffeeCompile watch vert<CR>

filetype off
call pathogen#runtime_append_all_bundles()
filetype on

" CoffeeのコンパイルはCake watchに変えた
" autocmd BufWritePost *.coffee silent CoffeeMake! -c | cwindow | redraw!

" タブの設定を切り替えのトグル
function! TabToggle()
    fun! l:Set1()
        setlocal softtabstop=2
        setlocal shiftwidth=2
        setlocal expandtab
    endfun
    fun! l:Set2()
        setlocal softtabstop=4
        setlocal shiftwidth=4
        setlocal noexpandtab
    endfun
    fun! l:Set3()
        setlocal softtabstop=4
        setlocal shiftwidth=4
        setlocal expandtab
    endfun

    if !exists('b:idx') || b:idx > 2
        let b:idx = 0
    endif
    let b:idx = b:idx + 1
    exe 'call l:Set'.b:idx.'()'
endfunction
nnoremap <silent> <C-k> :<C-u>call TabToggle()<CR>

" CSSのプロパティを、ベンダープレフィクス付きで複製するスクリプト。（インデントも引き継ぐよう修正）
function! CSS3PropertyDuplicate()
  let reg_save = @@

  silent normal Y
  let css3 = @@
  let ind = matchlist(css3, '\v(\s*)(.*)')
  let webkit = ind[1] . "-webkit-" . ind[2]
  let moz    = ind[1] . "-moz-"    . ind[2]
  let ms     = ind[1] . "-ms-"     . ind[2]
  let o      = ind[1] . "-o-"      . ind[2]

  let @m = webkit . moz . ms . o
  normal "mP

endfunction
nnoremap ,3 :<C-u>call CSS3PropertyDuplicate()<CR>
