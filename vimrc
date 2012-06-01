"�༭�������ļ� ":e $MYVIMRC��":e $VIM/_vimrc

"=============================================================================
" Common settings
"=============================================================================
set nocompatible
set wrap

"set path+=D:\setup\freeorfree\vim  "add the path of ctags.exe 
"set backup bdir=D:\setup\freeorfree\vim\vimBackup
"set vdir=d:\setup\freeorfree\vim\vimView  "view dir
set nobackup
set tags=tags; "�ӵ�ǰĿ¼��ʼ��������tag�ļ� �ֺ�Ϊ����
set autochdir  "�л�Ŀ¼����ǰ�༭�ļ�����Ŀ¼
"set dir=c:\temp

set backspace=2  "��ͬ��set backspace=indent,eol,start"       
set ruler		" show the cursor position all the time״̬�����
set showcmd		" display incomplete commands
set display+=lastline   "ĩ����ʾ����������ݣ���ʹ��һ��@
set ai cin		"autoindent cindent
"set si	  "smart indent:cindent��ʹsmartindent��Ч
"formatoptions:m �������κ�ֵ���� 255 �Ķ��ֽ��ַ��Ϸ���
"formatoptions:B ��������ʱ����Ҫ���������ֽ��ַ�֮�����ո�
"formatoptions:M ��������ʱ����Ҫ�ڶ��ֽ��ַ�֮ǰ��֮�����ո�
set fo+=mM              " �򿪶���ģ�����������֧����
set hlsearch noincsearch		" Not do incremental searching
set ignorecase smartcase   "�ؼ��ֶ���Сд,���������ִ�Сд;�д�д�����ִ�Сд
set complete-=t       "��ȫʱ��ɨ���ǩ
"set isk+=-
"set lbr                 " linebreak ���ڵ����м��
"set history=50		" keep 50 lines of command line history
set expandtab  "����TABʱ�ÿո����
set softtabstop=2
set shiftwidth=2
"set wrapscan "Ĭ�Ͽ���
"set listchars=tab:\|\ ���Ʊ����ʾΪ|
"Do not redraw, when running macros.. lazyredraw
set lz

filetype indent on
syntax on

"=============================================================================
" Gui settings
"=============================================================================
set tpm=100 "tabpagemax 
set guioptions+=b       "��д��'go'��T ��ʾ������   b ��ʾ�ײ�������
"set guifont=Consolas:h14:cANSI "�����ᵼ��remote-tab-silentʱ�ٴ��ļ�
"set guifont=Courier_New:h11:cANSI "�����ᵼ��remote-tab-silentʱ�ٴ��ļ�
"set guifont=Monaco:h11:cANSI "�����ᵼ��remote-tab-silentʱ�ٴ��ļ�
"set guifont=Fixedsys:h9:cGB2312 "����û������
"set guifont=Bitstream_Vera_Sans_mono:h14:cANSI "�����ᵼ��remote-tab-silentʱ�ٴ��ļ�
set guifont=Liberation\ Mono\ 12
"����guifontҲ����ִ��������������С�ܶ�
"��term�ﲻ��������columns
set lines=35 co=100  "set the initial gui window size
set guitablabel=%t%m%r    "��ǩ����ʾ�ļ���

"=============================================================================
" Filetype and encoding detect settings
"=============================================================================
"encoding' Ӧ�õ�ͬ�������е� locale,����vim�˵�����ʾ�Ȼ�����
"set enc=cp936 "һ�㲻��Ҫ����

"chinese�Ǳ���,��Unix���ʾeuc-cn,��Windows���ʾcp936
"����ֵucs-bom����������ļ���ʼ���� Unicode �� BOM (Byte Order Mark 
"�ֽ�˳����)��Ҫʹ֮���������������ܰ�utf-8���� Unicode �����������ǰ�档
"��utf-8�������������ǰ���������жϱ���
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
"au BufNewFile,BufRead *.pc  set filetype=esqlc "esqlc����ctagsʶ��
au BufNewFile,BufRead *.pc  set filetype=c "esqlc����ctagsʶ��
au BufNewFile,BufRead *.pac set filetype=javascript "pac�ļ�ǿ�Ƽ��Ϊjavascript
augroup END

"plsql���﷨�ļ�����һ��Ҫע��ĵط�
"�������� syn sync minlines=50 ��֤����һ��ע�͵��������

let java_ignore_javadoc=1
"au BufNewFile,BufRead *.java compiler javac

""�Զ����桢����view:�к���֢���ı�ֻ��״̬
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
""������ӳ�䣬����Ĵ���"�������
noremap <A-p> "+gp
inoremap <A-p> <ESC>"+pa
noremap <A-P> "+gP
inoremap <A-P> <ESC>"+Pa

"ʹ��gc�ر�tabpage
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

"80���Ժ����
noremap <F5> :match DiffAdd '\%>80v.*'<CR>
""����ϴζ����ƥ��ģʽ
noremap <F6> :match<CR>
"nmap <silent> <F6> :redraw!<CR> "CTRL-L����

"ͳ�Ƹ���������ʵ���滻������Ҳ������������
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
"let Tlist_File_Fold_Auto_Close = 1     "ֻ��ʾ��ǰ�ļ�tags,�۵������ļ���tags
"let Tlist_Exit_OnlyWindow = 1          "���taglist���������һ�����ڣ����˳�vim

"vimcdoc
set helplang=cn "�����ļ������б�Ӣ����������б������Զ�û���ҵ��������ʹ��

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

