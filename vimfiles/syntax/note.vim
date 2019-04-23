syn match NoteComment "#.*"
syn match NoteHeader "##.*"
syn region NoteQuote start="\"" end="\""

let b:current_syntax = "note"

hi def link NoteHeader Number
hi def link NoteComment Type
hi def link NoteQuote Statement
