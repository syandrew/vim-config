

syntax on

" 解决 vim 无法使用退格键删除
set nocompatible
set backspace=indent,eol,start

set number
set autoindent
"set smartindent
set expandtab
set ts=4
set shiftwidth=4

" 高亮当前行
"set cursorline
"hi cursorline   cterm=NONE ctermbg=lightgray ctermfg=NONE
"hi cursorline   cterm=NONE ctermbg=234 ctermfg=NONE

" 保存文件时不要生成备份文件
set nobackup
" just for encode
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8

" 高亮搜索词
set hlsearch
set incsearch

" 折叠设置
" set foldmethod
"set fdm=indent
"set completeopt=longest

" 设置粘贴模式
"set paste

" 显示当前行,总行数
set ruler
set rulerformat=%25(%5l,%-6(%c%V%)\ %5*%L\ %P%)%*




"hi CursorLine  cterm=NONE   ctermbg=gray ctermfg=NONE
"hi CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE

" 自动补全菜单控制
set completeopt=longest,menu

" 打开文件时检测文件类型,自动匹配
filetype on
filetype plugin on
filetype indent on

" 和 neocomplcache_omni 不冲突,可以共存
" php 函数补全
function AddPHPFuncList()
    set dictionary-=~/.vim/tools/php/functions.txt  dictionary+=~/.vim/tools/php/functions.txt
    set complete-=k complete+=k
endfunction
au FileType php call AddPHPFuncList()

" python api 补全
function AddPythonFuncList()
    set dictionary-=~/.vim/tools/python/complete-dict dictionary+=~/.vim/tools/python/complete-dict
    set complete-=k complete+=k
endfunction
au FileType python call AddPythonFuncList()

" css 属性补全
function AddCssAttrList()
    set dictionary-=~/.vim/tools/css/css.attr dictionary+=~/.vim/tools/css/css.attr
    set complete-=k complete+=k
endfunction
au FileType css call AddCssAttrList()

" js 函数自动补全
function AddJsFuncList()
    set dictionary-=~/.vim/tools/js/javascript.dict dictionary+=~/.vim/tools/js/javascript.dict
    set complete-=k complete+=k
endfunction
autocmd FileType javascript call AddJsFuncList()

" sql 关键词补全
function AddSqlKeyword()
    set dictionary-=~/.vim/tools/sql.dict dictionary+=~/.vim/tools/sql.dict
    set complete-=k complete+=k
endfunction
autocmd FileType sql call AddSqlKeyword()

"colorscheme darkblue

" 记住上次编辑的位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

" 自定义文件模版
autocmd BufNewFile *.c 0r ~/.vim/template/cconfig.c
autocmd BufNewFile *.php 0r ~/.vim/template/phpconfig.php
autocmd BufNewFile *.sh 0r ~/.vim/template/shconfig.sh

" 高亮自定义
hi Comment ctermfg=blue

" 状态栏
"set laststatus=2      " 总是显示状态栏
"highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue

"" 获取当前路径，将$HOME转化为~
"function! CurDir()
"    let curdir = substitute(getcwd(), $HOME, "~", "g")
"    return curdir
"endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\@\%{hostname()}

" 设置自动补全弹出层背景色为粉红
highlight Pmenu ctermbg=magenta

" 实现 show print margin 的方法
"set colorcolumn=80
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" 仅检测PHP语法
autocmd FileType php map <F2> :!/usr/bin/env php -l %<cr>

" 友好注释助手
let g:DoxygenToolkit_paramTag_pre="@param: "
let g:DoxygenToolkit_returnTag   ="@return: "
let g:DoxygenToolkit_authorName="syandrew12@gmail.com"
let g:DoxygenToolkit_licenseTag="\<enter>Copyright (C) Technology LimitedCompany"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1


""""""""""""""""""""""""""" modify huwb

"ctagslist  配置
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Left_Window = 1         "在右侧窗口中显示taglist窗口
"let Tlist_WinWidth = 40


""""""""""""""""""""""""""""""
"安装tagbar插件
""""""""""""""""""""""""""""""
""设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='/usr/bin/ctags'
"设置tagbar的窗口宽度
"let g:tagbar_width=30
""设置tagbar的窗口显示的位置,为左边
let g:tagbar_left=1
"打开文件自动 打开tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.go call tagbar#autoopen()
""映射tagbar的快捷键
map <F4> :TagbarToggle<CR>


"第80列往后提醒
"autocmd 与mark.vim冲突
"autocmd BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
set cc=0
func SwitchCc()
if &cc == 121
    exec ":set cc=0"
else
    exec ":set cc=121"
endif
endfunc
map <F3> :call SwitchCc()<CR>


"Mark.vim插件
"(1). 帮助手册查看
"这个插件没有帮助手册, 不过大可放心使用, 其提供的功能也不是很多,
"就几条命令, 但是用起来真的是很方便.

"(2). 功能
"这个插件与vim中自带的'*'与'#'非常相像. 不同之处是: vim中的'*'与'#'命令只能同时高
"亮一个同类词组(或正则表达式的搜索结果), 而Mark.vim插件可以同时高亮多个.

"(3). 安装
"把下载好的Mark.vim插件放到 $HOME/.vim/plugin 目录中, 即可.

"(4). 使用方法
"\m   mark or unmark the word under (or before) the cursor
"\r   manually input a regular expression. 用于搜索.
"\n   clear this mark (i.e. the mark under the cursor), or clear
"       all highlighted marks .
"\*   把光标向前切换到当前被Mark的MarkWords中的下一个MarkWord.
"\#   把光标向后切换到当前被Mark的MarkWords中的上一个MarkWord.
"\/ 把光标向前切换到所有被Mark的MarkWords中的下一个MarkWord.
"\? 把光标向后切换到所有被Mark的MarkWords中的上一个MarkWord.

"说明: 这些命令中的 '\' 是 vim 中的 mapleader, 你也可以设置为别的: 如,
"若要设置为 ',', 把下面这条语句加到.vimrc文件中, 即可,
"      let mapleader=","
nmap <F5> \m
map <C-k> \*
nmap <C-i> \#

nmap <F6> gd


""""""""""""""""""""""""""" modify huwb

" map tags list
"nmap <F3> :TlistToggle<CR>


"自定义快捷键
vmap <C-S-P>    dO#endif<Esc>PO#if 0<Esc>
" 函数注释
"" map <F4> <Esc>:Dox<cr>
" 文件版权声明
"" map <F5> <Esc>:DoxAuthor<cr>
" Copyright
"  map <F6> <Esc>:DoxLic<cr>


" vim tabs conf
map <F7> :tabp <CR>
map <F8> :tabn <CR>
" 改变浏览的启动目录
set browsedir=current

" 分割窗口时保持相等的宽/高
set equalalways

" The NERD tree : A tree explorer plugin for navigating the filesystem
map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>
"启动Vim时自动打开nerdtree
"autocmd VimEnter * NERDTree
let NERDTreeIgnore=['^cscope', '^tags$']
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='right'
""窗口尺寸
let g:NERDTreewinSize=31
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeShowHidden=0


" golang 结构体补齐
"imap <C-Space> <C-x><C-o>

" 通过C-X,C-U打开匹配列表
"let g:SuerTabDefaultCompletionType = '<C-X><C-U>'

" vim 插件管理器
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

Bundle 'majutsushi/tagbar'


""""""" YCM
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'

"Plugin 'dgryski/vim-godef'

Bundle 'cespare/vim-golang'
"Bundle 'dgryski/vim-godef'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

""""""" YCM


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

Bundle 'Blackrush/vim-gocode'


"配置文件中添加
let g:godef_split=2 "左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 "函数在同一个文件中时不需要打开新窗口


"~/.vimrc
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
