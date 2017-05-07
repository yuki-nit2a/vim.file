"""
"" Restore cursor potision
"
augroup RestoreCursorPosition
    autocmd!
    autocmd BufRead * if 0 < line("'\"") && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

"""
"" Show highlight group name under cursor
"
map <space><f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

"""
"" Turn off IME at outed insert mode
"
inoremap <esc> <esc>:set<space>iminsert=0<cr>
