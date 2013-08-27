set nocompatible                " be iMproved
filetype off                   " required!

set ruler
set showcmd
set cindent
set nu
set smartindent
set splitbelow
set splitright
set shiftwidth=4
set fileencoding=utf-8
set tenc=utf-8
set tabstop=8
set sts=4
set expandtab
syntax on

" 현재 working directory로 cd
" "set autochdir
" :lc %:p:h 해도 됨
"
" "backspace 사용 가능
set bs=indent,eol,start
" set paste, set nopaste를 Insert 키로
" set pastetoggle=<Ins>
"
" " 대소문자 무시하고 찾기 /\cfoo 해도 foo를 무시하고 찾는다.
" " 대문자 C로 해서 /\Cfoo 하면 대소문자 구분>해서 >찾음.
"set ic  "set ignorecase
"
highlight Comment term=bold cterm=bold ctermfg=4
highlight Directory term=bold cterm=bold ctermfg=4

set fencs=ucs-bom,utf-8,cp94,euc-kr.latin1
colorschem desert

" 주석이 어두워서 잘 안 보일 때(2가지 방법)
"   1: colorscheme torte
"   2: hi Comment cterm=bold
" 다시 어둡게 만드려면
"   :hi Comment cterm=none
highlight Comment term=bold cterm=bold ctermfg=4
highlight Directory term=bold cterm=bold ctermfg=4
"
" 주석컬러 원래대로
" map <F10> :colorscheme default<CR>:hi LineNr ctermfg=DarkGray<CR>
" 주석만 잘 밝게 하려면 :hi Comment ctermfg=blue
map <F10> :hi Comment ctermfg=blue<CR>
" 블록 폴딩 기능을 기록
" set fdm=marker
" 폴딩 기능 단축키
" zf : 폴드 생성하기
" zo : 닫혀있는 폴드 열기
" zR : 현재 문서의 모든 폴드 열기
" zc : 폴드 닫기
" zM : 현재 문서의 모든 폴드 닫기
" zd : 현재 위치의 폴드 삭제하기
" zE : 현재 문서의 모든 폴드 삭제
" zD : 현재 위치의 겹쳐진 폴드 삭제
"
"
" 파일을 열 때, 마지막 커서가 있었던 위치로 이동
if has("autocmd")
     autocmd BufReadPost *
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" 파일을 열 때, 현재 열린 버퍼의 파일 디렉토리로 이동
" autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/
"
" tab 기능
map te :tabedit<SPACE>
map th :tabp<CR>
map tl :tabn<CR>
map tm :tabm
"
" 홈디렉토리/.vim/plugin/NERD_tree.vim 에 NERD_tree.vim 설치해야 함
" (http://www.vim.org/scripts/script.php?script_id=1658)
map <F8> :NERDTree<CR>
" default 는 31
"let NERDTreeWinSize=30
"
map <F7> :b#<CR>
"
" 전체 선택
map <F12> ggVG
map <F9> :lc %:p:h<CR>
"
" " 블록으로 잡은 라인을 // 로 주석 처리 (block comment는 "
"$HOME/.vim/plugin/BlockComment 참조)
" map ,c :s/^/\/\//g<CR>:noh<CR>
" map ,uc :s/^\/\///g<CR>:noh<CR>
" indent 유지해주며 comment, uncomment
map ,c :s/^\(\s\)/\1\/\/ /<CR>:noh<CR>
map ,uc :s/^\(\s\)\/\/ /\1/<CR>:noh<CR>
"
" " 줄여 쓰기 기능 (abbrebiation)
" "ab log Log::writelog();<ESC>hi

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:

Bundle 'emmet-vim'

Bundle 'klen/python-mode'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'The-NERD-tree'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"
"python configuration

augroup vimrc_autocmds
    autocmd!
    "highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
"language en_US.UTF-8
""let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
""set guifont=Consolas\ for\ Powerline\ FixedD:h9
"let g:Powerline_symbols="fancy"

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator
" modes)
let g:pymode_rope = 1

" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
"
" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
"
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" ctags, cscope 설정
" set
" tags=./tags,/home/lancho/go/src/pkg/tags,/home/lancho/go/src/cmd/tags,/home/lancho/gopath/src/tags
" "set
" tags=./tags,/home/lancho/go_r/src/tags,/home/lancho/gosrc/google_appengine/goroot/src/pkg/tags
" "set
" tags=./tags,/usr/include/tags,/usr/local/src/gmime/gmime2.2-2.2.11/tags,/usr/include/glib-2.0/tags
" "cs add /usr/include/cscope.out
" "cs add /usr/local/src/gmime/gmime2.2-2.2.11/cscope.out
" "cs add /usr/include/glib-2.0/cscope.out
" "set
" path+=.,include,/usr/include/**,/usr/include/glib-2.0/**,/usr/local/src/gmime/gmime2.2-2.2.11/**
" set path+=./**
"
"
" " cscope를 쓸 때, /tmp/cscope.* 파일들이 계속 생겨 vim을 종료할 때 삭제하기
" if has("autocmd")
"     "autocmd VimLeave * !rm -rf /tmp/cscope.*
"     endif
"
"     "탭 바로가기 (이건 왜 안되지??)
"     "map <M-1> 1gt
"     "map <M-1> <ESC>:tabn 1<CR>
"
"
"     """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 기타
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 이런식의 키보드 조합을 만들 수 있다.
" "map <C-t><left> :tabp<CR>
"
" imap <C-b> <Left>
" imap <C-f> <Right>
" "map 1 $ "1로 $과 같이 라인 제일 뒤로 가기
" imap jf <ESC>
" set nows " 검색시 파일 끝에서 처음으로 되돌리기 안함
" "set title "타이틀에 파일 제목 보여줌
"
"
" "위자드웍스 임시
" inoremap *som     * 솜클라우드[Web][]<Left>
"
" "inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" "inoremap {{     {
" "inoremap {}     {}
" "inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>"
" : "}"
"
" "inoremap (      ()<Left>
" "inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>"
" : ")"
" "inoremap [      []<Left>
" "inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>"
" : "]"
"
" "imap ,/ </<C-X><C-O>
"
"
" set nocompatible
" filetype off
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
"
" Bundle 'gmarik/vundle'
"
" Bundle 'emmet-vim'
"
" Bundle 'https://github.com/Lokaltog/vim-powerline.git'
" "language en_US.UTF-8
" "let g:Powerline_symbols = 'fancy'
" "set encoding=utf-8
" "set guifont=Consolas\ for\ Powerline\ FixedD:h9
" "let g:Powerline_symbols="fancy"
"
"
" "For Go
" set rtp+=$GOROOT/misc/vim
" filetype plugin indent on
" syntax on "Go는 syntax on이 마지막에 와야함(/etc/vim/vimrc 주의)
" au BufReadPre,BufNewFile *.go setlocal filetype=go fileencoding=utf-8
" fileencodings=utf-8 fileformat=unix noet ts=8 sw=8 sts=0
" "그냥 map부터 해도 되는데 autocmd가 왜 들어가야하는지 모르겠음
" autocmd FileType go map <F5> :w<CR>:!clear && go run %<CR>
" autocmd FileType go map <C-F5> :w<CR>:!clear && go build && ls -l<CR>
"
