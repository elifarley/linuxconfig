"=============================================================================
" vim:ft=vim:ts=4:sw=4:noet:fdm=marker:commentstring=\"\ %s:ff=unix
" 	     File: texrc.vim
"      Author: Srinath Avadhanula
"     Created: Mon Apr 01 11:00 AM 2002 PST
"         CVS: $Id: texrc,v 1.36 2003/09/07 17:23:33 srinathava Exp $
"
"  Description: This file contains resource configuration information for the
"               latex-suite package.
" 
"        NOTE: Do NOT be edit this file directly:
"              this file will be over-written each time you install a new copy
"              of latex-suite. 
"
"              You can do one of the following:
"              1. Copy this file into $VIMFILES/ftplugin/tex/texrc
"                 and edit the values in that file.
"                 $VIMFILES is ~/.vim for UNIX systems and ~/vimfiles for
"                 WINDOWS systems.
"
"              2. Just set values of each setting individually in your
"                 $VIMFILES/ftplugin/tex.vim file. (See above for what
"                 $VIMFILES is). You will need to use :let instead of :TexLet
"                 in this case.
"
"        NOTE: This file is best viewed with Vim-6.0+ with folding turned on.
"         CVS: $Id: texrc,v 1.36 2003/09/07 17:23:33 srinathava Exp $
"=============================================================================

" ==============================================================================
" SafeLet: checks for value before giving default value {{{
" Description: The function takes in a single argument and splits it into 2
"              parts, the first being the first <CWORD> found. this is taken
"              as a variable name and the next part is assigned to it
"              depending on whether the variable already exists or not.
"              handles the case where the next part is quoted or not.
"              All these calls work:
"                   TexLet g:varname = 1
"                   TexLet g:varname = '1'
"                   TexLet g:varname = 'foo bar'
"                   TexLet g:varname = "foo\nbar"
"                   TexLet g:varname = foo bar
function! <SID>SafeLet(arg)
	let name = matchstr(a:arg, '^\s*\zs\(\S\+\)\ze\s*=')
	let value = matchstr(a:arg, '=\s*\zs.*\ze')
	let value = substitute(value, '\s*$', '', '')
	if !exists(name)
		if value =~ "^'\\|^\""
			exec "let ".name." = ".value
		else
			exe "let ".name." = value"
		endif
	endif
endfunction 
com! -nargs=+ TexLet :call <SID>SafeLet(<q-args>)
" }}}
" ============================================================================== 

" ==============================================================================
" General settings {{{

TexLet g:Tex_UsePython = 1

" the system command which pulls in a file.
if &shell =~ 'sh'
	TexLet g:Tex_CatCmd = 'cat'
else
	TexLet g:Tex_CatCmd = 'type'
endif

" }}}
" ==============================================================================
" Rules: specifications of programs for compiling and viewing {{{
"

" By default, when you compile a tex file using \ll, then you will be
" generating a .dvi file. Change this line if you want to set another default.
" NOTE: Make sure that a target for this format exists in the 'Compiler rules'
"       section below and is set up properly for your system.
if has('macunix')
	TexLet g:Tex_DefaultTargetFormat = 'pdf'
else
	TexLet g:Tex_DefaultTargetFormat = 'pdf'
endif

" A comma seperated list of formats which need multiple compilations to be
" correctly compiled.
TexLet g:Tex_MultipleCompileFormats = 'dvi'

" Uncomment this line if you compile ps files via dvi files.
" TexLet g:Tex_FormatDependency_ps = 'dvi,ps'
TexLet g:Tex_FormatDependency_pdf = 'dvi,pdf'

" ------------------------------------------------------------------------------
" Compiler rules {{{
" This is the first thing you should customize. It is set up for most common
" values, but if use some other compiler, then you will want to change this.
" As CompileFlags value you'd perhaps like to use, e.g., '-src-specials',
" but it is known that it can sometimes give different results in the output,
" so use it with care.
TexLet g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode $*'
TexLet g:Tex_EscapeChars = '{}\'

TexLet g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'

" ways to generate pdf files. there are soo many...
" NOTE: pdflatex generates the same output as latex. therefore quickfix is
"       possible.
"TexLet g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'

" TexLet g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
TexLet g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
" TexLet g:Tex_CompileRule_pdf = 'dvipdf $*.dvi'

TexLet g:Tex_CompileRule_html = 'latex2html $*.tex'

TexLet g:Tex_CompileRule_bib = 'bibtex $*'

" Set Tex_UseMakefile to 0 if you want to ignore the presence of a Makefile 
" when deciding how to compile
TexLet g:Tex_UseMakefile = 1

" }}}
" ------------------------------------------------------------------------------ 
" Viewer rules {{{
" these programs are for viewing other formats. 
" NOTE: latex-suite will automatically append file.<format> to these functions
"       when calling them. The viewer therefore cannot accept arguments after
"       the filename.
" NOTE: Windows users:
" 		Set your $PATH variable to include the full path to these programs.
if has('win32')
        TexLet g:Tex_ViewRule_ps = 'gsview32'
        "TexLet g:Tex_ViewRule_pdf = 'AcroRd32'
        TexLet g:Tex_ViewRule_pdf = 'start'
        TexLet g:Tex_ViewRule_dvi = 'yap -1'
elseif has('macunix')
	" Let the system pick.  If you want, you can override the choice here.
	TexLet g:Tex_ViewRule_ps = ''
	TexLet g:Tex_ViewRule_pdf = ''
	" TexLet g:Tex_ViewRule_pdf = 'Acrobat\ Reader\ 5.1'
	TexLet g:Tex_ViewRule_dvi = ''
else
	TexLet g:Tex_ViewRule_ps = 'ghostview'
	TexLet g:Tex_ViewRule_pdf = 'xpdf'
	TexLet g:Tex_ViewRule_dvi = 'xdvi'
	" the option below specifies an editor for the dvi viewer while starting
	" up the dvi viewer according to Dimitri Antoniou's tip on vim.sf.net (tip
	" #225)
	TexLet g:Tex_UseEditorSettingInDVIViewer = 0
endif
" }}}
" ------------------------------------------------------------------------------ 
" }}}
" ==============================================================================
" Compiler: latex-suite comes with a customizable compiler plugin. {{{
"           :help latex-compiling for a detailed description of these options.
"
" this is the list of patterns which will be ignored from the compiler output.
" This is a handy way of specifying which warnings/errors to ignore. This is a
" list of patterns seperated by '¡'
TexLet g:Tex_IgnoredWarnings =
	\'Underfull'."\n".
	\'Overfull'."\n".
	\'specifier changed to'."\n".
	\'You have requested'."\n".
	\'Missing number, treated as zero.'."\n".
	\'There were undefined references'."\n".
	\'Citation %.%# undefined'

" the 'ignore level' of the 'efm'. A value of 4 says that the first 4 kinds of
" warnings in the list above will be ignored. Use the command TCLevel to set a
" level dynamically.
TexLet g:Tex_IgnoreLevel = 7

" NOTE: The values of g:Tex_Flavor and g:Tex_CompilerFlags are provided as a
"       way to make compiler/tex.vim standalone. i.e independent of the rest
"       of latex-suite. These variables are NOT used if you have already
"       defined g:Tex_CompileRule_dvi above.
"
" specifies the current latex flavor.
TexLet g:Tex_Flavor = 'latex'

" By default the program described by g:Tex_Flavor above is called with the
" flags '--src-specials --interaction=nonstopmode'. If your particular version
" of latex does not accept these arguments, you will need to set this variable
" to the appropriate value.
" NOTE: leave commented for using the default flags.
" TODO: Is it necessary (or even desirable) to use 2 variables to specify a
"       flavor and flags seperately? --SA
" TexLet g:Tex_CompilerFlags = ''

" }}}
" ============================================================================== 
" Macros: latex-suite comes with a large number of macros to speed up typing {{{
"         latex. 
"
" Place Holder Options: {{{
" (See |placeholders| for a description of what place-holders are).
"
" these options are actually used by imaps.vim, therefore the prefix is Imap_
" and not Tex_. See |placeholders| for a description of how to use
" place-holders. You can either completely disable placeholders (not
" recommended) and/or you can change the place holder characters.

TexLet g:Imap_UsePlaceHolders = 1 
TexLet g:Imap_PlaceHolderStart = '<+'
TexLet g:Imap_PlaceHolderEnd = '+>'

" This option when set to 1 makes <C-J> in insert mode delete
" non-descriptive (empty) placeholders and enters insert mode.
" NOTE: This option _has_ to be set in the .vimrc. Setting this in a filetype
"       plugin file such as ftplugin/tex.vim will not have any affect.
TexLet g:Imap_DeleteEmptyPlaceHolders = 0

" When set to 1, in visual mode, <C-J> takes you to the next placeholder
" without deleting the current placeholder.
" NOTE: This option _has_ to be set in the .vimrc. Setting this in a filetype
"       plugin file such as ftplugin/tex.vim will not have any affect.
TexLet g:Imap_StickyPlaceHolders = 1


" }}}
" Menu Wizard Option: {{{
" If the following variable is set to 1, then when an enviroment is chosen
" from the menu then for selected environments, latex-suite asks a series of
" questions on the command line and inserts a template with the corresponding
" fields already filled in.
" Setting this to zero will insert a template with |placeholders| marking off
" the places where fields need to be filled.
TexLet g:Tex_UseMenuWizard = 0

" }}}
" Visual Mode Mapping Correction:  {{{
" With so many visual maps, its helpful to have a way of catching typing
" errors made in visual mode. What this does is to prompt you to correct your
" visual mode mapping if you start out with g:Tex_Leader and then type some
" illegal keys.
" It basically maps just the g:Tex_Leader character to a function
TexLet g:Tex_CatchVisMapErrors = 1

" }}}
" Diacritics: {{{
" whether or not you want to use diacritics 
" (diacritics speed up typing some languages. the way they are set up in
" latex-suite is
"  =char>  =  \'{<char>}
"  +char>  =  \v{<char>}
"  +}      = \"a
"  :o      = \^o
" Default: 0 
TexLet g:Tex_Diacritics = 0

" }}}
" Leader Options: {{{
" The mappings in latex-suite are by default prefixed with the back-tick
" character. For example, `/ inserts \frac{<++>}{<++>}<++> etc. You can change the
" prefix with the following setting.
" ',', '/', '`' are preferred values. '' or '\' will lead to a _lot_ of
" trouble.
" g:Tex_Leader is also used for visual mode mappings for fonts.
TexLet g:Tex_Leader = '`'

" In order to avoid ambiguity between the large number of visual mode macros
" provided, the visual mode macros for environments and sections start with a
" character different from '`'.
TexLet g:Tex_Leader2 = ','

" }}}
" Environment Macros: {{{
" These mappings insert LaTeX "environments" such as 
"       \begin{center}
"           <++>
"       \end{center}<++>
" with the cursor left at the first place-holder.
" (See |placeholders| for what these are.)
" Mnemonic:
" 1. All environment mappings begin with 'E'
" 2. The next two capital letters are (for the common environments) the
"    first 2 letters of the environment name converted into upper case. For
"    example, for the center environment above, use ECE. There are a few
"    necessary exceptions such as:
"        equation   -->  EEQ
"        eqnarray   -->  EEA
"    Please see texmaps.vim for the complete list.
" 
" Along with the insert mode mappings, a set of visual mode mappings is
" provided which encloses the visually selected region in an environment.
" These maps are related to the corresponding insert mode mappings by the
" following rule:
"     EFI           --> ,fi
" and so on. i.e, the leading E becomes '`' and the next 2 letters are small
" case. Some of the visual mode mappings are sensetive to whether you choose
" line-wise or character wise. For example, if you choose a word and press
" `ve, then you get \verb|word|, whereas if you press `ve on a line-wise
" selection, you get:
"       \begin{verbatim}
"           line
"       \end{verbatim}
" 
" these 2 options give finer control on which aspect of the macros you want
" to enable.
TexLet g:Tex_EnvironmentMaps  = 1
TexLet g:Tex_EnvironmentMenus = 1


" }}}
" Font Macros: {{{
" These mappings insert font descriptions such as:
"       \textsf{<++>}<++>
" again with the cursor at the first place-holder.
" Mnemonic:
" 1. first letter is always F (F for font)
" 2. next 2 letters are the 2 letters describing the font.
"
" Example: the above mapping is triggered by FSF.
"
" Just like environment mappings, you can visually select an area and press
" `sf to have it enclosed in:
"       \textsf{word}
" or
"       {\sffamily
"       line
"       }
" depending on character-wise or line-wise selection.
TexLet g:Tex_FontMaps = 1
TexLet g:Tex_FontMenus = 1

" }}}
" Section Macros: {{{
" Inserts LaTeX sections:
"       \section
" etc. Just as in the case of environments and fonts, can be enclosed with a
" visual selection. The enclosing is not sensetive to character or line-wise
" selection.
" NOTE: In visual mode, you are supposed to select the name of the section
" etc, not the whole section.
" In the following case, select just the first line, not lines 1-3.
"  1  section name
"  2  some lines in this section
"  3  and some more lines
" Mnemonic: (make your own!)
"       SPA for part
"       SCH for chapter
"       SSE for section
"       SSS for subsection
"       SS2 for subsubsection
"       SPG for paragraph
"       SSP for subparagraph
TexLet g:Tex_SectionMaps = 1
TexLet g:Tex_SectionMenus = 1

" }}}
" Auctex Style Mappings: {{{
" Auctex.vim has heavily inspired various portions of latex-suite providing
" various new ways of conviniently inserting environments.
"
" If you press <F5> in the insert mode while on an empty line, latex-suite
" prompts you with a list of environments you might want to insert. You can
" either choose one from the list or type in a new environment name.
" The variable below (which is a comma seperated list of environment names)
" decides the prompt which latex-suite generates.
" You can place as many items as you want here. If the environment name is a
" standard latex environment such as table or figure, then latex-suite will
" insert a template with additional fields, if not, just a bare bones
" \begin{env}
"   <++>
" \end{env} 
" is inserted.
" \[ and $$ are also recognized.
" NOTE: Setting this variable to the empty string is a way of leaving the 
"       <F5> key unmapped

TexLet g:Tex_PromptedEnvironments =
	\ 'eqnarray*,eqnarray,equation,equation*,\[,$$,align,align*'

" Another quick way of inserting environments is to press one of the shifted
" function keys from <F1> through <F4>.
" Each environment in the following list is mapped to a corresponding shifted
" function key. 
" NOTE: Setting this variable to the empty string is a way of leaving all the
"       shifted function keys untouched by latex-suite.
" NOTE: Only the first 4 items of the list are used. The rest will be silently
"       ignored.
" The number of items in this list decides how many shifted function keys are
" mapped.
TexLet g:Tex_HotKeyMappings = 
	\ 'eqnarray*,eqnarray,bmatrix'

" Similar to above mechanisms works <F7> key. It prompts for command with list
" of commands from g:Tex_PromptedCommands. There are not HotKeys for commands.
" It works for commands of style \com{}. Changing of current command is done
" with <S-F7> 

TexLet g:Tex_PromptedCommands = 
   \ 'footnote,cite,pageref,label'

" }}}
" Smart Key Mappings: {{{
" Latex-suite shites with a number of 'smart' maps, where the behavior of
" standard keys is modified in a way which makes editing tex files easy.

" Pressing <BS> in insert mode checks to see whether we are just after
" something like \'{a} and if so, deletes all of it. i.e, diacritics are
" treated as single characters for backspacing.
" Setting this to zero will leave the <BS> key unmapped.
" Default: 1 
TexLet g:Tex_SmartKeyBS = 1

" Pressing " (english double quote) will insert `` or '' by making an
" intelligent guess about whether we intended to open or close a quote.
" Default: 1 
TexLet g:Tex_SmartKeyQuote = 1

" Users of other languages might want to change the quote characters to suit
" their locale.  These global values will be ignored if there are buffer-local
" versions, which may be set in the language-specific package files, such as
" ftplugin/latex-suite/packages/german
TexLet g:Tex_SmartQuoteOpen = "``"
TexLet g:Tex_SmartQuoteClose = "''"

" Latex-suite maps the <space> key in such a way that $ characters are not
" broken across lines.
" NOTE: Setting this to 1 has the side-effect of making the 'tw' setting be 0.
" Default: 
TexLet g:Tex_SmartKeySpace = 0

" Pressing ... (3 dots) results in \ldots outside math mode and \cdots in math
" mode.
"
" TODO: Make it more intelligent within math mode. For example 
"   $1+...+3$ should expand to $1+\cdots+n$, whereas $1,...,n$ should expand
"   to $1,\ldots,n$. The amsmath package actually provides a command \dots
"   which does this. Maybe use that if amsmath is detected?
" Default: 1
TexLet g:Tex_SmartKeyDot = 1

" }}}

" }}}
" ==============================================================================
" TeX Completion: {{{
"
" Options for preview window for ref/cite completion.
" Height of cwindow
" Default: 5 
TexLet g:Tex_ViewerCwindowHeight = 5 
" Height of preview window
" Default: 10 
TexLet g:Tex_ViewerPreviewHeight = 10 

" Options for explorer completion.
" Height of explorer window
" Default: 10 
TexLet g:Tex_ExplorerHeight = 10

" Directory for images. Read |latex-completion-explorer| before changing
" Default: '' 
TexLet g:Tex_ImageDir = ''

" whether or not searches for \cite's are cached.
TexLet g:Tex_RememberCiteSearch = 0
" Paths to the bibliography files and custom packages.
TexLet g:Tex_BIBINPUTS = ''
TexLet g:Tex_TEXINPUTS = ''

" }}}
" ==============================================================================
" Menus: set the kinds of menus which you would like to see. {{{
"
" Setting this variable to zero will immediately disable _all_ menus. 
" for finer control set this to 1 and then play with the other options.
" Default: 1
TexLet g:Tex_Menus = 1

" The location of the main menu
TexLet g:Tex_MainMenuLocation = 80

" Math contains a large number of tex math elemets such as arrows,
" mathematical fonts (\mathrm), mathematical diacritics (\dot), binary
" relational operators etc. This menu compromises about 75% of the menus.
" Default: 1 
TexLet g:Tex_MathMenus = 1 

" The following options control the "compactness" of the menus. 
"
" Setting this option to 1 makes the Font, Counter and Dimensioning menus to
" be collected together into a single 'Tex-Elements' menu. Setting this to 0
" creates seperate menus for each of them.
" Default: 1 
TexLet g:Tex_NestElementMenus = 1

" Sometimes when you are using a lot of packages with lots of options etc,
" then a lot of time might be spent at startup loading the menus.
" Setting the following variable to 0 will stop autoloading the packages menu.
" You can still goto TeX-Suite.Configure Menu and load this after startup.
" Default: 1
TexLet g:Tex_PackagesMenu = 1
" The following option will create the packages option within the TeX-Suite
" menu.
" Default: 1
TexLet g:Tex_NestPackagesMenu = 1

" This is the prefix added to the menu names created by latex suite.  Add a
" dot to the following option to nest the menus under the menu name before the
" dot.
" NOTE: With a '.' as the last character of the following setting, every
" single menu created by latex suite will be nested under the same menu.
" Default: 'TeX-' 
TexLet g:Tex_MenuPrefix = 'TeX-'

" Use utf-8 menus. There is plenty of math symbols in LaTeX. It is hard to
" remember them. You can display them with utf-8. Your system/GUI interface
" have to support utf-8. This addition is necessary for resetting 'encoding'.
TexLet g:Tex_UseUtfMenus = 0

if g:Tex_UseUtfMenus != 0 && has("gui_running")
	set encoding=utf-8
endif

" }}}
" ==============================================================================
" Folding: latex-suite comes with 'fake' syntax folding. {{{
"
" specifies whether the MakeTeXFolds() function will be defined. If this is
" set to zero, then esentially you have disabled all of latex-suite's folding
" functions. no maps for refreshing folds will be set up etc.
" NOTE: However, the function TexFoldTextFunction() is still avaiable
"       and 'foldexpr' is set to point to it. This is so you can continue
"       using another folding scheme but still use the fold text function.
TexLet g:Tex_Folding = 1 

" specifies whether a latex file is automatically folded up when opened. 
" Setting this to zero means that a file is not folded up as soon as its
" opened.
" NOTE: the MakeTeXFolds() function will still be available (unless disabled
"       by g:Tex_Folding), so you can do <F6> or \rf to refresh/create folds.
TexLet g:Tex_AutoFolding = 1 

" }}}
" ============================================================================== 

