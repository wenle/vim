"编辑此配置文件 ":e $MYVIMRC或":e $VIM/_vimrc

"=============================================================================
" Common settings
"=============================================================================
set nocompatible
set wrap

"set path+=D:\setup\freeorfree\vim  "add the path of ctags.exe 
"set backup bdir=D:\setup\freeorfree\vim\vimBackup
"set vdir=d:\setup\freeorfree\vim\vimView  "view dir
set nobackup
set tags=tags; "从当前目录开始向上搜索tag文件 分号为必须
set autochdir  "切换目录到当前编辑文件所在目录
"set dir=c:\temp

set backspace=2  "等同于set backspace=indent,eol,start"       
set ruler		" show the cursor position all the time状态栏标尺
set showcmd		" display incomplete commands
set display+=lastline   "末行显示尽量多的内容，不使用一堆@
set ai cin		"autoindent cindent
"set si	  "smart indent:cindent会使smartindent无效
"formatoptions:m 可以在任何值高于 255 的多字节字符上分行
"formatoptions:B 在连接行时，不要在两个多字节字符之间插入空格
"formatoptions:M 在连接行时，不要在多字节字符之前或之后插入空格
set fo+=mM              " 打开断行模块对亚洲语言支持行
set hlsearch noincsearch		" Not do incremental searching
set ignorecase smartcase   "关键字都是小写,搜索不区分大小写;有大写则区分大小写
set complete-=t       "补全时不扫描标签
"set isk+=-
"set lbr                 " linebreak 不在单词中间断
"set history=50		" keep 50 lines of command line history
set expandtab  "插入TAB时用空格替代
set softtabstop=2
set shiftwidth=2
"set wrapscan "默认开启
"set listchars=tab:\|\ 将制表符显示为|
"Do not redraw, when running macros.. lazyredraw
set lz

filetype indent on
syntax on

"=============================================================================
" Gui settings
"=============================================================================
set tpm=100 "tabpagemax 
set guioptions+=b       "缩写：'go'，T 显示工具栏   b 显示底部滚动条
"set guifont=Consolas:h14:cANSI "本条会导致remote-tab-silent时少打开文件
"set guifont=Courier_New:h11:cANSI "本条会导致remote-tab-silent时少打开文件
"set guifont=Monaco:h11:cANSI "本条会导致remote-tab-silent时少打开文件
"set guifont=Fixedsys:h9:cGB2312 "本条没有问题
"set guifont=Bitstream_Vera_Sans_mono:h14:cANSI "本条会导致remote-tab-silent时少打开文件
set guifont=Liberation\ Mono\ 12
"不设guifont也会出现错误情况，但概率小很多
"在term里不可以设置columns
set lines=35 co=100  "set the initial gui window size
set guitablabel=%t%m%r    "标签栏显示文件名

"=============================================================================
" Filetype and encoding detect settings
"=============================================================================
"encoding' 应该等同于你现有的 locale,否则vim菜单、提示等会乱码
"set enc=cp936 "一般不需要设置

"chinese是别名,在Unix里表示euc-cn,在Windows里表示cp936
"特殊值ucs-bom可用来检查文件开始处的 Unicode 的 BOM (Byte Order Mark 
"字节顺序标记)。要使之能正常工作，不能把utf-8或别的 Unicode 编码放在它的前面。
"将utf-8放在其它编码的前面有利于判断编码
set fencs=ucs-bom,utf-8,chinese,taiwan,japan,korea,default 

"let g:sql_type_default = 'plsql' "use pl/sql syntax for .sql file
let g:sql_type_default = 'sqlanywhere'

"filetype detect,it can also be set in vimfiles/ftdetect
augroup filetypedetect
au BufNewFile,BufRead *.prc\|*.fnc setfiletype plsql
"Only set tabstop in expandtab!!!!
au BufNewFile,BufRead *.prc\|*.fnc set nocin expandtab smarttab sw=4 ts=4 nowrap fo+=mM
au BufNewFile,BufRead *.py\|*.pyw set expandtab smarttab sw=4 ts=4 nowrap fo+=mM
au BufNewFile,BufRead *.todo set ft=todo
"au BufNewFile,BufRead *.pc  set filetype=esqlc "esqlc不被ctags识别
au BufNewFile,BufRead *.pc  set filetype=c "esqlc不被ctags识别
au BufNewFile,BufRead *.pac set filetype=javascript "pac文件强制检测为javascript
augroup END

"plsql的语法文件还有一个要注意的地方
"必须设置 syn sync minlines=50 保证大于一块注释的最大行数

let java_ignore_javadoc=1
"au BufNewFile,BufRead *.java compiler javac

""自动保存、加载view:有后遗症，改变只读状态
"au BufWinLeave *.prc\|*.fnc mkview
"au BufWinEnter *.prc\|*.fnc silent loadview

"=============================================================================
" Key mapping settings
"=============================================================================
"use Q for formating
map Q gq

"select all/copy/paste using clipboard ,the effect of 'gp' is almost same to 'p'
"except the cursor staying behind the text inserted.
inoremap <A-j> <ESC>ggVG
vnoremap <A-j> <ESC>ggVG
nnoremap <A-j> ggVG
noremap <A-y> "+y
""命令行映射，插入寄存器"里的内容
noremap <A-p> "+gp
inoremap <A-p> <ESC>"+pa
noremap <A-P> "+gP
inoremap <A-P> <ESC>"+Pa

"使用gc关闭tabpage
noremap gc :tabclose!<CR>

"switch window and maximize
noremap <C-j> <C-w>j<C-w>_
noremap <C-k> <C-w>k<C-w>_

"tabpage browse
noremap ts :tab sball<CR>
noremap tt :tabnew<CR>

"noremap ZA :qa!<CR> "too dangerous

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>	:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>

noremap <F2> :set ft?<CR> 

"noremap <F3> :mkview<CR> 
"noremap <F4> :loadview<CR> 
noremap <F3> :cn<CR> 
noremap <F4> :cp<CR> 

"80行以后高亮
noremap <F5> :match DiffAdd '\%>80v.*'<CR>
""清除上次定义的匹配模式
noremap <F6> :match<CR>
"nmap <silent> <F6> :redraw!<CR> "CTRL-L即可

"统计个数，不会实际替换，所以也可以用来搜索
vnoremap <F7>  y:%s/<C-R>"//gne<CR> 
noremap <silent> <F8> :Tlist<CR>
noremap <F9> :nohlsearch<CR>
noremap <F10> :set wrap!<CR>
noremap <F11> :set nu!<CR>
nmap <F12> :ColorSchemeExplorer<CR>
"noremap <F12> :set ft=c<CR>

" ============================================================================
" Plugins settings
" ============================================================================
"taglist
"let Tlist_File_Fold_Auto_Close = 1     "只显示当前文件tags,折叠其它文件的tags
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim

"vimcdoc
set helplang=cn "帮助文件语言列表，英语帮助总是列表中语言都没有找到的情况下使用

"color desert
"color darkblue
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme default
endif

"ps_color color schema
"color ps_color
"Colo warm

