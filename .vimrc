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

" " ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" " Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
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
let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
" }}}



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
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

"ヤンク履歴を保持
NeoBundle 'LeafCage/yankround.vim'

" 編集履歴管理
NeoBundle "sjl/gundo.vim"

"超高速で簡単な移動
" NeoBundle 'Lokaltog/vim-easymotion'

"シンタックス
NeoBundle 'rcmdnk/vim-markdown'
" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

"カーソル移動機能を拡張
" NeoBundle 'tpope/vim-surround'
" NeoBundle 'vim-scripts/matchit.zip'

"単語を調べる
NeoBundle 'tyru/open-browser.vim'

" open-browser {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
" }}}

NeoBundle 'rizzatti/dash.vim'

" dash.vim {{{
nmap <Leader>d <Plug>DashSearch
" }}}

"emmet
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload' : {
  \   'filetypes' : ['html', 'html5', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
  \   'commands' : ['<Plug>ZenCodingExpandNormal']
  \ }}
" emmet {{{
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \ 'html' : {
  \   'indentation' : '  '
  \ }}
" }}}

" Python
NeoBundleLazy "davidhalter/jedi-vim", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"],
  \ },
  \ "build" : {
  \   "mac"  : "pip install jedi",
  \   "unix" : "pip install jedi",
  \ }}
" jedi-vim {{{
let g:jedi#rename_command = '<Leader>R'
let g:jedi#goto_assignments_command = '<Leader>G'
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" }}}

" html

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'

" javascript
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()
" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
"undo情報保持
set undofile
set undodir=~/.undo

set nowrap 

set backspace=2
set modelines=0		" CVE-2007-2438
"新しい行のインデントを現在行と同じにする
set autoindent

"インクリメンタルサーチ設定
set incsearch

"タブ文字、行末など不可視文字を表示
"set list

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4


set ignorecase
set smartcase

"クリップボードコピーを有効
set clipboard=unnamed
" タグファイルの指定
set tags=~/.tags
" スワップファイルは使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
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
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

"set list
" インデント
" タブと行の続きを可視化する
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

autocmd FileType text setlocal textwidth=0
" 構文毎に文字色を変化させる
syntax on:


"行を強調表示
set cursorline
set lazyredraw
set ttyfast

set timeout timeoutlen=200 ttimeoutlen=75

"行番号の色
autocmd ColorScheme * highlight LineNr ctermfg=247

" カラースキーマの指定
"colorscheme molokai
colorscheme tender

:command Tr NERDTree
:command Vsh VimShell
:command Gu GundoToggle
:command Vf VimFilerExplore
"差分
command DiffOrigcmp vert new | set bt=nofile | r # | -1d_ | diffthis | wincmd p | diffthis
:command Df DiffOrig
"キーマップ設定

nnoremap <silent><C-e> :NERDTree<CR>
 
nnoremap <silent><leader>q :bp<cr>:bd #<cr>
nnoremap <silent><Leader>s :sp<CR><C-W><C-W>:VimShell<CR>
nnoremap <silent><Leader>@ viwy

noremap <silent>f<left> :bp<CR>
noremap <silent>f<right> :bn<CR>
noremap <silent>q<right> <C-w>l
noremap <silent>q<left> <C-w>h
noremap <silent>q<up> <C-w>k
noremap <silent>q<down> <C-w>j

"保存
noremap <Leader>w :w<CR>


"カーソル行ハイライト
nnoremap <silent><Leader><Leader> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

"カーソル下の単語をハイライトしてから置換
nmap <Leader>h <Space><Space>:%s/<C-r>///g<Left><Left>


"カーソル下の単語をハイライトしてから検索
nmap <Leader>f :/<C-r>/

"ハイライト消去
nnoremap <silent> <Leader><esc> :<C-u>nohlsearch<CR><C-l>

nnoremap <silent> cy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cc   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cc   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

map <C-A> <S-g>$vgg
map! <C-A> <Esc><S-g>$vggi


noremap x "_x
nnoremap s "_s

" yankround.vim {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <S-p> <Plug>(yankround-prev)
nmap <S-n> <Plug>(yankround-next)
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



" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
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
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


:command Uc UniteWithBufferDir -buffer-name=files file file/new
" レジスタ一覧
:command Ur Unite register
" グレップ検索
nnoremap <silent><Leader>g :<C-u>UniteWithCursorWord grep -buffer-name=grep-search -no-quit -no-wrap<CR>
" グレップ検索
:command Ug Unite grep -buffer-name=grep-search -no-quit -no-wrap
" すべてのソースを表示
:command Us :Unite source
" アウトラインを展開
:command Uo Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit
"シンタックスエラーを表示
:command Ue Unite location_list
"ファイル検索  
let g:unite_source_find_default_expr="-iname "
nnoremap <silent>FF :<C-u>Unite find<CR> 
:command Uf Unite find
:command Ufa Unite find:. -buffer-name=serch-file -no-quit


" ブックマークを最初から表示
let g:NERDTreeShowBookmarks=1

" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" デフォルトでツリーを表示させる
"let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
    " autocmd vimenter * NERDTree|normal gg3j
endif
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""

"call smartinput_endwise#define_default_rules()

"-------------------------------------------------
""" neocomplcache設定
"-------------------------------------------------
"""辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'


autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

"-------------------------------------------------
""" neosnippet設定
"-------------------------------------------------
"" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
set conceallevel=2 concealcursor=i
endif

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=gray gui=none ctermfg=darkred ctermbg=white cterm=none'

if has('syntax')
augroup InsertHook
autocmd!
autocmd InsertEnter * call s:StatusLine('Enter')
autocmd InsertLeave * call s:StatusLine('Leave')
augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
if a:mode == 'Enter'
silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
silent exec g:hi_insert
else
highlight clear StatusLine
silent exec s:slhlcmd
endif
endfunction

function! s:GetHighlight(hi)
redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
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

"インデント
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2



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

