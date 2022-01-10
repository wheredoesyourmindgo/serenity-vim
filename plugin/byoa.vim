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
  let s:byoa_keymap = 'qwerty'
endif

if s:byoa_keymap == 'miscreanty'
  let s:r1c1 = "z"
  let s:R1C1 = "Z"
  let s:r1c2 = "j"
  let s:R1C2 = "J"
  let s:r1c3 = "h"
  let s:R1C3 = "H"
  let s:r1c4 = "k"
  let s:R1C4 = "K"
  let s:r1c5 = "q"
  let s:R1C5 = "Q"
  let s:r1c6 = "'"
  let s:R1C6 = "/""
  let s:r1c7 = "w"
  let s:R1C7 = "W"
  let s:r1c8 = "o"
  let s:R1C8 = "O"
  let s:r1c9 = "u"
  let s:R1C9 = "U"
  let s:r1c10 = "="
  let s:R1C10 = "+"
  let s:r2c1 = "s"
  let s:R2C1 = "S"
  let s:r2c2 = "r"
  let s:R2C2 = "R"
  let s:r2c3 = "n"
  let s:R2C3 = "N"
  let s:r2c4 = "t"
  let s:R2C4 = "T"
  let s:r2c5 = "m"
  let s:R2C5 = "M"
  let s:r2c6 = "y"
  let s:R2C6 = "Y"
  let s:r2c7 = "c"
  let s:R2C7 = "C"
  let s:r2c8 = "e"
  let s:R2C8 = "E"
  let s:r2c9 = "i"
  let s:R2C9 = "I"
  let s:r2c10 = "a"
  let s:R2C10 = "A"
  let s:r3c1 = "f"
  let s:R3C1 = "F"
  let s:r3c2 = "l"
  let s:R3C2 = "L"
  let s:r3c3 = "b"
  let s:R3C3 = "B"
  let s:r3c4 = "d"
  let s:R3C4 = "D"
  let s:r3c5 = "v"
  let s:R3C5 = "V"
  let s:r3c6 = "g"
  let s:R3C6 = "G"
  let s:r3c7 = "p"
  let s:R3C7 = "P"
  let s:r3c8 = "`"
  let s:R3C8 = "~"
  let s:r3c9 = ","
  let s:R3C9 = ";"
  let s:r3c10 = "."
  let s:R3C10 = ":"
elseif s:byoa_keymap == 'qwerty'
  let s:r2c10 = ";"
  let s:R2C10 = ":"
endif

" Map leader-g to line comment toggle
map <leader>m <plug>NERDCommenterToggle

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
silent! nmap <unique><silent> js <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> hs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> jS <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> hS <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> bs <Plug>(operator-sandwich-add)
silent! xmap <unique> S <Plug>(operator-sandwich-add)
silent! omap <unique> S <Plug>(operator-sandwich-g@)
" delete
" silent! xmap <unique> ax <Plug>(operator-sandwich-delete)
" replace
" silent! xmap <unique> af <Plug>(operator-sandwich-replace)
let g:textobj_sandwich_no_default_key_mappings = 1
silent! omap <unique> kS <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> kS <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> KS <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> KS <Plug>(textobj-sandwich-auto-a)
silent! omap <unique> ks <Plug>(textobj-sandwich-query-i)
silent! xmap <unique> ks <Plug>(textobj-sandwich-query-i)
silent! omap <unique> Ks <Plug>(textobj-sandwich-query-a)
silent! xmap <unique> Ks <Plug>(textobj-sandwich-query-a)
" vim-surround keymap macro (https://github.com/machakann/vim-sandwich/blob/master/macros/sandwich/keymap/surround.vim)

"let g:sandwich_no_default_key_mappings = 1
"let g:operator_sandwich_no_default_key_mappings = 1
"let g:textobj_sandwich_no_default_key_mappings = 1

nmap bs <Plug>(sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> bss <Plug>(sandwich-add)<SID>line
onoremap <SID>gul g_
nmap <silent> bS <Plug>(sandwich-add)<SID>gul

nmap js <Plug>(sandwich-delete)
nmap jss <Plug>(sandwich-delete-auto)
nmap hs <Plug>(sandwich-replace)
nmap hss <Plug>(sandwich-replace-auto)

xmap S <Plug>(sandwich-add)

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
xmap Ke <Plug>(textobj-entire-a)
omap Ke <Plug>(textobj-entire-a)
xmap ke <Plug>(textobj-entire-i)
omap ke <Plug>(textobj-entire-i)
" vim-textobj-indent
let g:textobj_indent_no_default_key_mappings = 1
xmap Ki <Plug>(textobj-indent-a)
omap Ki <Plug>(textobj-indent-a)
xmap ki <Plug>(textobj-indent-i)
omap ki <Plug>(textobj-indent-i)
xmap KI <Plug>(textobj-indent-same-a)
omap KI <Plug>(textobj-indent-same-a)
xmap kI <Plug>(textobj-indent-same-i))
omap kI <Plug>(textobj-indent-same-i))


" Leaders --------------------------

" Quit w/ save
noremap <leader>z ZZ
" Quit w/o save
noremap <leader>Z ZQ
" Find
noremap ] /
" Find reverse
noremap [ ?
" Find next
noremap ? n
" Find prev
noremap / N
" Till Char
noremap ) t
" Till Char reverse
noremap ( T
" Find Char
noremap > f
" Find Char reverse
noremap < F
" Find/till next
noremap } ;
noremap * ;
" Find/till prev
noremap { ,
noremap & ,
" Extra commands
noremap <leader>x z
" Extra commands (g command)
noremap x g
" G - End of file / Goto line
noremap - G
" Expert mode
noremap <leader>f Q
" Help
noremap <leader><tab> K
" Prev sentence
noremap <leader>h (
" End sentence
noremap <leader>. )
" Next/Previous whitespace, exclusive and inclusive
noremap <leader>n <left>T<space><right>T<space>
noremap <leader>N F<space>
noremap <leader>o <right>t<space><left>t<space>
noremap <leader>O f<space>
" Empty line (remapping leader-del doesn't seem to work in vim)
" noremap <leader><del> 0d$
" Delete line
noremap <leader><bs> dd

" Mod Outer/Mod/Symbol Commands --------------------------

" <esc> fixes an issue where indent occurs again after (un)indenting and moving away from a visual selection
" Indent
nnoremap <leader>t >>
xnoremap <leader>t ><esc>
" Un-indent
nnoremap <leader>r <<
xnoremap <leader>r <<esc>
" swap lines
noremap <leader>s dd<up><up>p
noremap <leader>i ddp

" re-mapping shift-backspace seems impossible
" noremap <S-bs> !#@
" Visual Block Mode
noremap <C-g> <C-v>
noremap <C-v> <nop>
" Record macro
noremap ! q
" External filter
noremap # !
noremap ## !!
" Backspace
noremap <bs> X
" Delete
noremap <del> x
" Command mode
noremap <cr> :
" This is used w/ help mode in order to access command mode
noremap <leader><cr> :
" goto mark
noremap _ `
" goto mark bol
noremap X '
" auto format
noremap $ =
" repeat command
noremap <tab> .

" Alpha Commands --------------------------

" left r1
" noremap q "
" noremap Q m
execute 'noremap ' . s:r1c1 . ' "'
execute 'noremap ' . s:R1C1 . ' m'
" noremap w ~
" noremap W J
execute 'noremap ' . s:r1c2 . ' ~'
execute 'noremap ' . s:R1C2 . ' J'
" noremap f c
" noremap F C
execute 'noremap ' . s:r1c3 . ' c'
execute 'noremap ' . s:R1C3 . ' C'
" noremap p r
" noremap P R
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
execute 'noremap ' . s:r2c5 . ' v'
execute 'noremap ' . s:R2C5 . ' V'
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
" noremap j H
" noremap J zb
execute 'noremap ' . s:r1c6 . ' H'
execute 'noremap ' . s:R1C6 . ' zb'
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
" noremap l ge
" noremap L gE
execute 'noremap ' . s:r1c7 . ' ge'
execute 'noremap ' . s:R1C7 . ' gE'
execute 'noremap ' . s:r1c8 . ' b'
execute 'noremap ' . s:R1C8 . ' B'
execute 'noremap ' . s:r1c9 . ' w'
execute 'noremap ' . s:R1C9 . ' W'
execute 'noremap ' . s:r1c10 . ' e'
execute 'noremap ' . s:R1C10 . ' E'
" right r2
execute 'noremap ' . s:r2c6 . ' M'
execute 'noremap ' . s:R2C6 . ' zz'
execute 'noremap ' . s:r2c7 . ' _'
execute 'noremap ' . s:R2C7 . ' 0'
execute 'noremap ' . s:r2c8 . ' +'
execute 'noremap ' . s:R2C8 . ' <C-e>'
" noremap i -
" noremap I <C-y>
execute 'noremap ' . s:r2c9 . ' -'
execute 'noremap ' . s:R2C9 . ' <C-y>'
execute 'noremap ' . s:r2c10 . ' $'
" execute 'noremap ' . s:R2C10 . ' ;'
" right r3
execute 'noremap ' . s:r3c6 . ' L'
execute 'noremap ' . s:R3C6 . ' zt'
execute 'noremap ' . s:r3c7 . ' {'
" Previous instance of current word
execute 'noremap ' . s:R3C7 . ' #'
execute 'noremap ' . s:r3c8 . ' <C-f>'
execute 'noremap ' . s:R3C8 . ' <C-d>'
execute 'noremap ' . s:r3c9 . ' <C-b>'
execute 'noremap ' . s:R3C9 . ' <C-u>'
execute 'noremap ' . s:r3c10 . ' }'
" Next instance of current word
execute 'noremap ' . s:R3C10 . ' *'
" g mappings
noremap x# g#
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap -o g$
noremap xo g_
noremap xn g^
noremap x& g&
noremap xX g'
noremap x\" g`
noremap x* g*
noremap x+ g+
noremap x, g,
noremap x- g-
noremap xy g-
noremap x0 g0
noremap x8 g8
noremap x< g<
noremap x? g?
noremap x?? g??
noremap x?h? g?g?
" noremap xE gE
noremap xV gH
" gI - insert
noremap xS gI
noremap x<S-tab> gD
noremap xD gP
noremap xe gQ
" gR - replace
noremap xP gR
noremap xT gT
noremap xU gU
" gV - visual
noremap xG gV
noremap x] g]
noremap xa ga
" noremap -e ge
noremap xf gf
noremap xF gF
" gg
noremap xx gg
noremap xv gh
" gi - insert
noremap xs gi
noremap x<tab> gd
noremap xk gk
noremap x. gn
noremap xh gN
noremap xW gJ
noremap xm gm
noremap xM gM
noremap xO go
noremap xd gp
" noremap x; g; what does this one do? there was a conflict below
noremap x; gq
" gr - replace
noremap xp gr
noremap xs gs
noremap xt gt
noremap xu gu
" gv - visual
noremap xg gv
noremap x: gw
"noremap xx gx
noremap x@ g@
noremap xq g~
noremap x<Down> g<Down>
noremap x<End> g<End>
noremap x<Home> g<Home>
noremap x<LeftMouse> g<LeftMouse>
noremap x<MiddleMouse> g<MiddleMouse>
noremap x<RightMouse> g<RightMouse>
noremap x<Tab> g<Tab>
noremap x<Up> g<Up>

" Text Object Selection
" onoremap g a
" xnoremap g a
" onoremap t i
" xnoremap t i
execute 'onoremap ' . s:R2C5 . ' a'
execute 'xnoremap ' . s:R2C5 . ' a'
execute 'onoremap ' . s:r2c5 . ' i'
execute 'xnoremap ' . s:r2c5 . ' i'

