if 0 | endif

" 一旦ファイルタイプ関連を無効化する
filetype off
let mapleader = "\<Space>"
""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'jacoborus/tender.vim'


" sessionを保存
NeoBundle 'xolox/vim-session', {
      \ 'depends' : 'xolox/vim-misc',
  \ }


" Qfreplace 使用
NeoBundle "thinca/vim-qfreplace"

" " ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" " Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'jistr/vim-nerdtree-tabs'
"ファイルビューア
NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends' : ["Shougo/unite.vim"],
  \ 'autoload' : {
  \   'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
  \   'mappings' : ['<Plug>(vimfiler_switch)'],
  \   'explorer' : 1,
  \ }}


" vimfiler {{{
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:unite_kind_file_use_trashbox = 1
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=10 -no-quit -toggle<CR>
" }}}
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
autocmd FileType vimfiler nmap <buffer> ll <Plug>(vimfiler_cd_or_edit)
function! UniteFileCurrentDir()
  let s  = ':Unite file_rec -start-insert -path='
  let s .= vimfiler#helper#_get_file_directory()

  execute s
endfunction

autocmd FileType vimfiler nnoremap <silent> <buffer> <expr>/ vimfiler#do_switch_action('rec/async')
autocmd FileType vimfiler nnoremap <silent> <buffer> <expr>ff vimfiler#do_switch_action('find')
autocmd FileType vimfiler nnoremap <silent> <buffer> <expr>gg vimfiler#do_switch_action('grep')
autocmd FileType vimfiler nnoremap <silent> <buffer> <expr>v vimfiler#do_switch_action('vsplit')
autocmd FileType vimfiler nnoremap <silent> <buffer> <expr>s vimfiler#do_switch_action('split')
autocmd FileType vimfiler nnoremap <silent> <buffer> <expr>tt vimfiler#do_switch_action('tabopen')

nnoremap <silent><C-e> :VimFilerExplor -winwidth=35 <CR>
:command! -nargs=* Vf VimFilerExplor <args>
:command! -nargs=* Vs VimFiler ssh://<args>

NeoBundle 'Shougo/unite-ssh'

"シンタックス
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby','php', 'javascript'],
                           \ 'passive_filetypes': [] }
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_css_checker = "csslint"
let g:syntastic_javascript_checker = 'jshint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'nathanaelkane/vim-indent-guides'

"括弧を自動的に閉じる
NeoBundle 'Townk/vim-autoclose'

NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"

" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'
" 行末の半角スペースを可視化
"NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'violetyk/cake.vim'

"vim に非同期処理
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/vimshell.vim'
"強力な補完機能
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 2
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 10000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}


"ヤンク履歴を保持
NeoBundle 'LeafCage/yankround.vim'

" 編集履歴管理
NeoBundle "sjl/gundo.vim"

" ブラウザ自動更新
NeoBundle 'tell-k/vim-browsereload-mac'
" vim-browsereload-mac{{{
let g:returnApp = "iTerm2"

" }}}


"超高速で簡単な移動
" NeoBundle 'Lokaltog/vim-easymotion'

"シンタックス
NeoBundle 'rcmdnk/vim-markdown'
" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

"カーソル移動機能を拡張
" NeoBundle 'tpope/vim-surround'
 NeoBundle 'vim-scripts/matchit.zip'
" NeoBundle 'vimtaku/hl_matchit.vim.git'

let b:match_words = '<:>,<div.*>:</div>'
let b:match_words = "if:endif,foreach:endforeach,\<begin\>:\<end\>"

let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'

"単語を調べる
NeoBundle 'tyru/open-browser.vim'

"ステータスバーをカラフル
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename':  'LightLineFilename',
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
"emmet
NeoBundle 'mattn/emmet-vim'
" emmet {{{
let g:use_emmet_complete_tag = 1
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
        \ 'lang' : 'ja',
        \ 'html' : {
        \   'filters' : 'html',
        \ },
        \ 'css' : {
        \   'filters' : 'fc',
        \ },
        \ 'php' : {
        \   'extends' : 'html',
        \   'filters' : 'html',
        \ },
        \}
" }}}

" " Python
" NeoBundleLazy "davidhalter/jedi-vim", {
"   \ "autoload": {
"   \   "filetypes": ["python", "python3", "djangohtml"],
"   \ },
"   \ "build" : {
"   \   "mac"  : "pip install jedi",
"   \   "unix" : "pip install jedi",
"   \ }}
" " jedi-vim {{{
" let g:jedi#rename_command = '<Leader>R'
" let g:jedi#goto_assignments_command = '<Leader>G'
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" " }}}
"
" " html
"
" NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'othree/html5.vim'

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

"
" " javascript
" NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'moll/vim-node'
" NeoBundle 'pangloss/vim-javascript'
"
"コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" dash
NeoBundle 'rizzatti/dash.vim'

" dash.vim {{{
nmap <Leader>d <Plug>DashSearch
" }}}

call neobundle#end()
" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""
set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
"undo情報保持
set undofile
set undodir=~/.undo

set nowrap

set backspace=2
set modelines=0        " CVE-2007-2438
"新しい行のインデントを現在行と同じにする

"インクリメンタルサーチ設定
set incsearch


"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" 改行時に前の行のインデントを継続する
set smartindent
" 外部grepに使うプログラム設定
set grepprg=ag\ -a

set ignorecase
set smartcase

"クリップボードコピーを有効
set clipboard=unnamed
" タグファイルの指定
set tags=./tags;,tags;
" スワップファイルは使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定
set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する
set browsedir=buffer
" 検索結果をハイライト表示する
set hlsearch
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

"不可視文字の表示
set list
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" コマンドのヒストリー数
set history=1000

autocmd FileType text setlocal textwidth=0
" 構文毎に文字色を変化させる
syntax on:
"set synmaxcol=200

"行を強調表示
hi clear CursorLine
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
           setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

set lazyredraw
set ttyfast

 set timeout timeoutlen=200 ttimeoutlen=75

"行番号の色
autocmd ColorScheme * highlight LineNr ctermfg=247
hi CursorLineNr term=NONE cterm=NONE ctermfg=247


" カラースキーマの指定
"colorscheme molokai
colorscheme tender

:command! Tr NERDTree
:command! Qr Qfreplace
:command! Vsh VimShell
:command! Gu GundoToggle
:command! Uc UniteClose
:command! -bar Cr silent ChromeReload
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
:command! Ws w !sudo tee > /dev/null %
"差分
command! DiffOrigcmp vert new | set bt=nofile | r # | -1d_ | diffthis | wincmd p | diffthis
:command! Df DiffOrig
"キーマップ設定
nnoremap <silent><leader>q :bp<cr>:bd #<cr>
nnoremap <silent><Leader>s :sp<CR><C-W><C-W>:VimShell<CR>

"tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>


"バッファ切り替え
noremap <silent>fh :bp<CR>
noremap <silent>fl :bn<CR>
noremap <silent>fj <C-^>

"分割ウィンドウ内の移動
noremap <silent>zl <C-w>l
noremap <silent>zh <C-w>h
noremap <silent>zk <C-w>k
noremap <silent>zj <C-w>j
noremap <silent>zb <C-W>J
noremap <silent>zv <C-W>H
noremap <silent><Tab> <C-w><C-w>
noremap <silent><S-Tab> <C-w>W

"ノーマルモードへ
inoremap jj  <Esc>

" vを二回で行末まで選択
vnoremap v $h


"保存
noremap <Leader>w :w<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

"カーソル行ハイライト
nnoremap <silent><Leader><Leader> "zyiw:let @/ = '\<' . @z . '\>' <CR>:set hlsearch<CR>
vnoremap <silent><Leader><Leader> "zy:let @/ =  @z <CR>:set hlsearch<CR>

"カーソル下の単語をハイライトしてから置換
nmap <Leader>h <Leader><Leader>:%s/<C-r>///gIc<Left><Left><Left><Left>
vnoremap  <Leader>h "zy:let @/ =  @z <CR>:set hlsearch<CR>%s/<C-r>///gIc<Left><Left><Left><Left>

nmap h<Leader> :%s/<C-r>///gIc<Left><Left><Left><Left>
vnoremap h<Leader> :s/<C-r>///gIc<Left><Left><Left><Left>

"ノーマルモードで改行
nnoremap z<CR> i<CR><ESC>
nnoremap za<CR> a<CR><ESC>

"コマンドラインにフルパスを表示
nnoremap <C-g> 1<C-g>

"ハイライト消去
nnoremap <silent> <esc><esc> :<C-u>nohlsearch<CR><C-l>

"カーソル上の単語を置き換え
nnoremap <silent> cc yiw
nnoremap <silent> cp ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ce <C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> ce c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"home,end
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

noremap <S-A> <S-g>$vgg



noremap x "_x
nnoremap s "_s


noremap xx <S-v>"_x



"日本語対応
"日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
inoremap <silent> っj <ESC>

vnoremap > >gv
vnoremap < <gv


" yankround.vim {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap pp <Plug>(yankround-prev)
nmap nn <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader>y :<C-u>Unite yankround<CR>
"}}}


" " vim-easymotion {{{
" let g:EasyMotion_do_mapping = 0
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)
" omap z <Plug>(easymotion-s2)
" nmap g/ <Plug>(easymotion-sn)
" xmap g/ <Plug>(easymotion-sn)
" omap g/ <Plug>(easymotion-tn)
" let g:EasyMotion_smartcase = 1
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" let g:EasyMotion_startofline = 0
" let g:EasyMotion_keys = 'QZASDFGHJKL;'
" let g:EasyMotion_use_upper = 1
" let g:EasyMotion_enter_jump_first = 1
" " }}}

"カーソルの形状を変える
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    " 保存時にtabを4スペースに変換する
    %s/\t/    /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_limit = 200
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-L> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-N> :Unite file_mru<CR>
" タブ一覧
noremap <C-T> :Unite tab<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-H> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-H> unite#do_action('vsplit')

function! OpenFileFromNowPath(filename)
    let path=expand("%:p:h")."/"
    execute ":call system('open ".path.a:filename."')"
endfunction

au FileType unite nnoremap <silent> <buffer> <expr> <C-G> unite#do_action('start')
au FileType unite inoremap <silent> <buffer> <expr> <C-G> unite#do_action('start')



" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


:command! Ub UniteWithBufferDir -buffer-name=files file file/new
" レジスタ一覧
:command! Ur Unite register
" グレップ検索
nnoremap <silent><Leader>g :<C-u>Ggrep <C-r><C-w><CR>

nnoremap <silent><Leader>f :<C-u>UniteWithCursorWord file_mru<CR>

" グレップ検索
:command! Ug Unite grep -buffer-name=grep-search -no-quit -no-wrap
" すべてのソースを表示
:command! Us :Unite source
" アウトラインを展開
:command! Uo Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit
"シンタックスエラーを表示
:command! Ue Unite location_list
"ファイル検索
let g:unite_source_find_default_expr="-iname "
nnoremap <silent>FF :<C-u>UniteWithCursorWord find:. -buffer-name=serch-file<CR>
:command! Uf Unite find
:command! Ufa Unite find:. -buffer-name=serch-file -no-quit


""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
 call smartinput_endwise#define_default_rules()

"""辞書ファイル
  autocmd BufNewFile,BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
  autocmd BufNewFile,BufRead *.html|*.htm :set dictionary=~/.vim/dict/html.dict filetype=html
  autocmd BufNewFile,BufRead *.css :set dictionary=~/.vim/dict/css.dict filetype=css
  autocmd BufNewFile,BufRead *.js :set dictionary=~/.vim/dict/jquery.dict filetype=javascript
  autocmd BufNewFile,BufRead *.js :set dictionary=~/.vim/dict/javascript.dict filetype=javascript
" "
" "
" " autocmd FileType php set makeprg=php\ -l\ %
"
 let php_htmlInStrings=1


"-------------------------------------------------
""" neocomplete設定
"-------------------------------------------------
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


"-------------------------------------------------
""" neosnippet設定
"-------------------------------------------------
"" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <TAB>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"  imap <expr><TAB>
"  \ neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
"  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"



let g:neosnippet#enable_snipmate_compatibility = 1
"set snippet file dir
let g:neosnippet#snippets_directory='~/dotfiles/.vim/snippets'



"https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
"""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=gray gui=none ctermfg=darkred ctermbg=white cterm=none'
"
" if has('syntax')
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * call s:StatusLine('Enter')
" autocmd InsertLeave * call s:StatusLine('Leave')
" augroup END
" endif
"
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
"     if a:mode == 'Enter'
"         silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"         silent exec g:hi_insert
"     else
"         highlight clear StatusLine
"         silent exec s:slhlcmd
"     endif
" endfunction
"
" function! s:GetHighlight(hi)
"     redir => hl
"     exec 'highlight '.a:hi
"     redir END
"     let hl = substitute(hl, '[\r\n]', '', 'g')
"     let hl = substitute(hl, 'xxx', '', '')
"     return hl
" endfunction
""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

"ハイライト設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" "インデント
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level =2


" 現在のディレクトリ直下の .vimsessions/ を取得
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')

" 存在すれば
if isdirectory(s:local_session_directory)
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vimを辞める時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 5
  let g:session_autosave_silent = 1
else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endif
unlet s:local_session_directory

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

filetype on

