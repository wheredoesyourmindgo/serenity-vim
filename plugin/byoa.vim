if exists('g:loaded_byoa') || &cp || v:version < 700
  finish
endif
let g:loaded_byoa = 1

" function! s:isCoding()
"   return !exists("g:byoa_writing") || ! g:byoa_writing
" endfunction

if exists("g:byoa_keymap")
  let s:byoa_keymap = g:byoa_keymap
else
  let s:byoa_keymap = 'serenity'
endif

if s:byoa_keymap == 'serenity'
  let s:r1c1 = "q"
  let s:R1C1 = "Q"
  let s:r1c2 = "l"
  let s:R1C2 = "L"
  let s:r1c3 = "c"
  let s:R1C3 = "C"
  let s:r1c4 = "p"
  let s:R1C4 = "P"
  let s:r1c5 = "b"
  let s:R1C5 = "B"
  let s:r1c6 = "j"
  let s:R1C6 = "J"
  let s:r1c7 = "f"
  let s:R1C7 = "F"
  let s:r1c8 = "o"
  let s:R1C8 = "O"
  let s:r1c9 = "u"
  let s:R1C9 = "U"
  let s:r1c10 = ";"
  let s:R1C10 = ":"
  let s:r2c1 = "m"
  let s:R2C1 = "M"
  let s:r2c2 = "r"
  let s:R2C2 = "R"
  let s:r2c3 = "s"
  let s:R2C3 = "S"
  let s:r2c4 = "t"
  let s:R2C4 = "T"
  let s:r2c5 = "g"
  let s:R2C5 = "G"
  let s:r2c6 = "y"
  let s:R2C6 = "Y"
  let s:r2c7 = "n"
  let s:R2C7 = "N"
  let s:r2c8 = "e"
  let s:R2C8 = "E"
  let s:r2c9 = "i"
  let s:R2C9 = "I"
  let s:r2c10 = "a"
  let s:R2C10 = "A"
  let s:r3c1 = "v"
  let s:R3C1 = "V"
  let s:r3c2 = "x"
  let s:R3C2 = "X"
  let s:r3c3 = "w"
  let s:R3C3 = "W"
  let s:r3c4 = "d"
  let s:R3C4 = "D"
  let s:r3c5 = "z"
  let s:R3C5 = "Z"
  let s:r3c6 = "k"
  let s:R3C6 = "K"
  let s:r3c7 = "h"
  let s:R3C7 = "H"
  let s:r3c8 = "/"
  let s:R3C8 = '?'
  let s:r3c9 = ","
  let s:R3C9 = "<"
  let s:r3c10 = "."
  let s:R3C10 = ">"
elseif s:byoa_keymap == 'qwerty'
  let s:r2c10 = ";"
  let s:R2C10 = ":"
endif

" Map leader-g to line comment toggle
map <leader>g <plug>NERDCommenterToggle

" bkad/CamelCaseMotion
map & <Plug>CamelCaseMotion_ge
map * <Plug>CamelCaseMotion_b
map ( <Plug>CamelCaseMotion_e
map ) <Plug>CamelCaseMotion_w
" emulate vscode plugin behavior. <leader> doesn't appear to work, use <space>
omap <silent> g<space>f <Plug>CamelCaseMotion_ie
xmap <silent> g<space>f <Plug>CamelCaseMotion_ie
" noremap <leader>ge <Plug>CamelCaseMotion_ge

" Don't use nvim-markdown default mappings
let g:vim_markdown_no_default_key_mappings = 1

" Plugin order in .vimrc matters
" Don't use Surround default mappings
let g:surround_no_mappings = 1
let g:surround_no_insert_mappings = 1
" nmap xa  <Plug>Dsurround
" nmap fa  <Plug>Csurround
" nmap fA  <Plug>CSurround
" nmap ca  <Plug>Ysurround
" nmap cA  <Plug>YSurround
" nmap caa <Plug>Yssurround
" nmap cAa <Plug>YSsurround
" nmap cAA <Plug>YSsurround
" xmap A   <Plug>VSurround
" xmap gA  <Plug>VgSurround

" Don't use Sandwhich default mappings
" The target/goal of the re-mappings was to find something similar to Surround that worked in VSCode as well. The drawback of using Vim Surround is that the Vim Repeat plugin breaks the "." remapping.
let g:sandwich_no_default_key_mappings = 1
silent! nmap <unique><silent> xm <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> cm <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> xM <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> cM <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> wm <Plug>(operator-sandwich-add)
silent! xmap <unique> M <Plug>(operator-sandwich-add)
silent! omap <unique> M <Plug>(operator-sandwich-g@)
" delete
" silent! xmap <unique> ax <Plug>(operator-sandwich-delete)
" replace
" silent! xmap <unique> af <Plug>(operator-sandwich-replace)
let g:textobj_sandwich_no_default_key_mappings = 1
silent! omap <unique> gM <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> gM <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> GM <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> GM <Plug>(textobj-sandwich-auto-a)
silent! omap <unique> gm <Plug>(textobj-sandwich-query-i)
silent! xmap <unique> gm <Plug>(textobj-sandwich-query-i)
silent! omap <unique> Gm <Plug>(textobj-sandwich-query-a)
silent! xmap <unique> Gm <Plug>(textobj-sandwich-query-a)
" vim-surround keymap macro (https://github.com/machakann/vim-sandwich/blob/master/macros/sandwich/keymap/surround.vim)

"let g:sandwich_no_default_key_mappings = 1
"let g:operator_sandwich_no_default_key_mappings = 1
"let g:textobj_sandwich_no_default_key_mappings = 1

nmap wm <Plug>(sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> wmm <Plug>(sandwich-add)<SID>line
onoremap <SID>gul g_
nmap <silent> wM <Plug>(sandwich-add)<SID>gul

nmap xm <Plug>(sandwich-delete)
nmap xmm <Plug>(sandwich-delete-auto)
nmap cm <Plug>(sandwich-replace)
nmap cmm <Plug>(sandwich-replace-auto)

xmap M <Plug>(sandwich-add)

runtime autoload/repeat.vim
if hasmapto('<Plug>(RepeatDot)')
  nmap . <Plug>(operator-sandwich-predot)<Plug>(RepeatDot)
else
  nmap . <Plug>(operator-sandwich-dot)
endif

" Default recipes
let g:sandwich#recipes = [
      \   {
      \     'buns': ['\s\+', '\s\+'],
      \     'regex': 1,
      \     'kind': ['delete', 'replace', 'query'],
      \     'input': [' ']
      \   },
      \
      \   {
      \     'buns':         ['', ''],
      \     'action':       ['add'],
      \     'motionwise':   ['line'],
      \     'linewise':     1,
      \     'input':        ["\<CR>"]
      \   },
      \
      \   {
      \     'buns':         ['^$', '^$'],
      \     'regex':        1,
      \     'linewise':     1,
      \     'input':        ["\<CR>"]
      \   },
      \
      \   {
      \     'buns':         ['<', '>'],
      \     'expand_range': 0,
      \     'input':        ['>', 'a'],
      \   },
      \
      \   {
      \     'buns':         ['`', '`'],
      \     'quoteescape':  1,
      \     'expand_range': 0,
      \     'nesting':      0,
      \     'linewise':     0,
      \   },
      \
      \   {
      \     'buns':         ['"', '"'],
      \     'quoteescape':  1,
      \     'expand_range': 0,
      \     'nesting':      0,
      \     'linewise':     0,
      \   },
      \
      \   {
      \     'buns':         ["'", "'"],
      \     'quoteescape':  1,
      \     'expand_range': 0,
      \     'nesting':      0,
      \     'linewise':     0,
      \   },
      \
      \   {
      \     'buns':         ['{', '}'],
      \     'nesting':      1,
      \     'skip_break':   1,
      \     'input':        ['{', '}', 'B'],
      \   },
      \
      \   {
      \     'buns':         ['[', ']'],
      \     'nesting':      1,
      \     'input':        ['[', ']', 'r'],
      \   },
      \
      \   {
      \     'buns':         ['(', ')'],
      \     'nesting':      1,
      \     'input':        ['(', ')', 'b'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#t#tag()',
      \     'listexpr': 1,
      \     'kind': ['add'],
      \     'action': ['add'],
      \     'input': ['t', 'T'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#t#tag()',
      \     'listexpr': 1,
      \     'kind': ['replace'],
      \     'action': ['add'],
      \     'input': ['T', '<'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#t#tagname()',
      \     'listexpr': 1,
      \     'kind': ['replace'],
      \     'action': ['add'],
      \     'input': ['t'],
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-tag-i)", "\<Plug>(textobj-sandwich-tag-a)"],
      \     'noremap': 0,
      \     'kind': ['delete', 'textobj'],
      \     'expr_filter': ['operator#sandwich#kind() !=# "replace"'],
      \     'linewise': 1,
      \     'input': ['t', 'T', '<'],
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-tag-i)", "\<Plug>(textobj-sandwich-tag-a)"],
      \     'noremap': 0,
      \     'kind': ['replace', 'query'],
      \     'expr_filter': ['operator#sandwich#kind() ==# "replace"'],
      \     'input': ['T', '<'],
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-tagname-i)", "\<Plug>(textobj-sandwich-tagname-a)"],
      \     'noremap': 0,
      \     'kind': ['replace', 'textobj'],
      \     'expr_filter': ['operator#sandwich#kind() ==# "replace"'],
      \     'input': ['t'],
      \   },
      \
      \   {
      \     'buns': ['sandwich#magicchar#f#fname()', '")"'],
      \     'kind': ['add', 'replace'],
      \     'action': ['add'],
      \     'expr': 1,
      \     'input': ['f']
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-function-ip)", "\<Plug>(textobj-sandwich-function-i)"],
      \     'noremap': 0,
      \     'kind': ['delete', 'replace', 'query'],
      \     'input': ['f']
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-function-ap)", "\<Plug>(textobj-sandwich-function-a)"],
      \     'noremap': 0,
      \     'kind': ['delete', 'replace', 'query'],
      \     'input': ['F']
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#input("operator")',
      \     'kind': ['add', 'replace'],
      \     'action': ['add'],
      \     'listexpr': 1,
      \     'input': ['i'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#input("textobj", 1)',
      \     'kind': ['delete', 'replace', 'query'],
      \     'listexpr': 1,
      \     'regex': 1,
      \     'input': ['i'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#lastinput("operator", 1)',
      \     'kind': ['add', 'replace'],
      \     'action': ['add'],
      \     'listexpr': 1,
      \     'input': ['I'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#lastinput("textobj")',
      \     'kind': ['delete', 'replace', 'query'],
      \     'listexpr': 1,
      \     'regex': 1,
      \     'input': ['I'],
      \   },
      \ ]


" Whitespace padded variants
" https://github.com/machakann/vim-sandwich/issues/44#issuecomment-321522474
let g:sandwich#recipes += [
  \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
  \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
  \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
  \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
  \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
  \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
  \ ]


" Don't use Fugitive mappings
let g:fugitive_no_maps = 1
" Don't use Clever-f mappings
let g:clever_f_not_overwrites_standard_mappings = 1

" Set the mapping for this plugin so <leader>hlt mapping doesn't conflict with Vim Split <leader>h mapping.
map <s-F10> <Plug>HiLinkTrace

" vim-textobj-entire
let g:textobj_entire_no_default_key_mappings = 1
xmap ge <Plug>(textobj-entire-i)
omap ge <Plug>(textobj-entire-i)
xmap Ge <Plug>(textobj-entire-a)
omap Ge <Plug>(textobj-entire-a)
" vim-textobj-indent
let g:textobj_indent_no_default_key_mappings = 1
xmap gi <Plug>(textobj-indent-i)
omap gi <Plug>(textobj-indent-i)
xmap Gi <Plug>(textobj-indent-a)
omap Gi <Plug>(textobj-indent-a)
xmap gI <Plug>(textobj-indent-same-i))
omap gI <Plug>(textobj-indent-same-i))
xmap GI <Plug>(textobj-indent-same-a)
omap GI <Plug>(textobj-indent-same-a)

" matchit
let g:no_plugin_maps = 1
nmap <silent> %  <Plug>(MatchitNormalForward)
nmap <silent> q% <Plug>(MatchitNormalBackward)
xmap <silent> %  <Plug>(MatchitVisualForward)
xmap <silent> q% <Plug>(MatchitVisualBackward)
omap <silent> %  <Plug>(MatchitOperationForward)
omap <silent> q% <Plug>(MatchitOperationBackward)
" Analogues of [{ and ]} using matching patterns:
nmap <silent> < <Plug>(MatchitNormalMultiBackward)
nmap <silent> ? <Plug>(MatchitNormalMultiForward)
xmap <silent> < <Plug>(MatchitVisualMultiBackward)
xmap <silent> ? <Plug>(MatchitVisualMultiForward)
omap <silent> < <Plug>(MatchitOperationMultiBackward)
omap <silent> ? <Plug>(MatchitOperationMultiForward)
" use plugin with % too
nmap <silent> ^ <Plug>(MatchitNormalForward)
xmap <silent> ^ <Plug>(MatchitVisualForward)
omap <silent> ^ <Plug>(MatchitOperationForward)
" Text object
xmap g% <Plug>(MatchitVisualTextObject)


" Leaders --------------------------

" Quit w/ save
" noremap <leader>v ZZ
" Quit w/o save
" noremap <leader>V ZQ

" Hard Bol.
noremap <leader>n 0
" Bol. down
noremap <leader>N _
" jump to position
noremap <leader>o H
noremap <leader>e M
noremap <leader>/ L
" scroll to position
noremap <leader>u zb
noremap <leader>i zz
noremap <leader>, zt
" sentences
" (| pipe symbol must be escaped, or use <bar>)
noremap <bar> (
noremap ] )
" paragraphs
noremap \ }
noremap [ {
" Help
noremap <leader><tab> K
" Bracket cmds
noremap <leader>< ]
noremap <leader>> [
" Home
noremap <home> gg
" End
noremap <End> G
" Pg up
noremap <PageUp> <C-b>
" Half Pg up
" todo - shifted pageup & pagedown not working in terminal vim, only gvim and neovim.
" noremap <S-PageUp> <C-u>
" Pg down
noremap <PageDown> <C-f>
" Half Pg down
" noremap <S-PageDown> <C-d>

" <esc> fixes an issue where indent occurs again after (un)indenting and moving away from a visual selection
" Indent
nnoremap + >>
xnoremap } ><esc>
" Un-indent
nnoremap <leader><left> <<
xnoremap <leader><left> <<esc>
" swap lines
noremap = ddp
noremap { dd<up><up>p
" Join lines
noremap ` J
" unused
map $ <esc>
" Match
" noremap ^ % See matchit plugin
" Toggle fold
noremap <leader>v za

" re-mapping shift-backspace seems impossible
" noremap <S-bs> !#@
" Visual Block Mode
" noremap <C-y> <C-v>
" noremap <C-v> <nop>
" Expert mode
noremap ! Q
" Record macro
noremap @ q
" External filter
" noremap # !
" noremap ## !!
" Backspace
noremap <bs> X
" Delete
noremap <del> x
" Command mode
noremap <cr> :
" This is used w/ help mode in order to access command mode
noremap <leader><cr> :
" auto format
noremap $ =
" repeat command
noremap <tab> .
" register spc.
noremap - "
" Set mark
noremap _ m
" Goto mark
noremap ' `
" Goto mark bol
noremap " '

" Alpha Commands --------------------------

" left r1
execute 'noremap ' . s:r1c1 . ' g'
execute 'noremap ' . s:R1C1 . ' z'
execute 'noremap ' . s:r1c2 . ' ~'
"execute 'noremap ' . s:R1C2 . ' z'
execute 'noremap ' . s:r1c3 . ' c'
execute 'noremap ' . s:R1C3 . ' C'
execute 'noremap ' . s:r1c4 . ' r'
execute 'noremap ' . s:R1C4 . ' R'
" map b <Plug>(wildfire-fuel)
" vmap B <Plug>(wildfire-water)
execute 'map ' . s:r1c5 . ' <Plug>(wildfire-fuel)'
execute 'vmap ' . s:R1C5 . ' <Plug>(wildfire-water)'
" left r2
execute 'noremap ' . s:r2c1 . ' s'
" Using A in visual mode w/ vim-sandwhich
execute 'noremap ' . s:R2C1 . ' S'
execute 'noremap ' . s:r2c2 . ' i'
execute 'noremap ' . s:R2C2 . ' I'
execute 'noremap ' . s:r2c3 . ' a'
execute 'noremap ' . s:R2C3 . ' A'
execute 'noremap ' . s:r2c4 . ' o'
execute 'noremap ' . s:R2C4 . ' O'
" just use visual mode when not in visual mode so that text object selection can be used
execute 'nnoremap ' . s:r2c5 . ' v'
execute 'nnoremap ' . s:R2C5 . ' V'
" left r3
execute 'noremap ' . s:r3c1 . ' u'
execute 'noremap ' . s:R3C1 . ' U'
execute 'noremap ' . s:r3c2 . ' d'
execute 'noremap ' . s:R3C2 . ' D'
execute 'noremap ' . s:r3c3 . ' y'
execute 'noremap ' . s:R3C3 . ' Y'
execute 'noremap ' . s:r3c4 . ' p'
execute 'noremap ' . s:R3C4 . ' P'
execute 'noremap ' . s:r3c5 . ' <C-r>'
execute 'noremap ' . s:R3C5 . ' &'
" right r1
execute 'noremap ' . s:r1c6 . ' f'
execute 'noremap ' . s:R1C6 . ' F'
" nmap j <Plug>(clever-f-f)
" xmap j <Plug>(clever-f-f)
" omap j <Plug>(clever-f-f)
" nmap J <Plug>(clever-f-F)
" xmap J <Plug>(clever-f-F)
" omap J <Plug>(clever-f-F)
" nmap m <Plug>(clever-f-t)
" xmap m <Plug>(clever-f-t)
" omap m <Plug>(clever-f-t)
" nmap M <Plug>(clever-f-T)
" xmap M <Plug>(clever-f-T)
" omap M <Plug>(clever-f-T)
execute 'noremap ' . s:r1c7 . ' ge'
execute 'noremap ' . s:R1C7 . ' gE'
execute 'noremap ' . s:r1c8 . ' b'
execute 'noremap ' . s:R1C8 . ' B'
execute 'noremap ' . s:r1c9 . ' e'
execute 'noremap ' . s:R1C9 . ' E'
execute 'noremap ' . s:r1c10 . ' w'
execute 'noremap ' . s:R1C10 . ' W'
" right r2
execute 'noremap ' . s:r2c6 . ' t'
execute 'noremap ' . s:R2C6 . ' T'
execute 'noremap ' . s:r2c7 . ' ^'
execute 'noremap ' . s:R2C7 . ' ,'
execute 'noremap ' . s:r2c8 . ' +'
execute 'noremap ' . s:R2C8 . ' <C-e>'
execute 'noremap ' . s:r2c9 . ' -'
execute 'noremap ' . s:R2C9 . ' <C-y>'
execute 'noremap ' . s:r2c10 . ' $'
execute 'noremap ' . s:R2C10 . ' ;'
" right r3
execute 'noremap ' . s:r3c6 . ' /'
execute 'noremap ' . s:R3C6 . ' ?'
execute 'noremap ' . s:r3c7 . ' #'
execute 'noremap ' . s:R3C7 . ' N'
"execute 'noremap ' . s:R3C8 . ' ' // see matchit
execute 'noremap ' . s:r3c8 . ' <C-d>'
"execute 'noremap ' . s:R3C9 . ' ' // see matchit
execute 'noremap ' . s:r3c9 . ' <C-u>'
execute 'noremap ' . s:r3c10 . ' *'
execute 'noremap ' . s:R3C10 . ' n'

" g mappings
noremap q# g#
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap -o g$
noremap qo g_
noremap qn g^
noremap q& g&
noremap q~ g'
noremap q\" g`
noremap q* g*
noremap q+ g+
noremap q, g,
noremap q- g-
noremap qy g-
noremap q0 g0
noremap q8 g8
noremap q< g<
noremap q? g?
noremap q?? g??
noremap q?g? g?g?
noremap qQ gQ
noremap qe ge
noremap qE gE
noremap qV gH
" gI - insert
noremap qS gI
noremap q<S-tab> gD
noremap qD gP
" gR - replace
noremap qP gR
noremap qT gT
noremap qU gU
" gV - visual
noremap qG gV
noremap q] g]
noremap qa ga
noremap qf gf
noremap qF gF
" gg mapped >
" noremap ql gg
noremap qv gh
" gi - insert
noremap qs gi
noremap q<tab> gd
noremap qk gk
noremap q. gn
noremap qh gN
noremap qW gJ
noremap qm gm
noremap qM gM
noremap qO go
noremap qd gp
" noremap q; g; what does this one do? there was a conflict below
noremap q; gq
" gr - replace
noremap qp gr
noremap qs gs
noremap qt gt
noremap qu gu
" gv - visual
noremap qg gv
noremap q: gw
noremap qx gx
noremap q@ g@
noremap q~ g~
noremap q<Down> g<Down>
noremap q<End> g<End>
noremap q<Home> g<Home>
noremap q<LeftMouse> g<LeftMouse>
noremap q<MiddleMouse> g<MiddleMouse>
noremap q<RightMouse> g<RightMouse>
noremap q<Tab> g<Tab>
noremap q<Up> g<Up>

" Text Object Selection
" onoremap g a
" xnoremap g a
" onoremap t i
" xnoremap t i
onoremap G a
xnoremap G a
onoremap g i
xnoremap g i
" execute 'onoremap ' . s:R2C5 . ' a'
" execute 'xnoremap ' . s:R2C5 . ' a'
" execute 'onoremap ' . s:r2c5 . ' i'
" execute 'xnoremap ' . s:r2c5 . ' i'

