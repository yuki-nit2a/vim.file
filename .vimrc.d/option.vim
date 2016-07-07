"
" ToC No.1-27 is based on :options. Vide it
"

"""
"" Initialize
"
set all&

"""
"" 26 Multi-byte characters
"
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,cp932,iso-2022-jp
set termencoding=utf-8
"set charconvert=
set nodelcombine
set maxcombine=6
set ambiwidth=single

"""
"" 1 Important
"
set nocompatible
"set cpoptions=
set noinsertmode
set nopaste
set pastetoggle=
"set runtimepath=
"set helpfile=

"""
"" 2 Moving around, searching and patterns
"
set whichwrap=b,s,h,l,<,>,~,[,]
set startofline
"set paragraphs=
"set sections=
set path=.
set cdpath=.
set autochdir
set wrapscan
set incsearch
set magic
set regexpengine=0
set ignorecase
set smartcase
set casemap=internal,keepascii
set maxmempattern=10240
"set define=
"set include=
"set includeexpr=

"""
"" 3 Tags
"
set tagbsearch
set taglength=0
execute 'set tags=' . g:vimrc.dir.var . 'tag/tags'
set tagrelative
set tagstack
set showfulltag
set nocscopetag
"set cscopeprg=cscope
"set cscopetagorder=0
"set cscopepathcomp=0
"set nocscopeverbose
"set cscopequickfix=
"set noscoperelative

"""
"" 4 Displaying text
"
set scroll=0
set scrolloff=0
set wrap
set linebreak
set breakindent
set breakindentopt=min:20,shift:0
set breakat=\ \ !@*-+;:,./?
set showbreak=>\|\ 
set sidescroll=1
set sidescrolloff=0
set display=lastline
set fillchars=stl:\ ,stlnc:\ ,vert:\|,fold:-,diff:-
set cmdheight=1
"set window=
set nolazyredraw
set redrawtime=1000
set writedelay=0
set list
set listchars=eol:$,tab:>\ ,space:\ ,trail:\ ,extends:$,precedes:^,conceal:*,nbsp:_
set number
set norelativenumber
set numberwidth=4
set conceallevel=0
"set concealcursor=

"""
"" 5 Syntax, highlighting and spelling
"
set background=dark
set filetype=
set syntax=
set synmaxcol=10000
"set highlight=
set hlsearch
set nocursorcolumn
set nocursorline
set colorcolumn=
set nospell
set spelllang=en,cjk
"set spellfile=
"set spellcapcheck=[.?!]\\_[\\])'\"\    \ ]\\+
"set spellsuggest=best
"set mkspellmem=460000,2000,500

"""
"" 6 Multiple windows
"
set laststatus=2
"set statusline=%l/%L,%c\ %oB\ 0x%B\ %w%h%r%m\ %<%F\ (%Y)\ %=\ [f:%{&fileencoding},e:%{&encoding}]\ [%{&fileformat}]
set statusline=
set noequalalways
set eadirection=both
set winheight=1
set winminheight=0
set winfixheight
set winfixwidth
set winwidth=1
set winminwidth=0
set helpheight=0
set previewheight=10
set previewwindow
set nohidden
"set switchbuf=
set nosplitbelow
set nosplitright
set noscrollbind
set scrollopt=ver,hor,jump
set nocursorbind

"""
"" 7 Multiple tab pages
"
set showtabline=2
set tabpagemax=100
set tabline=%!MakeTabLine()
"set guitablabel=
"set guitabtooltip=

function! s:tabpage_label(n)
    let title = gettabvar(a:n, 'title')
    if title !=# ''
        return title
    endif

    let bufnrs = tabpagebuflist(a:n)

    let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

    let no = len(bufnrs)
    if no is 1
        let no = ''
    endif

    let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) ==# '' ? '' : ' '

    let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]
    let fname = pathshorten(bufname(curbufnr))

    let label = no . mod . sp . fname

    return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
endfunction

function! MakeTabLine()
    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
    let sep = ' | '
    let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
    let info = ''

    return tabpages . '%=' . info
endfunction

"""
"" 8 Terminal
"
"set term=
"set ttytype=
set termbidi
set ttyfast
"set noweirdinvert
set esckeys
set scrolljump=1
set ttyscroll=999
"set guicursor=
set title
set titlelen=120
set titlestring=%(\ %w%h%r%m\ %F\ (%Y)\ %)
set titleold=Title\ is\ gone\ <-{:D)=II-LL
set icon
set iconstring=
set restorescreen

"""
"" 12 Messages and info
"
set terse
set shortmess=filmnrwxoOtTI
set showcmd
set noshowmode
set noruler
"set rulerformat=%30(%l/%LL,%cc\ %oB\ 0x%B%)
set report=0
set verbose=0
set verbosefile=
set more
set noconfirm
set errorbells
set novisualbell
set helplang=ja,en

"""
"" 13 Selecting text
"
set selection=inclusive
set selectmode=mouse
set keymodel=startsel,stopsel

"""
"" 14 Editing text
"
set undolevels=100000
set undoreload=100000
set nomodified
set noreadonly
set modifiable
set textwidth=0
set wrapmargin=0
set backspace=indent,eol,start
"set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
"set formatoptions+=tcq
"set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
"set formatexpr=
set complete=.,w,b,u,i,d,t
set completeopt=menuone,longest,preview
set pumheight=0
"set completefunc=
"set omnifunc=
"set dictionary=
"set thesaurus=
set noinfercase
set nodigraph
set notildeop
"set operatorfunc=
set noshowmatch
set matchtime=1
set matchpairs=(:),{:},[:],<:>,=:;
set nojoinspaces
set nrformats=alpha,octal,hex

"""
"" 15 Tabs and indenting
"
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent
set nocindent
"set cinoptions=
"set cinkeys=0{,0},0),:,0#,!^F,o,O,e
"set cinwords=if,else,while,do,for,switch
"set indentexpr=
"set indk=0{,0},:,0#,!^F,o,O,e
set copyindent
set nopreserveindent
set nolisp
"set lispwords=

"""
"" 16 Folding
"
set foldenable
set foldlevel=0
set foldlevelstart=0
set foldcolumn=2
set foldtext=foldtext()
set foldclose=
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
set foldminlines=1
set commentstring=/*%s*/
set foldmethod=manual
"set foldexpr=0
"set foldignore=#
set foldmarker={{{,}}}
set foldnestmax=20

"""
"" 17 Diff mode
"
set nodiff
set diffopt=filler,context:3,vertical
"set diffexpr=
"set patchexpr=

"""
"" 18 Mapping
"
set maxmapdepth=1000
set remap
set timeout
set nottimeout
set timeoutlen=3000
set ttimeoutlen=100

"""
"" 19 Reading and writing files
"
set modeline
set modelines=10
set nobinary
set endofline
set nobomb
"set notextmode
"set textauto
set fileformat=unix
set fileformats=unix,dos
set write
set writebackup
set backup
set backupskip=
set backupcopy=yes
execute 'set backupdir=' . g:vimrc.dir.var . 'backup/'
set backupext=~
set noautowrite
set noautowriteall
set nowriteany
set noautoread
set patchmode=
set fsync
set noshortname
set cryptmethod=blowfish2

"""
"" 20 The swap file
"
execute 'set directory=' . g:vimrc.dir.var . 'swap/'
set swapfile
set swapsync=fsync
set updatecount=100
set updatetime=10000
set maxmem=2000000
set maxmemtot=2000000

"""
"" 21 Command line editing
"
set history=10000
"set wildchar=
set wildcharm=0
set wildmode=full
set suffixes=.bak,~,.o,.h,.info,.swp,.obj
set suffixesadd=
set wildignore=
set fileignorecase
set wildignorecase
set wildmenu
set cedit=
set cmdwinheight=10
set undofile
execute 'set undodir=' . g:vimrc.dir.var . 'undo/'

"""
"" 22 Executing external commands
"
"set shellquote=
"set shellxquote=(
"set shellxescape=\"&\|<>()@^
"set shellredir=>%s\ 2>&1
"set shelltemp
""set equalprg=
""set formatprg=
"set keywordprg=:help
"set warn
"
"if has('win64') || has('win32')
"    set shell=cmd.exe
"    set shellcmdflag=/c
"else
"    set shell=bash
"    set shellcmdflag=-i
"endif

"""
"" 23 Running make and jumping to errors
"
execute 'set errorfile=' . g:vimrc.dir.var . 'log/errors.err'
"set errorformat=
"set makeprg=
set shellpipe=>%s\ 2>&1
"set makeef=
"set grepprg=findstr\ /n
"set gfm=%f:%l:%m,%f:%l%m,%f\ \ %l%m

"""
"" 24 System specific
"
set shellslash

"""
"" 25 Language specific
"
"set isfname=
"set isident=
"set iskeyword=
"set isprint=
set quoteescape=\\
set norightleft
set rightleftcmd=search
set norevins
set allowrevins
set aleph=224
set nohkmap
set nohkmapp
set noaltkeymap
set nofkmap
set noarabic
set arabicshape
set notermbidi
set keymap=
set langmap=
"set nolangnoremap
set iminsert=0
set imsearch=0

"""
"" 27 Various
"
set virtualedit=
set eventignore=
set loadplugins
set noexrc
set nosecure
set gdefault
set noedcompatible
set noopendevice
set maxfuncdepth=100
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winpos,winsize
set viewoptions=cursor,folds,options
execute 'set viewdir=' . g:vimrc.dir.var . 'view/'
execute "set viminfo=%,'10000,/10000,:10000,@10000,h,s1024,n" . expand(g:vimrc.dir.var . 'viminfo')
set bufhidden=
set buftype=
set buflisted
set debug=

"""
"" Define other vim variables
"
let g:vim_indent_cont = 0

colorscheme blue
