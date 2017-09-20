if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on


"ここまでNeoBundleの設定
if has("mouse") " Enable the use of the mouse in all modes
  set mouse=a
endif

"vimのテーマ設定
syntax enable
set background=light
colorscheme lucius
"colorscheme solarized

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set backspace=2 "バックスペースを、空白、行末、行頭でも使えるようにする
set ambiwidth=double "文脈によって解釈が異なる全角文字の幅を、2に固定する
set tabstop=4 "タブ幅をスペース4つ分にする
set expandtab "tabを半角スペースで挿入する
set shiftwidth=4 "vimが自動で生成する（読み込み時など）tab幅をスペース4つ文にする
set smartindent "改行時などに、自動でインデントを設定してくれる
set list "空白文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% 
set nrformats-=octal ""0"で始まる数値を、8進数として扱わないようにする
set hidden "ファイルの保存をしていなくても、べつのファイルを開けるようにする
set virtualedit=block "文字のないところにカーソル移動できるようにする
set whichwrap=b,s,[,],<,> "カーソルの回り込みができるようになる
set backspace=indent,eol,start "バックスペースを、空白、行末、行頭でも使えるようにする
set wildmenu "ファイル名補完を有効
