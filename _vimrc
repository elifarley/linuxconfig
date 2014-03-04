" vim: fileencoding=cp936 fdm=marker
" =========������Ϣ========= "
"echom " $VIM = " . $VIM
"echom " $MYVIMRC = " . $MYVIMRC
let $MYVIM = fnamemodify($MYVIMRC, ":p:h")

" =========ȫ������========= "
" ��������"{{{
"�ļ�����
set fencs=utf-8,ucs-bom,gb18030,cp936,default,latin1 
if has("gui_running") && has("unix")
    "set encoding=utf-8 " ����vim�ڲ�ʹ�õ��ַ�����
    "lang messages zh_CN.UTF-8 " ���consle�������
else
    set encoding=utf-8 " ����vim�ڲ�ʹ�õ��ַ�����
    lang messages zh_CN.UTF-8 " ���consle�������
    set termencoding=cp936    " ϵͳconsole����
    "lang messages zh_CN.GB18030
endif
"}}}
"�������"{{{
if has("gui_running")
    "����guiĬ�Ͻ����С
    "���ڴ�С: ȫ��
    simalt ~x 
    "winsize 100 50
    "winpos  550 0
    set columns=100 lines=50    
    " ��ͼ�ν�����ն˵���ɫ����������
    if has("unix")
        colorscheme grey2
        set guifont=Monospace\ 13
        set guifontwide=KaiTi\ 14
    elseif has("win32")
        colorscheme darkblue
        set gcr&    " ȱʡ�������
        hi  Cursor guibg=#943A20
        "colorscheme evening
        "colorscheme desert
        "set guifont=Lucida\ Console:h14:cANSI
        set guifont=Lucida\ Sans\ TypeWriter:h14:cANSI
        " ��������
        "set guifontwide=������:h12:cGB2312
        set guifontwide=����_GB2312:h14:cGB2312
        "set guifontwide=������:h14:cGB2312
        "set guifontwide=NSimSun:h12 
        simalt ~x  "ȫ��
    endif
else
    "�����ն˽����С
    if has("unix")
        "colorscheme default
    elseif has("win32")
        "colorscheme ir_black
    endif
endif
"}}}
" ״̬��"{{{
set statusline=%f       " �ļ���
set statusline+=%m      " �޸ı�־
set statusline+=%r      " ֻ����־
set statusline+=%h      " ������־
set statusline+=%w      " Ԥ����־
set statusline+=\ ft=%y    " filetype
set statusline+=[%{&ff}] " dos/unix
set statusline+=[%{&fenc}] " utf-8/cp396/...
set statusline+=[line=%04l] " 
set statusline+=[col=%04v] " 
set statusline+=[%p%%]  " �ٷֱ� 
set statusline+=[%L]    " 
set statusline+=%=      " ���ҷֽ�
set statusline+=%10.40f " �ļ����·��
"}}}
" �༭"{{{
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
set go=telb  " �رղ˵� ��Alt����Ϊ���μ�; �رչ����������ּ��
set path+=./*,../*
set grepprg=grep
set spell
set spelllang=en_us
set spellfile="~/vimfiles/spell/en.utf-8.add"
" indent ����"{{{
filetype indent on
set sw=4 ts=4 et ci
set indentexpr=Myindent(v:lnum)
"}}}
"{{{ diff ����
set diffexpr=MyDiff()
"}}}
syntax enable
syntax on
" ����"{{{
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
"}}}
"���д���"{{{
set wrap
set autoindent
set textwidth=90
set formatoptions&
" t	ʹ�� 'textwidth' �Զ������ı�
set formatoptions+=t
" c	ʹ�� 'textwidth' �Զ�����ע�ͣ��Զ����뵱ǰע��ǰ������
"set formatoptions+=c
" r	�ڲ���ģʽ���س�ʱ���Զ����뵱ǰע��ǰ������
set formatoptions+=r
" o	����ͨģʽ�� 'o' ���� 'O' ʱ���Զ����뵱ǰע��ǰ������
set formatoptions+=o
" q	���� "gq" �Ű�ʱ�Ű�ע�͡�
" 	ע�� �Ű治��Ӱ����л���ֻ��ע��ǰ�������С��������п���һ���¶��䣬
" 	ע��ǰ�����ĸı�Ҳ����ˡ�
set formatoptions+=q
" w	��β�Ŀո�ָʾ��һ�м���ͬһ�����䡣���Էǿհ��ַ��������н���һ�����䡣
"set formatoptions+=a
" a	�Զ��Ű���䡣ÿ���ı����������ɾ��ʱ�����䶼���Զ������Ű档�μ�|auto-format|��
" 	��� 'c' ��־λ���ڣ�������ֻ��ʶ���ע����Ч��
" n	�ڶ��ı��Ű�ʱ��ʶ���ŵ��б�ʵ���ϣ�����ʹ���� 'formatlistpat' ѡ
" 	����Կ���ʹ���κ����͵��б�����������֮����ı��������뱻Ӧ�õ���
" 	����С�����֮������п�ѡ�� '.'�� ':'��')'��']' ���� '}'��
" 	ע�� 'autoindent' Ҳ������λ����Ҫ�� "2" һ��ʹ�ã�Ч�����á�
" 	ʾ��: >
" 		1. ��һ��
" 		   ��������
" 		2. �ڶ���
set fo+=2
" 2	�ڶ��ı��Ű�ʱ��������ڶ��ж��ǵ�һ�е���������Ӧ�õ��������ϡ�����
" 	���ڵ�һ��������������Ҫ�Ķ��䡣ע�� 'autoindent' Ҳ������λ��
" 	ʾ��: >
" 			first line of a paragraph
" 		second line of the same paragraph
" 		third line.
" v	Vi-���ݵĲ���ģʽ�Զ�����: ֻ���ڵ�ǰ�����������Ŀհ��ϲŻ���С�
" 	(ע��: �Ⲣ���� 100% Vi ���ݡ�Vi ���ⷽ����Щ "���벻��������"��������
" 	֮��©������ʹ����Ļ�ж���ʵ�ʵ��С�)
" b	�� 'v' ���ƣ���ֻ���ڼ���հ�ʱ��û�ִ���߸յ����Ʊ߽��ʱ��Ż��Զ�
" 	���ơ����һ���ڿ�ʼ����֮ǰ�Ѿ����� 'textwidth' ָ���ĳ��ȣ������ڵ�
" 	�� 'textwidth' ֮ʱû��������հף�Vim �����Զ����ơ�
" l	����ģʽ������: ��һ���Ѿ����� 'textwidth' ʱ������������Զ��Ű档
" m	�������κ�ֵ���� 255 �Ķ��ֽ��ַ��Ϸ��С���������ı��������ã���Ϊÿ
" 	���ַ����ǵ����ĵ�λ��
" M	��������ʱ����Ҫ�ڶ��ֽ��ַ�֮ǰ��֮�����ո������� 'B' ��־λ��
" B	��������ʱ����Ҫ���������ֽ��ַ�֮�����ո��� 'M' ��־λʱ��Ч��
set fo+=1
" 1	��Ҫ�ڵ���ĸ���ʺ���С����п��ܣ�����֮ǰ���С�
set colorcolumn=85
"}}}
"��ʾ���ɼ��ַ�"{{{
set list
set listchars=tab:>-
"}}}
"��������"{{{
set backup
set writebackup
set backupcopy=yes
set noswapfile
set backupext=~
set backupdir=$MYVIM/vimfiles/autosave
"}}}
"}}}
" ��������"{{{

" ===������=== "
inoremap    <silent>   jk       <esc>
inoremap    <silent>   <esc>    <nop>
nnoremap    <silent>   <tab>    %
vnoremap    <silent>   <tab>    %
noremap     <silent>   <space>  @=(foldclosed(line('.'))<0)?'zc':'zO'<CR>
inoremap    <silent>   <C-s>    <Esc>:w<cr>
nnoremap    <silent>   <C-s>    :w<cr>
nnoremap    <silent>   Q        gq

" ===Fn���ܼ�=== "
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
            
" ========= �ļ���������========= "
" �Զ�����"{{{
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

" =========�������========= "
" =========�������========= "{{{
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
"��ע�������ƴд��� it does not work
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

" =========�Զ���========= "
"  =========�Զ��庯��========= ""{{{
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
"  =========�Զ������========= ""{{{
let @H = '$VIM/../../Data/notes.html'
"}}}
