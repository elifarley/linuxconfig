" Vim compiler file
" Compiler:     python
" Maintainer:	bryan <bryan@bit.edu.cn>
" Last Change:	2014-2-22 17:12:02

if exists("current_compiler")
  finish
endif
let current_compiler = "python"

let s:cpo_save = &cpo
set cpo-=C

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=python\ %

"the last line: \%-G%.%# is meant to suppress some
"late error messages that I found could occur e.g.
"with wxPython and that prevent one from using :clast
"to go to the relevant file and line of the traceback.
CompilerSet errorformat="%EFile\ \"%f\"\\,\ line\ %l%.%#,%Z*%\\+"

"	\%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
"	\%C\ \ \ \ %.%#,
"	\%+Z%.%#Error\:\ %.%#,
"	\%A\ \ File\ \"%f\"\\\,\ line\ %l,
"	\%+C\ \ %.%#,
"	\%-C%p^,
"	\%Z%m,
"	\%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
