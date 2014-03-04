" Vim global plugin for correcting typing mistakes
" Last Change: 
" Maintainer: 
" License:	This file is placed in the public domain.

if exists("g:loaded_python_runscript")
  finish
endif
let loaded_mypython = 1

let s:save_cpo = &cpo
set cpo&vim

if !hasmapto('<Plug>RunScript')
  map <unique> <F5>  <Plug>RunScript
endif
noremap <script> <Plug>RunScript  <SID>RunScript

noremenu <script> Plugin.Run\ Script      <SID>RunScript

noremap <SID>RunScript  :call <SID>RunScript()<CR>

function! s:RunScript()
    echomsg "Run Script " . bufname('%')
    compiler python
    silent make 
    cwindow
endfunction

if !exists(":Rs")
  command -nargs=1  Rs  :call s:RunScript(<q-args>, 0)
endif

let &cpo = s:save_cpo
