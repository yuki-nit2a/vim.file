"""
"" Restore cursor potision
"
augroup RestoreCursorPosition
    autocmd!
    autocmd BufRead * if 0 < line("'\"") && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

"""
"" Prevent to close vim
"
"cabbrev q <c-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'enew' : 'q')<cr>
"cabbrev wq <c-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'w\|enew' : 'wq')<cr>
"cabbrev qa <c-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'tabonly\|only\|enew' : 'qa')<cr>
"cabbrev wqa <c-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'wa\|tabonly\|only\|enew' : 'wqa')<cr>

"""
"" Show highlight group name under cursor
"
map <space><f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
