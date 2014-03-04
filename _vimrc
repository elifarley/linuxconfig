" vim: fileencoding=cp936 fdm=marker
" =========启动信息========= "
"echom " $VIM = " . $VIM
"echom " $MYVIMRC = " . $MYVIMRC
let $MYVIM = fnamemodify($MYVIMRC, ":p:h")

" =========全局设置========= "
" 编码设置"{{{
"文件编码
set fencs=utf-8,ucs-bom,gb18030,cp936,default,latin1 
if has("gui_running") && has("unix")
    "set encoding=utf-8 " 设置vim内部使用的字符编码
    "lang messages zh_CN.UTF-8 " 解决consle输出乱码
else
    set encoding=utf-8 " 设置vim内部使用的字符编码
    lang messages zh_CN.UTF-8 " 解决consle输出乱码
    set termencoding=cp936    " 系统console编码
    "lang messages zh_CN.GB18030
endif
"}}}
"外观主题"{{{
if has("gui_running")
    "设置gui默认界面大小
    "窗口大小: 全屏
    simalt ~x 
    "winsize 100 50
    "winpos  550 0
    set columns=100 lines=50    
    " 在图形界面和终端的配色方案、字体
    if has("unix")
        colorscheme grey2
        set guifont=Monospace\ 13
        set guifontwide=KaiTi\ 14
    elseif has("win32")
        colorscheme darkblue
        set gcr&    " 缺省光标设置
        hi  Cursor guibg=#943A20
        "colorscheme evening
        "colorscheme desert
        "set guifont=Lucida\ Console:h14:cANSI
        set guifont=Lucida\ Sans\ TypeWriter:h14:cANSI
        " 中文字体
        "set guifontwide=新宋体:h12:cGB2312
        set guifontwide=楷体_GB2312:h14:cGB2312
        "set guifontwide=新宋体:h14:cGB2312
        "set guifontwide=NSimSun:h12 
        simalt ~x  "全屏
    endif
else
    "设置终端界面大小
    if has("unix")
        "colorscheme default
    elseif has("win32")
        "colorscheme ir_black
    endif
endif
"}}}
" 状态栏"{{{
set statusline=%f       " 文件名
set statusline+=%m      " 修改标志
set statusline+=%r      " 只读标志
set statusline+=%h      " 帮助标志
set statusline+=%w      " 预览标志
set statusline+=\ ft=%y    " filetype
set statusline+=[%{&ff}] " dos/unix
set statusline+=[%{&fenc}] " utf-8/cp396/...
set statusline+=[line=%04l] " 
set statusline+=[col=%04v] " 
set statusline+=[%p%%]  " 百分比 
set statusline+=[%L]    " 
set statusline+=%=      " 左右分界
set statusline+=%10.40f " 文件相对路径
"}}}
" 编辑"{{{
set nocompatible
set nu
set relativenumber
set scrolloff=3
set foldlevel=3
set autoread
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set nocursorline
set nocursorcolumn
set guicursor&
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set acd
set go=telb  " 关闭菜单 用Alt键作为修饰键; 关闭工具栏，保持简洁
set path+=./*,../*
set grepprg=grep
set spell
set spelllang=en_us
set spellfile="~/vimfiles/spell/en.utf-8.add"
" indent 设置"{{{
filetype indent on
set sw=4 ts=4 et ci
set indentexpr=Myindent(v:lnum)
"}}}
"{{{ diff 设置
set diffexpr=MyDiff()
"}}}
syntax enable
syntax on
" 搜索"{{{
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
"}}}
"长行处理"{{{
set wrap
set autoindent
set textwidth=90
set formatoptions&
" t	使用 'textwidth' 自动回绕文本
set formatoptions+=t
" c	使用 'textwidth' 自动回绕注释，自动插入当前注释前导符。
"set formatoptions+=c
" r	在插入模式按回车时，自动插入当前注释前导符。
set formatoptions+=r
" o	在普通模式按 'o' 或者 'O' 时，自动插入当前注释前导符。
set formatoptions+=o
" q	允许 "gq" 排版时排版注释。
" 	注意 排版不会影响空行或者只有注释前导符的行。这样的行开启一个新段落，
" 	注释前导符的改变也是如此。
set formatoptions+=q
" w	拖尾的空格指示下一行继续同一个段落。而以非空白字符结束的行结束一个段落。
"set formatoptions+=a
" a	自动排版段落。每当文本被插入或者删除时，段落都会自动进行排版。参见|auto-format|。
" 	如果 'c' 标志位存在，该设置只对识别的注释有效。
" n	在对文本排版时，识别编号的列表。实际上，这里使用了 'formatlistpat' 选
" 	项，所以可以使用任何类型的列表。出现在数字之后的文本缩进距离被应用到后
" 	面的行。数字之后可以有可选的 '.'、 ':'、')'、']' 或者 '}'。
" 	注意 'autoindent' 也必须置位。不要和 "2" 一起使用，效果不好。
" 	示例: >
" 		1. 第一项
" 		   回绕文字
" 		2. 第二项
set fo+=2
" 2	在对文本排版时，将段落第二行而非第一行的缩进距离应用到其后的行上。这适
" 	用于第一行有特殊缩进需要的段落。注意 'autoindent' 也必须置位。
" 	示例: >
" 			first line of a paragraph
" 		second line of the same paragraph
" 		third line.
" v	Vi-兼容的插入模式自动回绕: 只有在当前输入命令键入的空白上才会分行。
" 	(注意: 这并不能 100% Vi 兼容。Vi 在这方面有些 "意想不到的特性"，换而言
" 	之，漏洞。它使用屏幕列而非实际的列。)
" b	和 'v' 类似，但只有在键入空白时还没抵达或者刚到回绕边界的时候才会自动
" 	回绕。如果一行在开始插入之前已经超过 'textwidth' 指定的长度，或者在到
" 	达 'textwidth' 之时没有输入过空白，Vim 不会自动回绕。
" l	插入模式不分行: 当一行已经超过 'textwidth' 时，插入命令不会自动排版。
" m	可以在任何值高于 255 的多字节字符上分行。这对亚洲文本尤其有用，因为每
" 	个字符都是单独的单位。
" M	在连接行时，不要在多字节字符之前或之后插入空格。优先于 'B' 标志位。
" B	在连接行时，不要在两个多字节字符之间插入空格。有 'M' 标志位时无效。
set fo+=1
" 1	不要在单字母单词后分行。如有可能，在它之前分行。
set colorcolumn=85
"}}}
"显示不可见字符"{{{
set list
set listchars=tab:>-
"}}}
"备份设置"{{{
set backup
set writebackup
set backupcopy=yes
set noswapfile
set backupext=~
set backupdir=$MYVIM/vimfiles/autosave
"}}}
"}}}
" 按键设置"{{{

" ===基本键=== "
inoremap    <silent>   jk       <esc>
inoremap    <silent>   <esc>    <nop>
nnoremap    <silent>   <tab>    %
vnoremap    <silent>   <tab>    %
noremap     <silent>   <space>  @=(foldclosed(line('.'))<0)?'zc':'zO'<CR>
inoremap    <silent>   <C-s>    <Esc>:w<cr>
nnoremap    <silent>   <C-s>    :w<cr>
nnoremap    <silent>   Q        gq

" ===Fn功能键=== "
noremap     <silent>   <F6>     :cn<cr>
noremap     <silent>   <F7>     :cp<cr>
inoremap    <silent>   <F7>     <C-r>=strftime("%c")<cr>
noremap     <silent>   <F8>     :cw<cr>
noremap     <silent>   <F9>     :make<CR>
noremap     <silent>   <F11>    :BufExplorer<CR>
noremap     <silent>   <F12>    :!python %<CR>
nnoremap    <silent>   <C-F1>   :VoomToggle<CR>
noremap     <silent>   <C-F6>   :bn<cr>
noremap     <silent>   <C-F7>   :bp<cr>
noremap     <silent>   <C-F8>   :bd<cr>
nnoremap    <silent>   <C-F10>  gT
nnoremap    <silent>   <C-F11>  gt

let mapleader=','
nnoremap    <silent>   <leader>w<space>     :w!<cr>
nnoremap    <silent>   <leader>wm           :WMToggle<cr>
nnoremap    <silent>   <leader>mr           :MRU<cr>
nnoremap    <silent>   <leader>ev           :edit $MYVIMRC<cr>
nnoremap    <silent>   <leader>sv           :source $MYVIMRC<cr>
nnoremap    <silent>   <leader>bd           :bd!<cr>
nnoremap    <silent>   <leader><space>      :noh<cr>
            
"}}}        
            
" ========= 文件类型设置========= "
" 自动命令"{{{
augroup global
    au!
    au GuiEnter * simalt ~x | color darkblue | setlocal gcr& 
augroup END
augroup filetype_vim
    au!
    "au  BufWrite _vimrc :source $MYVIMRC
augroup END
augroup filetype_txt
    au!
    au BufRead,BufNewFile *.log setlocal ft=txt
    au BufRead,BufNewFile *.txt setlocal ft=txt
    au BufRead,BufNewFile *.txt runtime ftplugin/txtfmt.vim
    au BufRead,BufNewFile *.txt runtime syntax/txtfmt.vim 
augroup END
augroup filetype_bib
    au!
    au FileType bib     setlocal fdm=syntax
augroup END
augroup filetype_tex
    au!
    au FileType tex     setlocal spell spl=en_us
    au FileType tex     setlocal fo+=a
    au FileType tex     nnoremap <silent> <M-s> :setlocal spell!<cr>
augroup END
augroup filetype_dot
    au!
    au BufRead *.dot compiler dot
augroup END
"}}}

" =========插件设置========= "
" =========插件管理========= "{{{
" pathogen {{{
call pathogen#infect()
filetype plugin on
"}}}
" acp "{{{
let g:acp_enableAtStartup = 1
"}}}
" vimim {{{
let g:vimim_cloud = -1
"let g:vimim_mode = 'onekey'
"let g:vimim_enable_dynamic_menu = 1
"let g:vimim_enable_fuzzy_pinyin = 1
"let g:vimim_enable_fuzzy_search = 1
"}}}
" getscript {{{
let g:GetLatestVimScripts_allowautoinstall=1
"}}}
"latex-suite {{{
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_ViewRule_pdf = '"C:\\Program Files\\Foxit Software\\Foxit Reader\\FoxitReader.exe"'
"在注释里禁用拼写检查 it does not work
let g:tex_comment_nospell = 1
set makeprg=make

"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_FormatDependency_pdf = ''
"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
"}}}
" taglist "{{{
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
nnoremap <silent> <leader>tl :TlistToggle<cr>
"}}}
" winmanager"{{{
let g:winManagerWindowLayout = 'TagsExplorer,FileExplorer|BufExplorer'
nnoremap <silent> <c-w><c-t> :WMToggle<cr> 
nnoremap <silent> <c-w><c-f> :FirstExplorerWindow<cr>
nnoremap <silent> <c-w><c-b> :BottomExplorerWindow<cr>
"}}}
"showmarks {{{
set updatetime=200
"}}}
"nerdcommenter"{{{
let g:NERDCreateDefaultMappings = 1
"}}} snipMate"{{{
let g:snippets_dir = '$VIM/../../Data/settings/vimfiles/bundle/snipMate/snippets'

"}}}
" lookupfile"{{{
let g:LookupFile_DefaultCmd = ':LUWalk'
let g:LookupFile_DisableDefaultMap = 0
let g:LookupFile_TagExpr = string('d:\filenametags')
let g:LookupFile_FileFilter = '\.class$\|\.o$\|\.obj$\|\.exe$\|\.jar$\|\.zip$\|\.war$\|\.ear$'
let g:LookupFile_Bufs_BufListExpr = 'g:SB_MRUlist'
let g:LookupFile_RecentFileListSize = 30
let g:LookupFile_MinPatLength = 2
nnoremap <silent> <A-S-L> <Plug>LookupFile
inoremap <silent> <A-S-L> <C-O><Plug>LookupFile
"}}}
" DoxygenToolkit "{{{
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="Chen Xin liang"
let g:DoxygenToolkit_briefTag_funcName="yes"
augroup doxygen
    au!
    au FileType cpp nnoremap <buffer> <silent> <F3>a :DoxAuthor<cr>
    au FileType cpp nnoremap <buffer> <silent> <F3>f :Dox<cr>
    au FileType cpp nnoremap <buffer> <silent> <F3>b :DoxBlock<cr>
    au FileType cpp nnoremap <buffer> <silent> <F3>c O/** */<Left><Left><cr>
augroup END
"let g:DoxygenToolkit_commentType = "Matlab"
"let g:DoxygenToolkit_startCommentTag = "%> "
"let g:DoxygenToolkit_startCommentBlock = "%> "
"let g:DoxygenToolkit_interCommentTag = "%> "
"let g:DoxygenToolkit_interCommentBlock = "%> "
"let g:DoxygenToolkit_endCommentTag = ""
"let g:DoxygenToolkit_endCommentBlock = ""
"}}}
" vimwiki "{{{
let g:vimwiki_list = [{'path': '$VIM/vimfiles/bundle/vimwiki/site/src/', 'path_html': '$VIM/vimfiles/bundle/vimwiki/site/public_html/'}]
let g:vimwiki_folding = 1
augroup filetype_wiki
    autocmd!
    autocmd FileType  vimwiki  noremap <buffer> <F4> :Vimwiki2HTML<cr>
    autocmd FileType  vimwiki  noremap <buffer> <S-F4> :VimwikiAll2HTML<cr>
    autocmd FileType  vimwiki  nnoremap <buffer> <M-space> :VimwikiToggleListItem<cr>
augroup END
"}}}
"MRU {{{
let MRU_Include_Files = ''
"}}}
" NERDTree "{{{
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMapToggleBookmarks = "Bt"
let g:NERDTreeMapDeleteBookmark = "D"
nnoremap <silent> <leader>nt :NERDTreeToggle<cr>
"}}} VCSCommand"{{{
autocmd FileType  vcscommit setlocal fenc=cp936
"}}}
"YankRing {{{
nnoremap <silent> <Leader>yr :YRShow<cr>
vnoremap <silent> <Leader>yr :YRShow<cr>
"}}}
"LineCommenter {{{
nnoremap <Leader>lc :call LineCommenter()<cr>
vnoremap <Leader>lc :call LineCommenter()<cr>
"}}}
"{{{ sonoma
        "colorscheme sonoma
"}}}
"}}}

" =========自定义========= "
"  =========自定义函数========= ""{{{
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
func! Myindent(lnum)
    let s:a=strlen(matchstr(getline(v:lnum), '^\*\+\s\+\|^\d\(\.\d\)\=\s\+'))
    if s:a == 4
        return '>2'
    elseif s:a == 2
        return '>1'
    else
        return '='
    endif
endf
"}}}
"  =========自定义变量========= ""{{{
let @H = '$VIM/../../Data/notes.html'
"}}}
