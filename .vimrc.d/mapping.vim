"""
"" Define alias of general vim commands
"

"" Mode
noremap s :

noremap! <c-g><c-g> <esc>

"" Tab
noremap tn :tabnew<cr>
noremap th gT
noremap tj gt
noremap tk gT
noremap tl gt

"" Buffer
noremap f <nop>
noremap fj <c-w>j
noremap fk <c-w>k
noremap fl <c-w>l
noremap fh <c-w>h
noremap fJ <c-w>J
noremap fK <c-w>K
noremap fL <c-w>L
noremap fH <c-w>H

noremap ffh :vsplit<cr>
noremap ffj :split<cr>
noremap ffk :split<cr>
noremap ffl :vsplit<cr>

noremap fd 10<c-w>>
noremap fr 10<c-w>+
noremap fv 10<c-w>-
noremap fg 10<c-w><

noremap fwh <c-w>H
noremap fwj <c-w>J
noremap fwk <c-w>K
noremap fwl <c-w>L

noremap <c-w> :bunload<cr>
noremap <c-w><c-q><c-w><c-q> :bunload!<cr>

"" Modify
noremap <tab> >>
noremap <s-tab> <<

"" Edit
imap <c-c> <bs>
imap <c-x> <del>

imap <c-d> <c-o>D
noremap! <m-d> <c-o>dd

noremap! <m-h> <bs>
noremap! <m-j> <c-o>dj
noremap! <m-k> <c-o>dk
noremap! <m-l> <del>

"" Register
noremap <space>y "*y
noremap <space>p "*p

"" Scroll
noremap zn zb
noremap zp zt

"" Cursor Move
noremap <c-h> 5h
noremap <c-j> 5j
noremap <c-k> 5k
noremap <c-l> 5l

noremap gh ^
noremap gj G
noremap gk gg
noremap gl $

noremap! <c-h> <left>
noremap! <c-j> <down>
noremap! <c-k> <up>
noremap! <c-l> <right>

noremap! <c-g><c-h> <c-o>^
noremap! <c-g><c-l> <c-o>$

vnoremap <c-u> 30k
vnoremap <c-d> 30j

"" Fold
noremap zh zc
noremap zl zo
noremap zn zd
noremap zj zR
noremap zk zM

"" Save
nnoremap ZZ <nop>
nnoremap ZQ <nop>

noremap <c-s> :w<cr>
noremap ,s :w<cr>

"" Search
noremap fs /
noremap -e :nohlsearch<cr>

"" QuickFix
noremap gn :cnext<cr>
noremap gp :cprev<cr>
noremap gq :cclose<cr>

"" Tag
nnoremap tk <c-o>
nnoremap tj <c-i>

"" Quit
noremap <c-q><c-q><c-q> :quit<cr>

"" Run vim-script itself
noremap <c-f11> :source %:p<cr>

"""
"" Turn off IME at outed insert mode
"
inoremap <esc> <esc>:set<space>iminsert=0<cr>
