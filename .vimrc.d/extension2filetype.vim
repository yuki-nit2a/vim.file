augroup AssociateExtensionToFileType
    autocmd!

    let s:map = {
        \ '*.coffee'    : 'coffee',
        \ '*.volt'      : 'html',
        \ '*.tpl'       : 'tpl',
        \ 'Vagrantfile' : 'ruby',
        \ '*.{md|mkd}'  : 'markdown',
    \ }

    for [s:pattern, s:filetype] in items(s:map)
        execute 'autocmd BufNewFile,BufRead ' . s:pattern . ' setfiletype ' . s:filetype
    endfor
augroup END
