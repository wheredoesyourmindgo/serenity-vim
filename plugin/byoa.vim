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
  let s:r1c3 = "d"
  let s:R1C3 = "D"
  let s:r1c4 = "w"
  let s:R1C4 = "W"
  let s:r1c5 = "z"
  let s:R1C5 = "Z"
  let s:r1c6 = "k"
  let s:R1C6 = "K"
  let s:r1c7 = "f"
  let s:R1C7 = "F"
  let s:r1c8 = "o"
  let s:R1C8 = "O"
  let s:r1c9 = "u"
  let s:R1C9 = "U"
  let s:r1c10 = ";"
  let s:R1C10 = ":"
  let s:r2c1 = "n"
  let s:R2C1 = "N"
  let s:r2c2 = "r"
  let s:R2C2 = "R"
  let s:r2c3 = "t"
  let s:R2C3 = "T"
  let s:r2c4 = "s"
  let s:R2C4 = "S"
  let s:r2c5 = "g"
  let s:R2C5 = "G"
  let s:r2c6 = "y"
  let s:R2C6 = "Y"
  let s:r2c7 = "h"
  let s:R2C7 = "H"
  let s:r2c8 = "e"
  let s:R2C8 = "E"
  let s:r2c9 = "i"
  let s:R2C9 = "I"
  let s:r2c10 = "a"
  let s:R2C10 = "A"
  let s:r3c1 = "b"
  let s:R3C1 = "B"
  let s:r3c2 = "j"
  let s:R3C2 = "J"
  let s:r3c3 = "m"
  let s:R3C3 = "M"
  let s:r3c4 = "c"
  let s:R3C4 = "C"
  let s:r3c5 = "x"
  let s:R3C5 = "X"
  let s:r3c6 = "v"
  let s:R3C6 = "V"
  let s:r3c7 = "p"
  let s:R3C7 = "P"
  let s:r3c8 = "'"
  let s:R3C8 = '"'
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
map <leader>f <Plug>CamelCaseMotion_ge
map <leader>o <Plug>CamelCaseMotion_b
map <leader>u <Plug>CamelCaseMotion_e
map <leader>; <Plug>CamelCaseMotion_w
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
silent! nmap <unique><silent> jn <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> dn <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> jN <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> dN <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> mn <Plug>(operator-sandwich-add)
silent! xmap <unique> N <Plug>(operator-sandwich-add)
silent! omap <unique> N <Plug>(operator-sandwich-g@)
" delete
" silent! xmap <unique> ax <Plug>(operator-sandwich-delete)
" replace
" silent! xmap <unique> af <Plug>(operator-sandwich-replace)
let g:textobj_sandwich_no_default_key_mappings = 1
silent! omap <unique> gN <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> gN <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> GN <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> GN <Plug>(textobj-sandwich-auto-a)
silent! omap <unique> gn <Plug>(textobj-sandwich-query-i)
silent! xmap <unique> gn <Plug>(textobj-sandwich-query-i)
silent! omap <unique> Gn <Plug>(textobj-sandwich-query-a)
silent! xmap <unique> Gn <Plug>(textobj-sandwich-query-a)
" vim-surround keymap macro (https://github.com/machakann/vim-sandwich/blob/master/macros/sandwich/keymap/surround.vim)

"let g:sandwich_no_default_key_mappings = 1
"let g:operator_sandwich_no_default_key_mappings = 1
"let g:textobj_sandwich_no_default_key_mappings = 1

nmap mn <Plug>(sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> mnn <Plug>(sandwich-add)<SID>line
onoremap <SID>gul g_
nmap <silent> mN <Plug>(sandwich-add)<SID>gul

nmap jn <Plug>(sandwich-delete)
nmap jnn <Plug>(sandwich-delete-auto)
nmap dn <Plug>(sandwich-replace)
nmap dnn <Plug>(sandwich-replace-auto)

xmap N <Plug>(sandwich-add)

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


" Leaders --------------------------

" Quit w/ save
" noremap <leader>v ZZ
" Quit w/o save
" noremap <leader>V ZQ

" jump to position
noremap <leader>7 H
noremap <leader><left> M
noremap <leader><home> L
" scroll to position
noremap <leader>0 zb
noremap <leader><right> zz
noremap <leader><end> zt
noremap ? <esc>
noremap / <esc>
noremap \ <esc>
" Bracket commands
noremap ] ]
noremap [ [
" matchit plugin commands
" (| pipe symbol must be escaped, or use <bar>)
" map <Bar> %
" there is some asymetry between vim's matchit plugin and vscodes emmet command and '%' command
map ` %
map / [%
map } ]%
map \ %
map { %
noremap ( <Esc>
noremap ) <Esc>
noremap & <Esc>
noremap * <Esc>
" Help
noremap <leader><tab> K
" Bracket cmds
noremap <leader>< ]
noremap <leader>> [
" Bol. down
noremap <home> _
" Hard Bol.
noremap <S-Home> 0
" Eol.
noremap <End> $
" Pg up
noremap <PageUp> <C-b>
" Half Pg up
" todo - shifted pageup & pagedown not working in terminal vim, only gvim.
noremap <S-PageUp> <C-u>
" Pg down
noremap <PageDown> <C-f>
" Half Pg down
noremap <S-PageDown> <C-d>
" Expert mode
noremap @ Q

" <esc> fixes an issue where indent occurs again after (un)indenting and moving away from a visual selection
" Indent
nnoremap <leader>s >>
xnoremap <leader>s ><esc>
" Un-indent
nnoremap <leader>n <<
xnoremap <leader>n <<esc>
" swap lines
noremap <leader>r ddp
noremap <leader>t dd<up><up>p
" Join lines
noremap # J
" Swap case
noremap $ ~
" Toggle fold
noremap <leader>z za

" re-mapping shift-backspace seems impossible
" noremap <S-bs> !#@
" Visual Block Mode
noremap <C-y> <C-v>
noremap <C-v> <nop>
" Record macro
noremap ! q
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

" Goto Mark
noremap = `
" Goto Mark bol.
noremap + '
" Goto Last edit (= --> . is an awkward sfb)
noremap =- `.
" Goto Last edit bol. (+ --> . is an awkward sfb)
noremap +- '.
" Goto prev jump
noremap == ``
" Goto prev jump bol.
noremap ++ ''
" Set mark
noremap - m

" Alpha Commands --------------------------

" left r1
" noremap q "
" noremap Q m
execute 'noremap ' . s:r1c1 . ' "'
" execute 'noremap ' . s:R1C1 . ' `'
" noremap w ~
" noremap W J
execute 'noremap ' . s:r1c2 . ' g'
execute 'noremap ' . s:R1C2 . ' z'
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
execute 'noremap ' . s:r2c7 . ' ,'
execute 'noremap ' . s:R2C7 . ' ('
execute 'noremap ' . s:r2c8 . ' +'
execute 'noremap ' . s:R2C8 . ' G'
execute 'noremap ' . s:r2c9 . ' -'
execute 'noremap ' . s:R2C9 . ' gg'
execute 'noremap ' . s:r2c10 . ' ;'
execute 'noremap ' . s:R2C10 . ' )'
" right r3
execute 'noremap ' . s:r3c6 . ' /'
execute 'noremap ' . s:R3C6 . ' ?'
execute 'noremap ' . s:r3c7 . ' N'
execute 'noremap ' . s:R3C7 . ' #'
execute 'noremap ' . s:r3c8 . ' 2<C-e>'
execute 'noremap ' . s:R3C8 . ' }'
execute 'noremap ' . s:r3c9 . ' 2<C-y>'
execute 'noremap ' . s:R3C9 . ' {'
execute 'noremap ' . s:r3c10 . ' n'
execute 'noremap ' . s:R3C10 . ' *'

" g mappings
noremap l# g#
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap -o g$
noremap lo g_
noremap ln g^
noremap l& g&
noremap l~ g'
noremap l\" g`
noremap l* g*
noremap l+ g+
noremap l, g,
noremap l- g-
noremap ly g-
noremap l0 g0
noremap l8 g8
noremap l< g<
noremap l? g?
noremap l?? g??
noremap l?g? g?g?
noremap lQ gQ
noremap le ge
noremap lE gE
noremap lV gH
" gI - insert
noremap lS gI
noremap l<S-tab> gD
noremap lD gP
" gR - replace
noremap lP gR
noremap lT gT
noremap lU gU
" gV - visual
noremap lG gV
noremap l] g]
noremap la ga
noremap lf gf
noremap lF gF
" gg mapped >
" noremap ll gg
noremap lv gh
" gi - insert
noremap ls gi
noremap l<tab> gd
noremap lk gk
noremap l. gn
noremap lh gN
noremap lW gJ
noremap lm gm
noremap lM gM
noremap lO go
noremap ld gp
" noremap l; g; what does this one do? there was a conflict below
noremap l; gq
" gr - replace
noremap lp gr
noremap ls gs
noremap lt gt
noremap lu gu
" gv - visual
noremap lg gv
noremap l: gw
noremap lx gx
noremap l@ g@
noremap l~ g~
noremap l<Down> g<Down>
noremap l<End> g<End>
noremap l<Home> g<Home>
noremap l<LeftMouse> g<LeftMouse>
noremap l<MiddleMouse> g<MiddleMouse>
noremap l<RightMouse> g<RightMouse>
noremap l<Tab> g<Tab>
noremap l<Up> g<Up>

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

