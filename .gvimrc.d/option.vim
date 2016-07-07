"
" ToC No.1-27 is based on :options. Vide it
"

"""
"" 4 Displaying text
"
set cmdheight=1
"set columns=
"set lines=

"""
"" 9 Using the mouse
"
set mouse=a
set nomousefocus
set nomousehide
set mousemodel=popup
set mousetime=500
"set ttymouse=
set mouseshape=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow

"""
"" 10 GUI
"
set guifont=Tamsyn8x16:h12
set guifontwide=MS_Gothic:h12
set guifontset=
set guioptions=aciMg
set renderoptions=type:directx,geom:1
set guipty
set browsedir=buffer
set langmenu=none
set menuitems=25
set winaltkeys=no
set linespace=1
set balloondelay=300
set noballooneval
function! BalloonExpr()
    return 'Line: ' . v:beval_lnum
        \ . ', Column: ' . v:beval_col
        \ . ', File: ' . bufname(v:beval_bufnr)
        \ . ', Word: ' . v:beval_text
endfunction
set balloonexpr=BalloonExpr()

"""
"" 11 Printing
"
if has('printer')
    set printoptions=left:3pc,right:3pc,top:3pc,bottom:3pc,header:3,syntax:a,number:y,wrap:y,duplex:off,collate:y,jobsplit:n,portrait:y,paper:A4,formfeed:n
    set printheader=%<%F%=Page\ %N

    set printdevice=
    set printmbcharset=
    set printencoding=

    if has('win32') || has('win64')
        set printmbfont=MS_Gothic:h9
        set printfont=MS_Gothic:h9
    endif
endif

"""
"" 13 Selecting text
"
if has('gui') || has('xterm_clipboard')
    set clipboard=html
endif
