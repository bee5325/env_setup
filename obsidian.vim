" Vim color file
" Name: Obsidian
" Maintainer: Aydar Khabibullin <aydar.kh@gmail.com>
" Version: 0.5
" Date: 01/30/2011 12:35:30 AM

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="obsidian"

let s:Colors = [
\'#a082bd','#e0e2e4','#B5DE8D','#D5A468','#ec7600',
\'#FFD9AC','#e8e2b7','#d39745','#66747b','#84B3E4',
\'#5899c0','#5ab9be','#1D2123','#1F3F41','#f3db2e',
\'#788d94','#485d64','#aeee00','#8863e3','#4e708c',
\'#ff0000','#ffff1a','#21292c','#161b1d']
" color 2 -> 93c763
" color 3 -> ffcd22
" color 5 -> ff8409
" color 9 -> 678cb1
" color 12-> 293134
" color 13-> 014343

" Syntax
execute "hi Normal  guifg="     . s:Colors[1]  . " guibg=" . s:Colors[12]
execute "hi Comment guifg="     . s:Colors[8]                             . " gui=italic"
execute "hi Conditional guifg=" . s:Colors[2]
execute "hi Constant guifg="    . s:Colors[1]
execute "hi Error guifg="       . s:Colors[7]
execute "hi Identifier guifg="  . s:Colors[9]
execute "hi Ignore guifg="      . s:Colors[1]
execute "hi Operator guifg="    . s:Colors[6]
execute "hi PreProc guifg="     . s:Colors[0]
execute "hi Repeat guifg="      . s:Colors[2]
execute "hi Special guifg="     . s:Colors[2]
execute "hi Statement guifg="   . s:Colors[2]
execute "hi Number guifg="      . s:Colors[3]
execute "hi Boolean guifg="     . s:Colors[11]
execute "hi String guifg="      . s:Colors[5]
execute "hi Character guifg="   . s:Colors[5]
execute "hi Title guifg="       . s:Colors[18]
execute "hi Todo guifg="        . s:Colors[18]                            . " gui=bold guisp=NONE"
execute "hi Type guifg="        . s:Colors[9]
execute "hi Underline guifg="   . s:Colors[10]

" Groups
execute "hi Cursor guifg="      . s:Colors[8]  . " guibg=" . s:Colors[17]
execute "hi CursorIM guifg="    . s:Colors[7]  . " guibg=" . s:Colors[17]
execute "hi CursorLine guifg=NONE cterm=NONE       guibg=" . s:Colors[13]
execute "hi CursorColumn guifg=". s:Colors[1]  . " guibg=" . s:Colors[13]
execute "hi Directory guifg="   . s:Colors[10]
execute "hi ErrorMsg guifg="    . s:Colors[13] . " guibg=" . s:Colors[7]
execute "hi FoldColumn guifg="  . s:Colors[13]
execute "hi Folded guifg="      . s:Colors[12] . " guibg=" . s:Colors[11]
execute "hi IncSearch guifg="   . s:Colors[12] . " guibg=" . s:Colors[17] . " gui=none"
execute "hi LineNr guifg="      . s:Colors[8]  . " guibg=" . s:Colors[22] . " gui=none"
execute "hi MatchParen guifg="  . s:Colors[12] . " guibg=" . s:Colors[17] . " gui=bold"
execute "hi ModeMsg guifg="     . s:Colors[5]
execute "hi MoreMsg guifg="     . s:Colors[5]
execute "hi NonText guifg="     . s:Colors[1]
execute "hi Pmenu guifg="       . s:Colors[1]  . " guibg=" . s:Colors[8]
execute "hi PmenuSel guifg="    . s:Colors[13] . " guibg=" . s:Colors[9]
execute "hi Question guifg="    . s:Colors[0]
execute "hi Search guifg="      . s:Colors[1]  . " guibg=" . s:Colors[15]
execute "hi SpecialKey guifg="  . s:Colors[10]
execute "hi StatusLine guifg="  . s:Colors[1]  . " guibg=" . s:Colors[9]  . " gui=none"
execute "hi StatusLineNC guifg=" . s:Colors[1] . " guibg=" . s:Colors[8]  . " gui=none"
execute "hi TabLine guifg="     . s:Colors[8]                             . " gui=none"
execute "hi TabLineFill guifg=" . s:Colors[12] . " guibg=" . s:Colors[13] . " gui=none"
execute "hi TabLineSel guifg="  . s:Colors[1]  . " guibg=" . s:Colors[13] . " gui=none"
execute "hi Tooltip guifg="     . s:Colors[9]  . " guibg=" . s:Colors[8]  . " gui=none"
execute "hi VertSplit guifg="   . s:Colors[0]  . " guibg=" . s:Colors[13] . " gui=none"
execute "hi Visual  guifg="     . s:Colors[1]  . " guibg=" . s:Colors[0]  . " gui=none"
hi VisualNOS gui=none guibg=black
execute "hi WarningMsg  guifg=" . s:Colors[5]                             . " gui=none"
execute "hi WildMenu  guifg="   . s:Colors[14] . " guibg=" . s:Colors[5]  . " gui=none"
execute "hi ColorColumn guifg=NONE                 guibg=" . s:Colors[16]
execute "hi SignColumn "        .                " guibg=" . s:Colors[12]

execute "hi GitSignsAdd guifg="    . "#89ff77" . " guibg=" . s:Colors[12]
execute "hi GitSignsChange guifg=" . "#ffe556" . " guibg=" . s:Colors[12]
execute "hi GitSignsDelete guifg=" . "#dd7373" . " guibg=" . s:Colors[12]

hi DiffAdd      gui=none    guifg=NONE          guibg=#263d1f
hi DiffChange   gui=none    guifg=NONE          guibg=#473e25
hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#663333
hi DiffText     gui=none    guifg=NONE          guibg=#315268

" execute "hi DiffAdd      guifg=" . s:Colors[12] . " guibg=#bada9f"
" execute "hi DiffChange   guifg=" . s:Colors[12].  " guibg=#e5d5ac"
" execute "hi DiffDelete   guifg=#ff8080              guibg=#ffb0b0"
" execute "hi DiffText     guifg=" . s:Colors[12].  " guibg=#8cbee2"
