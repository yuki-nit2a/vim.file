"""
"" Load plugins
"
if has('vim_starting')
    execute 'set runtimepath+=' . g:vimrc.dir.var . 'plugin/neobundle.vim/'
endif

"" Begin NeoBundle Declaration
call neobundle#begin(expand(g:vimrc.dir.var . 'plugin/'))

"" NeoBundle itself
NeoBundleFetch 'Shougo/neobundle.vim'

"" NeoBundle or of plugins core
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'windows': 'tools\\update-dll-mingw',
    \ },
\ }

"" StatusLine
NeoBundle 'itchyny/lightline.vim'

"" CursorLine
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mattesgroeger/vim-bookmarks'

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {
    \ 'depends': 'Shougo/unite.vim'
\ }
NeoBundle 'Shougo/unite-outline', {
    \ 'depends': 'Shougo/unite.vim'
\ }
NeoBundle 'Shougo/vinarise.vim', {
    \ 'depends': 'Shougo/unite.vim'
\ }

"" NeoComplete
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'shawncplus/phpcomplete.vim'

"" NeoSnippet
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neopairs.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

"" File manager
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs', {
    \ 'depends': 'scrooloose/nerdtree',
\ }
NeoBundle 'Xuyuanp/nerdtree-git-plugin', {
    \ 'depends': 'scrooloose/nerdtree',
\ }

"" History manager
NeoBundle 'sjl/gundo.vim'

"" Tag manager
NeoBundle 'ludovicchabant/vim-gutentags'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/tagbar-phpctags'

"" Quickrun
NeoBundle 'thinca/vim-quickrun'

"" Git
NeoBundle 'tpope/vim-fugitive'

"" Debugger
NeoBundle 'joonty/vdebug'

"" Buffer
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'yonchu/accelerated-smooth-scroll'

"" Session
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session', {
    \ 'depends': 'xolox/vim-misc',
\ }

"" External liaison
NeoBundle 'tyru/open-browser.vim'

"" Help
NeoBundleLazy 'alvan/vim-php-manual'

"" Search
NeoBundle 't9md/vim-quickhl'

"" Substitution
NeoBundle 'osyo-manga/vim-over'

"" Input supporter
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'AndrewRadev/splitjoin.vim'

NeoBundle 'mattn/emmet-vim'

"" Syntax checker
NeoBundle 'scrooloose/syntastic'

"" Syntax and highlight recognizer
NeoBundleLazy 'StanAngeloff/php.vim'
NeoBundleLazy 'pangloss/vim-javascript'
NeoBundleLazy 'othree/html5.vim'
NeoBundleLazy 'hail2u/vim-css3-syntax'
NeoBundleLazy 'wavded/vim-stylus'
NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundleLazy 'gabrielelana/vim-markdown'

"" Markdown
NeoBundle 'kurocode25/mdforvim'

"" Picker
NeoBundle 'KabbAmine/vCoolor.vim'

"" Local plugins
NeoBundle g:vimrc.dir.repo . 'yuki-nit2a/lightwell.vim/'
NeoBundle g:vimrc.dir.repo . 'yuki-nit2a/snippet.lib/'

"" End NeoBundle Declaration
call neobundle#end()

filetype plugin indent on

"""
"" Attach dynamic plugin loading event
"
augroup AttachPluginByFileType
    autocmd!
    autocmd FileType binary   NeoBundleSource vinarise.vim
    autocmd FileType php      NeoBundleSource php.vim
    autocmd FileType php      NeoBundleSource vim-php-manual
    autocmd FileType html,php NeoBundleSource html5.vim
    autocmd FileType css      NeoBundleSource vim-css3-syntax
    autocmd FileType stylus   NeoBundleSource vim-stylus
    autocmd FileType js       NeoBundleSource vim-javascript
    autocmd FileType coffee   NeoBundleSource vim-coffee-script
    autocmd FileType md       NeoBundleSource vim-markdown
augroup END

"""
"" Config plugin Shougo/unite.vim
"
call unite#custom#profile('default', 'context', {
    \ 'start_insert': 0,
    \ 'prompt_direction': 'bottom',
    \ 'split': 0,
\ })

let g:unite_source_file_mru_limit      = 1000
let g:vinarise_enable_auto_detect      = 1
let g:unite_data_directory             = g:vimrc.dir.var . 'plugin-cache/Shougo/unite.vim/'
let g:unite_force_overwrite_statusline = 0

nnoremap <silent> <space>y :UniteResume<cr>
nnoremap <silent> <space>u :Unite<space>buffer<space>file_mru<cr>
nnoremap <silent> <space>d :Unite<space>buffer<space>directory_mru<cr>
nnoremap <silent> <space>f :Unite<space>file<cr>
nnoremap <silent> <space>F :Unite<space>file_rec<cr>
nnoremap <silent> <space>b :Unite<space>buffer<cr>
nnoremap <silent> <space>t :Unite<space>tab<cr>
nnoremap <silent> <space>h :Unite<space>history/unite<cr>
nnoremap <silent> <space>r :Unite<space>register<cr>
nnoremap <silent> <space>z :UniteBookmarkAdd<cr>
nnoremap <silent> <space>x :Unite<space>bookmark<cr>
nnoremap <silent> <space>o :Unite<space>outline<cr>
nnoremap <silent> <space>/ :Unite<space>grep<cr>
nnoremap <silent> <space>\ :UniteWithCursorWord<space>grep<cr>

augroup UniteKeymap
    autocmd!
    autocmd FileType unite nmap <silent> <buffer> <esc> <plug>(unite_exit)
augroup END

"""
"" Config plugin Shougo/neomru.vim
"
let g:neomru#file_mru_path = expand(g:vimrc.dir.var . 'plugin-cache/Shougo/neomru.vim/file')
let g:neomru#directory_mru_path = expand(g:vimrc.dir.var . 'plugin-cache/Shougo/neomru.vim/directory')

"""
"" Config plugin Shougo/neocomplete.vim
"
let g:neocomplete#enable_at_startup                 = 1

let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'

let g:neocomplete#data_directory                    = g:vimrc.dir.var . 'plugin-cache/Shougo/neocomplete.vim/'
let g:neocomplete#sources#dictionary#dictionaries   = {
    \ 'default' :  '',
    \ 'php'     :  g:vimrc.dir.repo . 'yuki-nit2a/dictionary.lib/dict/php.dict',
\ }

augroup RegisterNeocompleteOmnifunc
    autocmd!
    autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php           setlocal omnifunc=phpcomplete#Complete
    autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

noremap! <expr> <cr> pumvisible() ? neocomplete#close_popup() : '<cr>'
noremap! <expr> <c-b> pumvisible() ? neocomplete#close_popup() : '<c-b>'
noremap! <expr> <bs> neocomplete#smart_close_popup() . '<bs>'

"""
"" Config plugin Shougo/neosnippet.vim
"
let g:neosnippet#enable_snipmate_compatibility = 0
let g:neosnippet#disable_select_mode_mappings  = 0
let g:neosnippet#expand_word_boundary          = 0
let g:neosnippet#enable_auto_clear_markers     = 1
let g:neosnippet#enable_conceal_markers        = 0
let g:neosnippet#enable_completed_snippet      = 1

let g:neosnippet#scope_aliases = {
    \ 'ruby': 'ruby,ruby-rails',
\ }
let g:neosnippet#data_directory = g:vimrc.dir.var . 'plugin-cache/Shougo/neosnippet.vim/'
let g:neosnippet#snippets_directory = [
    \ g:vimrc.dir.var . 'plugin/vim-snippets/snippets/',
    \ g:vimrc.dir.repo . 'yuki-nit2a/snippet.lib/snip/',
\ ]
let g:neosnippet#disable_runtime_snippets = {}

imap <c-w> <plug>(neosnippet_expand_or_jump)

"""
"" Config plugin scrooloose/nerdtree
"
let g:NERDTreeAutoCenter                = 1
let g:NERDTreeAutoCenterThreshold       = 3
let g:NERDTreeCaseSensitiveSort         = 1
let g:NERDTreeChDirMode                 = 2
let g:NERDTreeHighlightCursorLine       = 1
let g:NERDTreeHijackNetrw               = 1
let g:NERDTreeIgnore                    = []
let g:NERDTreeRespectWildIgnore         = 0
let g:NERDTreeBookmarksFile             = expand(g:vimrc.dir.var . 'plugin-cache/scrooloose/nerdtree/bookmark')
let g:NERDTreeBookmarksSort             = 1
let g:NERDTreeMouseMode                 = 1
let g:NERDTreeQuitOption                = 0
let g:NERDTreeShowBookmarks             = 0
let g:NERDTreeShowFiles                 = 1
let g:NERDTreeShowHidden                = 1
let g:NERDTreeShowLineNumbers           = 0
let g:NERDTreeSortOrder                 = []
let g:NERDTreeStatusLine                = ''
let g:NERDTreeWinPos                    = 'left'
let g:NERDTreeWinSize                   = 25
let g:NERDTreeMinimalUI                 = 1
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeAutoDeleteBuffer          = 1
let g:NERDTreeCreatePrefix              = 'silent'
let g:NERDTreeDirArrowExpandable        = '>'
let g:NERDTreeDirArrowCollapsible       = '|'

"""
"" Config plugin Xuyuanp/nerdtree-git-plugin
"
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : 'm',
    \ 'Staged'    : 'a',
    \ 'Untracked' : '=',
    \ 'Renamed'   : 'r',
    \ 'Unmerged'  : 'g',
    \ 'Deleted'   : '-',
    \ 'Dirty'     : '*',
    \ 'Clean'     : 'c',
    \ 'Unknown'   : '?'
\ }

"""
"" Config plugin jistr/vim-nerdtree-tabs
"
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_focus_on_files = 0
let g:nerdtree_tabs_startup_cd = 1

nnoremap <silent> <space>n :NERDTreeTabsToggle<cr>

"""
"" Config plugin airblade/vim-gitgutter
"
let g:gitgutter_max_signs = 1000
let g:gitgutter_sign_column_always = 1
let g:gitgutter_map_keys = 0
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0

"""
"" Config plugin itchyny/lightline.vim
"
let g:lightline = {
    \ 'enable': {
        \ 'statusline': 1,
        \ 'tabline': 1,
    \ },
\
    \ 'colorscheme': 'powerline',
    \ 'active': {
        \ 'left': [['mode', 'paste'], ['fugitive', 'filename']],
        \ 'right': [['syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
    \ },
    \ 'component_function': {
        \ 'fugitive': 'LightLineFugitive',
        \ 'filename': 'LightLineFilename',
        \ 'fileformat': 'LightLineFileformat',
        \ 'filetype': 'LightLineFiletype',
        \ 'fileencoding': 'LightLineFileencoding',
        \ 'mode': 'LightLineMode',
    \ },
    \ 'component_expand': {
    \ 'syntastic': 'SyntasticStatuslineFlag',
        \ },
    \ 'component_type': {
    \ 'syntastic': 'error',
        \ },
    \ 'subseparator': {'left': '|', 'right': '|'},
\
    \ 'tabline': {
        \ 'left': [['tabs']],
        \ 'right': [[]],
    \ },
    \ 'tab': {
        \ 'active': ['tabnum', 'filename', 'modified'],
        \ 'inactive': ['tabnum', 'filename', 'modified'],
    \ },
    \ 'tabline_subseparator': { 'left': '', 'right': '' },
\ }

function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? '' :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = ''  " edit here for cool mark
            let branch = fugitive#head()
            return branch !=# '' ? mark.branch : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

"""
"" Config plugin sjl/gundo.vim
"
let g:gundo_width            = 30
let g:gundo_preview_height   = 10
let g:gundo_preview_bottom   = 1
let g:gundo_right            = 0
let g:gundo_help             = 0
let g:gundo_map_move_older   = 'j'
let g:gundo_map_move_newer   = 'k'
let g:gundo_close_on_revert  = 0
let g:gundo_playback_delay   = 5
let g:gundo_return_on_revert = 1

noremap <space>g :GundoShow<cr>

"""
"" Config plugin ludovicchabant/vim-gutentags
"
let g:gutentags_enabled             = 1
let g:gutentags_auto_set_tags       = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new     = 1
let g:gutentags_generate_on_write   = 1
let g:gutentags_background_update   = 1
let g:gutentags_resolve_symlinks    = 0
let g:gutentags_tagfile             = g:vimrc.dir.var . 'tag/'
let g:gutentags_cache_dir           = g:vimrc.dir.var . 'plugin-cache/ludovicchabant/vim-gutentags/'
let g:gutentags_exclude             = [
\ ]

"""
"" Config plugin majutsushi/tagbar
"
let g:tagbar_left                  = 1
let g:tagbar_vartical              = 0
let g:tagbar_width                 = 25
let g:tagbar_autofocus             = 1
let g:tagbar_autoclose             = 0
let g:tagbar_zoomwidth             = 0
let g:tagbar_expand                = 0
let g:tagbar_singleclick           = 0

let g:tagbar_autopreview           = 0
let g:tagbar_previewwin_pos        = 'topleft'

let g:tagbar_compact               = 1
let g:tagbar_indent                = 1
let g:tagbar_sort                  = 0
let g:tagbar_foldlevel             = 99
let g:tagbar_autoshowtag           = 1
let g:tagbar_show_visibility       = 1
let g:tagbar_show_linenumbers      = 1
let g:tagbar_hide_nopublic         = 0
let g:tagbar_iconchars             = ['>', '|']

let g:tagbar_phpctags_bin          = g:vimrc.dir.var . 'plugin/tagbar-phpctags/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '512M'

noremap <space>v :TagbarToggle<cr>

"""
"" Config plugin thinca/vim-quickrun
"
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
    \ '_': {
        \ 'runner'                          : 'vimproc',
        \ 'runner/vimproc/sleep'            : 50,
        \ 'runner/vimproc/updatetime'       : 0,
        \ 'runner/vimproc/read_timeout'     : 100,
        \ 'outputter'                       : 'error',
        \ 'outputter/quickfix/errorformat'  : '&errorformat',
        \ 'outputter/quickfix/opencmd'      : 'copen',
        \ 'outputter/quickfix/into'         : 1,
        \ 'outputter/error/success'         : 'quickfix',
        \ 'outputter/error/error'           : 'quickfix',
        \ 'outputter/buffer/name'           : 'log.quickrun',
        \ 'outputter/buffer/filetype'       : 'quickrun',
        \ 'outputter/buffer/append'         : 0,
        \ 'outputter/buffer/split'          : ':botright 7sp',
        \ 'outputter/buffer/into'           : 1,
        \ 'outputter/buffer/running_mark'   : 'QuickRunning afap turtle, yo yo...',
        \ 'outputter/buffer/close_on_empty' : 1,
        \ 'hook/shebang/enable'             : 1,
        \ 'hook/output_encode/enable'       : 1,
        \ 'hook/output_encode/encoding'     : 'utf-8',
        \ 'hook/time/enable'                : 1,
        \ 'hook/time/format'                : "\n[QuickRun] %gsec",
        \ 'hook/time/dest'                  : '',
        \ 'hook/eval/enable'   : 0,
    \ },
    \ 'php': {
        \  'command'                  :  'php',
        \  'cmdopt'                   :  '',
        \  'exec'                     :  '%c %o -f %s',
        \  'hook/eval/template'       :  '<?php %s',
    \ },
\ }

nnoremap gf :QuickRun -mode n<cr>
vnoremap gf :QuickRun -mode v<cr>
nnoremap gr
    \ :let b:quickrun_config = {
        \ 'hook/eval/enable': 1,
    \ }<cr>
    \ V:QuickRun -mode v<cr>
    \ :unlet b:quickrun_config<cr>

noremap <expr><silent> <c-c> quickrun#is_running() ? quickrun#sweep_sessions() : '\<c-c>'

"""
"" Config plugin nathanaelkane/vim-indent-guides
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors           = 0
let g:indent_guides_indent_levels         = 30
let g:indent_guides_color_change_percent  = 10
let g:indent_guides_guide_size            = 1
let g:indent_guides_start_level           = 2
let g:indent_guides_space_guides          = 1
let g:indent_guides_tab_guides            = 0
let g:indent_guides_soft_pattern          = '\s'


"""
"" Config plugin xolox/vim-session
" 
let g:session_directory      = g:vimrc.dir.var . 'session/save/'
let g:session_autosave_to    = g:vimrc.dir.var . 'session/autosave/'
let g:session_lock_directory = g:vimrc.dir.var . 'session/lock/'
let g:session_default_name = '.default.vim'
let g:session_extension = '.vim'
let g:session_default_overwrite = 0
let g:session_lock_enabled = 1
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 0
let g:session_verbose_messages = 0
let g:session_default_to_last = 0
let g:session_persist_font = 0
"let g:session_persist_globals =
"let g:session_restart_environment =
let g:session_command_aliases = 1
let g:session_menu = 1
"let g:session_name_suggestion_function =

noremap ,asdfr :RestartVim<cr>

"""
"" Config plugin joonty/vdebug
"
let g:vdebug_options= {
    \ 'port' : 9000,
    \ 'server' : '',
    \ 'timeout' : 600,
    \ 'on_close' : 'detach',
    \ 'break_on_open' : 1,
    \ 'ide_key' : '',
    \ 'path_maps' : {
        \ '/media/sf_www': 'C:/-/var/www',
    \ },
    \ 'debug_window_level' : 0,
    \ 'debug_file_level' : 0,
    \ 'debug_file' : '',
    \ 'watch_window_style' : 'expanded',
    \ 'marker_default' : '⬦',
    \ 'marker_closed_tree' : '▸',
    \ 'marker_open_tree' : '▾',
\ }

"""
"" Config plugin scrooloose/syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_loc_list_height          = 5

let g:syntastic_check_on_open          = 1
let g:syntastic_check_on_wq            = 1
let g:syntastic_aggregate_errors       = 1
let g:syntastic_id_checkers            = 1
let g:syntastic_sort_aggregated_errors = 1

let g:syntastic_echo_current_error  = 1
let g:syntastic_enable_signs        = 1
let g:syntastic_enable_balloons     = 1
let g:syntastic_enable_highlighting = 1

let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': ['php'],
\ }
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '
    \ -wevvv
    \ --colors
    \ --standard=psr2
    \ --warning-severity=0
    \ '
let g:syntastic_php_phpmd_post_args = 'codesize,design,unusedcode'

"""
"" Config plugin tyru/open-browser.vim
"
let g:openbrowser_use_vimproc                 = 1
let g:openbrowser_force_foreground_after_open = 0

command! OpenBrowserCurrent execute 'OpenBrowser' 'file:///' . expand('%:p:gs?\\?/?')

"""
"" Config plugin t9md/vim-quickhl
"
let g:quickhl_manual_enable_at_startup = 0
let g:quickhl_cword_enable_at_startup  = 0
let g:quickhl_tag_enable_at_startup    = 0

map -t <plug>(quickhl-cword-toggle)
map -a <Plug>(quickhl-manual-this)
map -r <plug>(quickhl-manual-reset)

"""
"" Config plugin alvan/vim-php-manual
"
let g:php_manual_online_search_shortcut = '<c-p><c-p>'

"""
"" Config plugin junegunn/vim-easy-align'
"
map ga <plug>(EasyAlign)

"""
"" Config plugin scrooloose/nerdcommenter
"
map <c-c><c-c> <plug>NERDCommenterToggleComment
map <c-c><c-n> <plug>NERDCommenterNestedComment
map <c-c><c-m> <plug>NERDCommenterMinimalComment
map <c-c><c-s> <plug>NERDCommenterSexyComment

"""
"" Config plugin mattn/emmet-vim
"
let g:emmet_html5 = 1
let g:user_emmet_install_global = 1
let g:user_emmet_mode = 'nvi'

map <c-e><c-e> <plug>(emmet-expand-abbr)
imap <c-e><c-e> <plug>(emmet-expand-abbr)
map <c-e><c-w> <plug>(emmet-expand-word)
imap <c-e><c-w> <plug>(emmet-expand-word)
map <c-e><c-t> <plug>(emmet-update-tag)
imap <c-e><c-t> <plug>(emmet-update-tag)
map <c-e><c-i> <plug>(emmet-balance-tag-inward)
imap <c-e><c-i> <plug>(emmet-balance-tag-inward)
map <c-e><c-o> <plug>(emmet-balance-tag-outward)
imap <c-e><c-o> <plug>(emmet-balance-tag-outward)
map <c-e><c-n> <plug>(emmet-move-next)
imap <c-e><c-n> <plug>(emmet-move-next)
map <c-e><c-p> <plug>(emmet-move-prev)
imap <c-e><c-p> <plug>(emmet-move-prev)
"nmap <c-e><c-z> <plug>(emmet-image-size)
"nmap <c-e><c-5> <plug>(emmet-toggle-comment)
"nmap <c-e><c-s> <plug>(emmet-split-join-tag)
"nmap <c-e><c-r> <plug>(emmet-remove-tag)
"nmap <c-e><c-u> <plug>(emmet-anchorize-url)
"nmap <c-e><c-s> <plug>(emmet-anchorize-summary)
"nmap <c-e><c-m> <plug>(emmet-merge-lines)
"nmap <c-e><c-q> <plug>(emmet-code-pretty)

"""
"" Config plugin thinca/vim-fontzoom
"
noremap -i :Fontzoom<space>+1<cr>
noremap -o :Fontzoom<space>-1<cr>
noremap -u :Fontzoom!<cr>

"""
"" Config plugin osyo-manga/vim-over
"
let g:over_enable_auto_nohlsearch                    = 1
let g:over_enable_cmd_window                         = 1
let g:over_command_line_prompt                       = '> '
let g:over_command_line_key_mappings                 = {}
let g:over#command_line#search#enable_incsearch      = 1
let g:over#command_line#search#enable_move_cursor    = 0
let g:over#command_line#paste_escape_chars           = '\.*$^~()[]{}'
let g:over#command_line#paste_filters                = {
    \ '\n': '\\n',
    \ '\r': '\\r',
\ }
let g:over#command_line#substitute#highlight_pattern = 'Search'
let g:over#command_line#substitute#highlight_string  = 'Error'
let g:over#command_line#enable_Digraphs              = 1

noremap gs :OverCommandLine<cr>%s/

"""
"" Config plugin mattesgroeger/vim-bookmarks
"
let g:bookmark_sign                    = 'B'
let g:bookmark_annotation_sign         = 'B'
let g:bookmark_save_per_working_dir    = 0
let g:bookmark_manage_per_buffer       = 0
let g:bookmark_auto_save               = 1
let g:bookmark_auto_save_file          = g:vimrc.dir.var . 'plugin-cache/mattesgroeger/vim-bookmarks/bookmarks'
let g:bookmark_auto_close              = 0
let g:bookmark_center                  = 1
let g:bookmark_show_warning            = 0
let g:bookmark_highlight_lines         = 0
let g:bookmark_no_default_key_mappings = 1

noremap gb :BookmarkToggle<cr>
noremap gn :BookmarkNext<cr>
noremap gp :BookmarkPrev<cr>
noremap gt :BookmarkShowAll<cr>
noremap gx :BookmarkClearAll<cr>

"""
"" Config plugin yonchu/accelerated-smooth-scroll
"
let g:ac_smooth_scroll_no_default_key_mappings = 1
let g:ac_smooth_scroll_visualmode_key_mappings = 1
let g:ac_smooth_scroll_enable_accelerating     = 1
let g:ac_smooth_scroll_disable_relativenumber  = 1
let g:ac_smooth_scroll_du_sleep_time_msec      = 0
let g:ac_smooth_scroll_fb_sleep_time_msec      = 0
let g:ac_smooth_scroll_min_limit_msec          = 0
let g:ac_smooth_scroll_max_limit_msec          = 1000

map <c-f> <plug>(ac-smooth-scroll-c-f)
map <c-b> <plug>(ac-smooth-scroll-c-b)
map <c-u> <plug>(ac-smooth-scroll-c-u)
map <c-d> <plug>(ac-smooth-scroll-c-d)

"""
"" Config plugin AndrewRadev/splitjoin.vim
"
let g:splitjoin_normalize_whitespace = 1
let g:splitjoin_trailing_comma       = 1
let g:splitjoin_ruby_trailing_comma  = 1

"""
"" Config plugin 'kurocode25/mdforvim'
"
let g:previm_open_cmd = 'firefox'

"""
"" Config plugin KabbAmine/vCoolor.vim
"
"let g:vcoolor_map          = ''
"let g:vcoolor_ins_rgb_map  = ''
"let g:vcoolor_ins_rgba_map = ''
"let g:vcoolor_ins_hsl_map  = ''

"""
"" Config built-in plugin 2html.vim
"
let use_xhtml         = 0
let html_use_encoding = 'utf-8'
let html_use_css      = 1
let html_no_pre       = 0
let html_number_lines = 1
