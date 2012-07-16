" =======================================================
"
" File: open_termina_custom.vim
"
" This file was modified by Takazudo. (takazudo[at]gmail.com)
" This opens iTerm instead of Terminal in Mac.
"
" referred web sites:
" http://iterm.sourceforge.net/scripting.shtml
" http://devilelephant.blogspot.com/2007/08/os-x-finder-iterm-applescript-window.html
" http://d.hatena.ne.jp/goth_wrist_cut/20090922/1253604644
"
" =======================================================
"
" File:        open_terminal_custom.vim
" 
" Requires:
"   platform   Terminal             File manager 
"   Mac        Terminal.app         Finder
"              (with Applescript)   
"   Gnome      gnome-terminal       nautilus
"   KDE        konsole              konqueror
"   Windows    cmd                  explorer
"              (with start)
"   cygwin     bash                 explorer
"
" Example:
"   nnoremap <silent> <F9> :OpenTerminal<CR>
"   nnoremap <silent> <F10> :OpenFilemanager<CR><CR>
"   
" Commands:
"   OpenTerminal
"   OpenFilemanager
"

" OpenTerminal {{{1
function! s:open_terminal()
  let l:current_dir = getcwd()
  execute("chdir " . escape(expand("%:p:h"), " \"'"))

  if has("mac")
"    let l:cmd = "
"      \ tell application 'System Events'            \n
"      \   set is_term_running to exists application process '$Terminal' \n
"      \ end tell                                    \n
"      \
"      \ set cmd to 'cd $current_path'               \n
"      \ tell application '$Terminal'                \n
"      \   activate                                  \n
"      \   if is_term_running is true then           \n
"      \     do script with command cmd              \n
"      \   else                                      \n
"      \     do script with command cmd in window 1  \n
"      \   end if                                    \n
"      \ end tell                                    \n
"      \ "
      let l:cmd = "
      \ tell application '$Terminal' \n
      \   activate \n
      \   if not (exists window index 1) then \n
      \     set myterm to (make new terminal) \n
      \     tell myterm \n
      \       launch session 'via MacVim' \n
      \     end tell \n
      \   end if \n
      \   tell the first terminal \n
      \     tell current session \n
      \       write text 'cd $current_path' \n
      \     end tell \n
      \   end tell \n
      \ end tell \n
      \ "
    let l:cmd = substitute(l:cmd,  "'", '\\"', 'g') 
    "let l:cmd = substitute( l:cmd, "$Terminal", "Terminal", "g" )
    let l:cmd = substitute( l:cmd, "$Terminal", "iTerm", "g" )
    let l:cmd = substitute( l:cmd, "$current_path", "'" . expand("%:p:h") . "'" , "g")
    call system('osascript -e " ' . l:cmd . '"')

  elseif has("gui_gnome") && executable("gnome-terminal")
    call system("gnome-terminal &") 
  elseif has("gui_gnome") && executable("konsole")
    call system("konsole &") 
  elseif has("gui_win32")
    try
      call system("start cmd")
    catch /E484:/
      echo "Ignore E484 error in Windows platform"
    endtry
  elseif executable("bash")
    !bash
  elseif has("win32")
    stop
  endif

  execute("chdir " . escape(l:current_dir, " \"'"))
endfunction

command! -nargs=0 -bar OpenTerminal call s:open_terminal()
command! -nargs=0 -bar Ot call s:open_terminal()

"}}}1

" OpenFilemanager {{{1
function! s:open_filemanager()
  let l:cmd = "$cmd ." 

  let l:current_dir = getcwd()
  execute("chdir " . escape(expand("%:p:h"), " \"'"))

  if has("mac")
    call system("open .")
  elseif has("gui_gnome") && executable("nautilus")
    call system("nautilus .")
  elseif has("gui_gnome") && executable("konqueror")
    call system("konqueror .")
  elseif has("gui_win32") || has("win32")
    call system("explorer .")
  elseif executable("bash")
    !bash
  endif

  execute("chdir " . escape(l:current_dir, " \"'"))
endfunction

command! -nargs=0 -bar OpenFilemanager call s:open_filemanager()
command! -nargs=0 -bar Of call s:open_filemanager()
" }}}1

" About file info {{{1
"=============================================================================
" Copyright (c) 2009 by neocoin
" File:						open_terminal.vim
" Author:					Sangmin Ryu (neocoin@gmail.com)
" Date:						Tue Dec 22 13:33:32 PST 2009
" License:				The MIT License
" Version:				0.1
"=============================================================================
" }}}1

" vim: set fdm=marker:
