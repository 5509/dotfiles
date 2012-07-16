set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mycolor"

" from 'desert'
"	
"	" highlight groups
"	hi Cursor	guibg=khaki guifg=slategrey
"	"hi CursorIM
"	"hi Directory
"	"hi DiffAdd
"	"hi DiffChange
"	"hi DiffDelete
"	"hi DiffText
"	"hi ErrorMsg
"	hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
"	hi Folded	guibg=grey30 guifg=gold
"	hi FoldColumn	guibg=grey30 guifg=tan
"	hi IncSearch	guifg=slategrey guibg=khaki
"	"hi LineNr
"	hi ModeMsg	guifg=goldenrod
"	hi MoreMsg	guifg=SeaGreen
"	hi Question	guifg=springgreen
"	hi Search	guibg=peru guifg=wheat
"	hi SpecialKey	guifg=yellowgreen
"	hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
"	hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
"	hi Title	guifg=indianred
"	hi Visual	gui=none guifg=khaki guibg=olivedrab
"	"hi VisualNOS
"	hi WarningMsg	guifg=salmon
"	"hi WildMenu
"	"hi Menu
"	"hi Scrollbar
"	"hi Tooltip
"	
"	" syntax highlighting groups
"	hi Comment	guifg=SkyBlue
"	hi Constant	guifg=#ffa0a0
"	hi Identifier	guifg=palegreen
"	hi Statement	guifg=khaki
"	hi PreProc	guifg=indianred
"	hi Type		guifg=darkkhaki
"	hi Special	guifg=navajowhite
"	"hi Underlined
"	hi Ignore	guifg=grey40
"	"hi Error
"	hi Todo		guifg=orangered guibg=yellow2
"	
"	" color terminal definitions
"	hi SpecialKey	ctermfg=darkgreen
"	hi NonText	cterm=bold ctermfg=darkblue
"	hi Directory	ctermfg=darkcyan
"	hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
"	hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
"	hi Search	cterm=NONE ctermfg=grey ctermbg=blue
"	hi MoreMsg	ctermfg=darkgreen
"	hi ModeMsg	cterm=NONE ctermfg=brown
"	hi LineNr	ctermfg=3
"	hi Question	ctermfg=green
"	hi StatusLine	cterm=bold,reverse
"	hi StatusLineNC cterm=reverse
"	hi VertSplit	cterm=reverse
"	hi Title	ctermfg=5
"	hi Visual	cterm=reverse
"	hi VisualNOS	cterm=bold,underline
"	hi WarningMsg	ctermfg=1
"	hi WildMenu	ctermfg=0 ctermbg=3
"	hi Folded	ctermfg=darkgrey ctermbg=NONE
"	hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
"	hi DiffAdd	ctermbg=4
"	hi DiffChange	ctermbg=5
"	hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
"	hi DiffText	cterm=bold ctermbg=1
"	hi Comment	ctermfg=darkcyan
"	hi Constant	ctermfg=brown
"	hi Special	ctermfg=5
"	hi Identifier	ctermfg=6
"	hi Statement	ctermfg=3
"	hi PreProc	ctermfg=5
"	hi Type		ctermfg=2
"	hi Underlined	cterm=underline ctermfg=5
"	hi Ignore	cterm=bold ctermfg=7
"	hi Ignore	ctermfg=darkgrey
"	hi Error	cterm=bold ctermfg=7 ctermbg=1

" Vim >= 7.0 specific colors
if version >= 700
	"hi CursorLine guibg=#292929
	hi CursorLine guifg=NONE guibg=#292929
	"hi CursorColumn guibg=#242424
	hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
	hi Pmenu 		guifg=#f6f3e8 guibg=#444444
	hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		guifg=#333333 guibg=#ffffff gui=none
hi CursorIM		guifg=#333333 guibg=#ffffff gui=bold
"hi Cursor 		guifg=NONE    guibg=#656565 gui=none
"hi Normal 		guifg=#e9e9e9 guibg=#242424 gui=none
hi Normal 		guifg=#e9e9e9 guibg=#242424 gui=none
hi NonText 		guifg=#404040 guibg=#292929 gui=none
hi LineNr 		guifg=#111111 guibg=#333333 gui=none
hi StatusLine 	guifg=#dbaa59 guibg=#101010 gui=none
hi StatusLineNC guifg=#555555 guibg=#101010 gui=none
hi VertSplit 	guifg=#101010 guibg=#101010 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#ffffff guibg=#242424	gui=bold
hi Visual		guifg=#ffffff guibg=#444444 gui=none
hi SpecialKey	guifg=#3a3a3a guibg=#242424	gui=none

" Syntax highlighting
hi Comment 		guifg=#666666 gui=bold
hi Todo 		guifg=#999999 guibg=#f6b33c gui=bold
hi Constant 	guifg=#aa6666 gui=none
hi String 		guifg=#e49157 gui=none
hi Identifier 	guifg=#cae682 gui=none
"hi Function 	guifg=#cae682 gui=none
hi Function 	guifg=#6fde6c gui=none
hi Type 		guifg=#558855 gui=none
"hi Type 		guifg=#999999 gui=none
"hi Statement 	guifg=#8ac6f2 gui=none
hi Statement 	guifg=#7777aa gui=none
hi Keyword		guifg=#7777aa gui=none
hi PreProc 		guifg=#aa6666 gui=none
hi Number		guifg=#aa6666 gui=none
hi Special		guifg=#e7f6da gui=none

hi Underlined	cterm=underline guifg=#ffffff
hi Search	guibg=#f2a215 guifg=#000000


