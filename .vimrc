set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ==============================================================================
" 安装的所有插件
call vundle#begin()

" 必须安装，let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 来自github

Plugin 'w0rp/ale'

Plugin 'majutsushi/tagbar'

"高亮
Plugin 'digitaltoad/vim-pug'

"ts 高亮
Plugin 'leafgarland/typescript-vim'

"主题
Plugin 'flazz/vim-colorschemes'

" check
Plugin 'scrooloose/syntastic'

"底部状态栏
Plugin 'Lokaltog/vim-powerline'

"文件目录
Plugin 'scrooloose/nerdtree'
"快速查找
Plugin 'kien/ctrlp.vim'

"快速注释
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'

"自动补全
Plugin 'Shougo/neocomplcache.vim'

"search tool
Plugin 'mileszs/ack.vim'

"git tool
Plugin 'tpope/vim-fugitive'

"vue高亮
Plugin 'posva/vim-vue'

"go高亮和语法检查
Plugin 'fatih/vim-go'

"vue高亮
Plugin 'hdima/python-syntax'

" Plugin 'Shutnik/jshint2.vim'

" 来自vim

" non github repos

call vundle#end()            " required

" ==============================================================================
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ==============================================================================
" vundle命令
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" ==============================================================================
" 组件设置
" flazz/vim-colorschemes,主题设置
colorscheme  evening

" ack.vim 设置
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <C-\> :GoDef<CR>
nmap <C-N> :GoRef<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1 "NERDTREE显示隐藏文件 

"GO下拉打开类方法"
imap <C-b> <C-x><C-o>

" 快捷注释
map <leader>cc :TComment<CR>

" checker设定
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ==============================================================================
" vim原生设置
set nu
set rnu "显示相对行号
syntax on " 打开语法检测

set tabstop=2 "设置tab键长度
set sw=2
set ts=2

set list "设置空格显示为+号
set listchars=trail:+
set listchars=tab:--


set cursorline  "设置光标行
set noswapfile "不要生成swap文件
set nobackup
set bufhidden=hide "当buffer被丢弃的时候隐藏它
" set guicursor=n-v-c:hor10 "normal下贯标显示为下划线
set expandtab                 "Use space instead of tabs
set backspace=indent,eol,start

let mapleader = "g"  " 设置leader键


"noremap ok o<esc> "插入新行

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_go_checkers = ['go']

" 会覆盖语法检查
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
let g:go_fmt_command = "goimports"


"neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1 "打开vim时自动打开
let g:neocomplcache_force_overwrite_completefunc = 1

" autocmd BufWritePost *.go execute "GoInstall!"

" 全小写是忽略大小写, 有大小写严格匹配大小写
set ignorecase smartcase

" 打开文件停留上次位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                        \ execute "normal! g`\"" |
                        \ endif
" 手动折叠 v => z => d
" set foldmethod=manual
" 语法高亮折叠
" zc -> zo (全部展开zR)
" za (toggle)
set foldmethod=syntax
set foldlevelstart=99 "默认不折叠

" 仅限golang======================================================================================================
" gotags
" let g:tagbar_ctags_bin='/Users/frank.zheng/workspace/bilibili/bin/gotags'
" let g:tagbar_width=30
" let g:tagbar_right=1
" Plugin tagbar
" brew install ctags
" brew install gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
map <leader>ee :TagbarToggle<CR>

"NERDTree 插件配置
map <leader>tt :NERDTreeToggle<CR>
