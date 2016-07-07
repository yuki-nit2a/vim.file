let s:gvimrcs = [
    \ 'option',
    \ 'terminal',
    \ 'syntax',
    \ 'color',
    \ 'tweak',
\ ]

for s:gvimrc in s:gvimrcs
    execute 'source ' . g:vimrc.dir.self . '.gvimrc.d/' . s:gvimrc . '.vim'
endfor
