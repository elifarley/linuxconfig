set nocompatible

" 外观
set guifont=Lucida\ Console:h14:cANSI
"set guifont=Lucida\ Sans\ TypeWriter:h14:cANSI
if has("win32")
    " 为了使用中文字体，必须调整编码设置
    let s:old_encoding = &encoding
    set encoding=utf-8
    let &rtp = iconv(&rtp, s:old_encoding, &encoding)
    lang messages zh_CN.UTF-8
    set fileencodings=utf-8,ucs-bom,chinese,default,latin-1
    set termencoding=chinese
    set guifontwide=楷体_GB2312:h14:cGB2312
endif
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    simalt ~x
endif

" 状态栏
set laststatus=2    " 总是显示
set statusline=%f   "文件名
set statusline+=%m   "修改
set statusline+=%r   "只读
set statusline+=%h   "帮助
set statusline+=%w   "preview
set statusline+=%y   "[filetype]
set statusline+=[%{&ff}]  "fileformat
set statusline+=[%{&fenc}]  "fileencoding
set statusline+=[(%l,%v)]  "(line, col)
set statusline+=[%p%%]  "percent
set statusline+=[%L]    "
set statusline+=%=      " left vs right
set statusline+=%10.30F      " relative path

set helplang=cn
set nu
set rnu

color darkblue
syntax on
filetype plugin on

" 编辑
set noswapfile
set nobackup
set nowritebackup
set autoread

" 搜索
set hlsearch

" 缩进
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set cindent

" 折叠
set nowrap

" 按键 
inoremap <silent>	jk	<esc>
inoremap <silent>	<esc>	<nop>

nnoremap <silent>   <C-s>   :w<cr>
inoremap <silent>   <C-s>   <esc>:w<cr>a

inoremap <silent>   <F7>    <C-r>=strftime("%c")<cr>

nnoremap <silent>   <space> @=((foldlevel('.')>0)?((foldclosed('.')>0)?'zo':'zc'):'<space>')<cr>

let mapleader=','
nnoremap <silent>   <leader><space>  :nohlsearch<cr>
nnoremap <silent>   <leader>ev  :tabe $MYVIMRC<cr>
nnoremap <silent>   <leader>sv  :source $MYVIMRC<cr>
nnoremap <silent>   <leader>bd  :bd!<cr>

" 自动命令
augroup filetype_vim 
	autocmd!
	autocmd 	BufWritePost _vimrc	source $MYVIMRC
    autocmd     FileType    vim     setlocal fdm=indent
augroup END
augroup filetype_vim
	autocmd!
    autocmd     FileType    nerdtree    nnoremap <buffer> <silent>  <C-d> :Bookmark<cr>
augroup END
augroup filetype_python
	autocmd!
    autocmd     FileType    python      compiler python
    autocmd     FileType    python      setlocal fdm=indent
augroup END

" 插件
call pathogen#infect()

" nerdtree
let g:NERDTreeShowBookmarks=1
nnoremap    <silent>        <leader>nt  :NERDTreeToggle<cr>

" mr
nnoremap    <silent>        <leader>mr :MRU<cr>
