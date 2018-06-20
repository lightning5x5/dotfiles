" 文字コードの設定
set encoding=utf-8
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" □や○文字が崩れる問題を解決
set ambiwidth=double
" 行数を表示する
set number
set backspace=indent,eol,start
" ヤンクした時にクリップボードにコピーする
set clipboard=unnamed,autoselect

" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" smartindentで増減する幅
set shiftwidth=4

" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" C-vの短形選択で行末より後ろにもカーソルを置ける
set virtualedit=block

" 保存時にカーソルが飛ばないようにする
function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末のスペースを削除する
    %s/\s\+$//ge
    " 保存時にtabを4スペースに変換する
    %s/\t/    /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" ステータス行の非表示
set laststatus=0


" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

" vim-operator-flashy
" map y <Plug>(operator-flashy)
" nmap Y <Plug>(operator-flashy)$
":h g:operator#flashy#group
" hi Flashy guibg=white

" vim-anzu
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}

" vim-plug
call plug#begin('~/.vim/plugged')
source ~/plugins.vim
call plug#end()
