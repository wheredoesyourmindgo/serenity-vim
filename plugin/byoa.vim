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
  let s:r1c1 = "v"
  let s:R1C1 = "V"
  let s:r1c2 = "l"
  let s:R1C2 = "L"
  let s:r1c3 = "d"
  let s:R1C3 = "D"
  let s:r1c4 = "w"
  let s:R1C4 = "W"
  let s:r1c5 = "x"
  let s:R1C5 = "X"
  let s:r1c6 = "q"
  let s:R1C6 = "Q"
  let s:r1c7 = "f"
  let s:R1C7 = "F"
  let s:r1c8 = "o"
  let s:R1C8 = "O"
  let s:r1c9 = "u"
  let s:R1C9 = "U"
  let s:r1c10 = "-"
  let s:R1C10 = "_"
  let s:r2c1 = "s"
  let s:R2C1 = "S"
  let s:r2c2 = "r"
  let s:R2C2 = "R"
  let s:r2c3 = "h"
  let s:R2C3 = "H"
  let s:r2c4 = "n"
  let s:R2C4 = "N"
  let s:r2c5 = "y"
  let s:R2C5 = "Y"
  let s:r2c6 = "g"
  let s:R2C6 = "G"
  let s:r2c7 = "t"
  let s:R2C7 = "T"
  let s:r2c8 = "e"
  let s:R2C8 = "E"
  let s:r2c9 = "i"
  let s:R2C9 = "I"
  let s:r2c10 = "a"
  let s:R2C10 = "A"
  let s:r3c1 = "z"
  let s:R3C1 = "Z"
  let s:r3c2 = "j"
  let s:R3C2 = "J"
  let s:r3c3 = "m"
  let s:R3C3 = "M"
  let s:r3c4 = "c"
  let s:R3C4 = "C"
  let s:r3c5 = "b"
  let s:R3C5 = "B"
  let s:r3c6 = "k"
  let s:R3C6 = "K"
  let s:r3c7 = "p"
  let s:R3C7 = "P"
  let s:r3c8 = "'"
  let s:R3C8 = "/""
  let s:r3c9 = ","
  let s:R3C9 = ";"
  let s:r3c10 = "."
  let s:R3C10 = ":"
elseif s:byoa_keymap == 'qwerty'
  let s:r2c10 = ";"
  let s:R2C10 = ":"
endif

" Map leader-g to line comment toggle
map <leader>f <plug>NERDCommenterToggle

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
silent! nmap <unique><silent> ds <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> jS <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> dS <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> ms <Plug>(operator-sandwich-add)
silent! xmap <unique> S <Plug>(operator-sandwich-add)
silent! omap <unique> S <Plug>(operator-sandwich-g@)
" delete
" silent! xmap <unique> ax <Plug>(operator-sandwich-delete)
" replace
" silent! xmap <unique> af <Plug>(operator-sandwich-replace)
let g:textobj_sandwich_no_default_key_mappings = 1
silent! omap <unique> `S <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> `S <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> ~S <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> ~S <Plug>(textobj-sandwich-auto-a)
silent! omap <unique> `s <Plug>(textobj-sandwich-query-i)
silent! xmap <unique> `s <Plug>(textobj-sandwich-query-i)
silent! omap <unique> ~s <Plug>(textobj-sandwich-query-a)
silent! xmap <unique> ~s <Plug>(textobj-sandwich-query-a)
" vim-surround keymap macro (https://github.com/machakann/vim-sandwich/blob/master/macros/sandwich/keymap/surround.vim)

"let g:sandwich_no_default_key_mappings = 1
"let g:operator_sandwich_no_default_key_mappings = 1
"let g:textobj_sandwich_no_default_key_mappings = 1

nmap ms <Plug>(sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> mss <Plug>(sandwich-add)<SID>line
onoremap <SID>gul g_
nmap <silent> mS <Plug>(sandwich-add)<SID>gul

nmap js <Plug>(sandwich-delete)
nmap jss <Plug>(sandwich-delete-auto)
nmap ds <Plug>(sandwich-replace)
nmap dss <Plug>(sandwich-replace-auto)

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
xmap ~e <Plug>(textobj-entire-a)
omap ~e <Plug>(textobj-entire-a)
xmap `e <Plug>(textobj-entire-i)
omap `e <Plug>(textobj-entire-i)
" vim-textobj-indent
let g:textobj_indent_no_default_key_mappings = 1
xmap ~i <Plug>(textobj-indent-a)
omap ~i <Plug>(textobj-indent-a)
xmap `i <Plug>(textobj-indent-i)
omap `i <Plug>(textobj-indent-i)
xmap ~I <Plug>(textobj-indent-same-a)
omap ~I <Plug>(textobj-indent-same-a)
xmap `I <Plug>(textobj-indent-same-i))
omap `I <Plug>(textobj-indent-same-i))


" Leaders --------------------------

" Quit w/ save
" noremap <leader>v ZZ
" Quit w/o save
" noremap <leader>V ZQ

" jump to position
noremap & H
noremap { M
noremap / L
" find prev.
noremap ( <esc>
noremap < <C-e>
noremap [ <esc>
" find next
noremap ) <esc>
noremap > <C-y>
noremap ] <esc>
" scroll to position
noremap * zb
noremap } zz
noremap \ zt

" Hard bol.
noremap <leader>t 0
" Extra commands
noremap ( z
" Extra commands (g command)
noremap ] g
" G - End of file / Goto line
noremap [ G
" Expert mode
noremap ) Q
" Help
noremap <leader><tab> K
" Next/Previous whitespace, exclusive and inclusive
noremap <leader>o <left>T<space><right>T<space>
noremap <leader>O F<space>
noremap <leader>u <right>t<space><left>t<space>
noremap <leader>U f<space>
" Empty line (remapping leader-del doesn't seem to work in vim)
" noremap <leader><del> 0d$
" Delete line
noremap <leader><bs> dd
" Join lines
noremap <leader>d J
" Swap case
noremap <leader>w ~
" Jump to prev. sentence
noremap <leader>f (
" Jump to next sentence
noremap <leader>- )

" Mod Outer/Mod/Symbol Commands --------------------------

" <esc> fixes an issue where indent occurs again after (un)indenting and moving away from a visual selection
" Indent
nnoremap <leader>n >>
xnoremap <leader>n ><esc>
" Un-indent
nnoremap <leader>s <<
xnoremap <leader>s <<esc>
" swap lines
noremap <leader>r dd<up><up>p
noremap <leader>h ddp

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
" auto format
noremap $ =
" repeat command
noremap <tab> .

" Goto Mark
noremap = `
" Goto Mark bol.
noremap + '
" Goto Last edit (= --> . is an awkward sfb)
noremap =` `.
" Goto Last edit bol. (+ --> . is an awkward sfb)
noremap +` '.

" Alpha Commands --------------------------

" left r1
" noremap q "
" noremap Q m
execute 'noremap ' . s:r1c1 . ' m'
" execute 'noremap ' . s:R1C1 . ' `'
" noremap w ~
" noremap W J
execute 'noremap ' . s:r1c2 . ' "'
" execute 'noremap ' . s:R1C2 . ' '
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
execute 'noremap ' . s:r1c6 . ' t'
execute 'noremap ' . s:R1C6 . ' T'
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
execute 'noremap ' . s:r1c9 . ' e'
execute 'noremap ' . s:R1C9 . ' E'
execute 'noremap ' . s:r1c10 . ' w'
execute 'noremap ' . s:R1C10 . ' W'
" right r2
execute 'noremap ' . s:r2c6 . ' f'
execute 'noremap ' . s:R2C6 . ' F'
" noremap i -
" noremap I <C-y>
execute 'noremap ' . s:r2c7 . ' _'
execute 'noremap ' . s:R2C7 . ' ,'
execute 'noremap ' . s:r2c8 . ' +'
execute 'noremap ' . s:R2C8 . ' }'
execute 'noremap ' . s:r2c9 . ' -'
execute 'noremap ' . s:R2C9 . ' {'
execute 'noremap ' . s:r2c10 . ' $'
execute 'noremap ' . s:R2C10 . ' ;'
" right r3
execute 'noremap ' . s:r3c6 . ' /'
execute 'noremap ' . s:R3C6 . ' ?'
execute 'noremap ' . s:r3c7 . ' #'
execute 'noremap ' . s:R3C7 . ' N'
execute 'noremap ' . s:r3c8 . ' <C-f>'
execute 'noremap ' . s:R3C8 . ' <C-d>'
execute 'noremap ' . s:r3c9 . ' <C-b>'
execute 'noremap ' . s:R3C9 . ' <C-u>'
execute 'noremap ' . s:r3c10 . ' *'
execute 'noremap ' . s:R3C10 . ' n'

" g mappings
noremap ]# g#
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap -o g$
noremap ]o g_
noremap ]n g^
noremap ]& g&
noremap ]~ g'
noremap ]\" g`
noremap ]* g*
noremap ]+ g+
noremap ], g,
noremap ]- g-
noremap ]y g-
noremap ]0 g0
noremap ]8 g8
noremap ]< g<
noremap ]? g?
noremap ]?? g??
noremap ]?h? g?g?
" noremap ]E gE
noremap ]V gH
" gI - insert
noremap ]S gI
noremap ]<S-tab> gD
noremap ]D gP
noremap ]e gQ
" gR - replace
noremap ]P gR
noremap ]T gT
noremap ]U gU
" gV - visual
noremap ]G gV
noremap ]] g]
noremap ]a ga
" noremap -e ge
noremap ]f gf
noremap ]F gF
" gg
noremap ]] gg
noremap ]v gh
" gi - insert
noremap ]s gi
noremap ]<tab> gd
noremap ]k gk
noremap ]. gn
noremap ]h gN
noremap ]W gJ
noremap ]m gm
noremap ]M gM
noremap ]O go
noremap ]d gp
" noremap ]; g; what does this one do? there was a conflict below
noremap ]; gq
" gr - replace
noremap ]p gr
noremap ]s gs
noremap ]t gt
noremap ]u gu
" gv - visual
noremap ]g gv
noremap ]: gw
noremap ]x gx
noremap ]@ g@
noremap ]q g~
noremap ]<Down> g<Down>
noremap ]<End> g<End>
noremap ]<Home> g<Home>
noremap ]<LeftMouse> g<LeftMouse>
noremap ]<MiddleMouse> g<MiddleMouse>
noremap ]<RightMouse> g<RightMouse>
noremap ]<Tab> g<Tab>
noremap ]<Up> g<Up>

" Text Object Selection
" onoremap g a
" xnoremap g a
" onoremap t i
" xnoremap t i
onoremap ~ a
xnoremap ~ a
onoremap ` i
xnoremap ` i
" execute 'onoremap ' . s:R2C5 . ' a'
" execute 'xnoremap ' . s:R2C5 . ' a'
" execute 'onoremap ' . s:r2c5 . ' i'
" execute 'xnoremap ' . s:r2c5 . ' i'

