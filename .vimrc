"
"       (*-*)  _     <-. (-_-)     ('-')          
"      _(O 0) (_)       \(O 0)_ <-.(O0 ) _        
" ,--.(_/,-.\ ,-(`_`),--./  ,-.),------,)\-,-----.
" \   \ / (_/ | ( O0)|   `.'   ||   /`. ' |  .--./
"  \   /   /  |  |  )|  |'.'|  ||  |_.' |/_) ('.')
" _ \     /_)(|  |_/ |  |   |  ||  .   .'||  |o o)
" \-'\   /    |  |'->|  |   |  ||  |\  \(_'  '--'\
"     `-'     `--'   `--'   `--'`--' '--'  `-----'
"
" Maintained by yuki-nit2a <yuki@nit2a.com>
"

set cpo&vim
set shellslash

let g:vimrc = {}
let g:vimrc.dir = {}

if has('win64') || has('win32')
    let g:vimrc.dir.home = 'C:/-/root/'
    let g:vimrc.dir.repo = 'C:/-/var/dev/'
elseif has('win32unix')
    let g:vimrc.dir.home = '/cygdrive/c/-/root/'
    let g:vimrc.dir.repo = '/cygdrive/c/-/var/dev/'
endif

let g:vimrc.dir.self = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
let g:vimrc.dir.home = simplify(g:vimrc.dir.home . '/')
let g:vimrc.dir.var = g:vimrc.dir.home . '.vim.var/'

let s:vimrcs = [
    \ 'option',
    \ 'plugin',
    \ 'extension2filetype',
    \ 'filetype',
    \ 'mapping',
    \ 'tweak',
\ ]

for s:vimrc in s:vimrcs
    execute 'source ' . g:vimrc.dir.self . '.vimrc.d/' . s:vimrc . '.vim'
endfor
