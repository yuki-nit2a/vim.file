"""
"" Restore window position and size
"
let g:save_gui_file = expand(g:vimrc.dir.var . 'window/position')

function! s:save_gui()
    let s:options = [
    \   'set columns=' . &columns,
    \   'set lines=' . &lines,
    \   'winpos ' . getwinposx() . ' ' . getwinposy(),
    \]
    call writefile(s:options, g:save_gui_file)
endfunction

function! s:restore_gui()
    if filereadable(g:save_gui_file)
        execute 'source' g:save_gui_file
    endif
endfunction

augroup SaveGUI
  autocmd!
  autocmd VimLeavePre * call s:save_gui()
  autocmd VimEnter * call s:restore_gui()
augroup END
