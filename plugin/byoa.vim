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
  let s:byoa_keymap = 'colemak-dh'
endif

if s:byoa_keymap == 'colemak-dh'
  let s:r1c10 = ";"
  let s:R1C10 = ":"
  let s:r2c11 = "'"
elseif s:byoa_keymap == 'qwerty'
  let s:r1c10 = "p"
  let s:R1C10 = "P"
endif

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
silent! nmap <unique><silent> x' <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> f' <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> x'a <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> f'a <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> c' <Plug>(operator-sandwich-add)
silent! xmap <unique> ' <Plug>(operator-sandwich-add)
silent! omap <unique> ' <Plug>(operator-sandwich-g@)
" delete
silent! xmap <unique> sx <Plug>(operator-sandwich-delete)
" replace
silent! xmap <unique> sf <Plug>(operator-sandwich-replace)
let g:textobj_sandwich_no_default_key_mappings = 1
silent! omap <unique> g'a <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> g'a <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> G'a <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> G'a <Plug>(textobj-sandwich-auto-a)
silent! omap <unique> g' <Plug>(textobj-sandwich-query-i)
silent! xmap <unique> g' <Plug>(textobj-sandwich-query-i)
silent! omap <unique> G' <Plug>(textobj-sandwich-query-a)
silent! xmap <unique> G' <Plug>(textobj-sandwich-query-a)
" Default recipes (See https://github.com/machakann/vim-sandwich/blob/9e6340affe9f53c11a6975a5f50b9bf48adb692c/macros/sandwich/keymap/surround.vim#L25)
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

" Leaders --------------------------

" Quit w/ save
noremap <leader>q ZZ
" Quit w/o save
noremap <leader>Q ZQ
" Screen Top
noremap <leader>. H
" Screen Mid
noremap <leader>< M
noremap <leader>> M
" Screen Bottom
noremap <leader>, L
" Scroll Top
noremap <leader>y zt
" Scroll Mid
noremap <leader>U zz
noremap <leader>Y zz
" Scroll Bottom
noremap <leader>u zb
" Next instance of current word
noremap <leader>/ *
" Previous instance of current word
noremap <leader>h #
" Extra commands
noremap <leader>z z
" Hard Bol
noremap <leader>l 0
" Extra commands
noremap <cr> g
" Expert mode
noremap <leader>x Q
" Prev. end word (non-whitespace)
noremap <leader>n gE
" Prev. beginning word (non-whitespace)
noremap <leader>e B
" Prev. beginning word (non-whitespace)
noremap <leader>i W
" Prev. end word (non-whitespace)
noremap <leader>o E
" Help
noremap <leader>b K
" Goto mark
noremap <leader>m `
" Goto mark bol
noremap <leader>M '
" G - End of file / Goto line
noremap <leader><cr> G
" Prev sentence
noremap <leader>n (
" End sentence
noremap <leader>o )
" Next/Previous whitespace, exclusive and inclusive
noremap <leader>e <left>T<space><right>T<space>
noremap <leader>E F<space>
noremap <leader>i <right>t<space><left>t<space>
noremap <leader>I f<space>


" Mod Outer/Mod/Symbol Commands --------------------------

" <esc> fixes an issue where indent occurs again after (un)indenting and moving away from a visual selection
" Indent
noremap <tab> >><esc>
" Un-indent
noremap <S-tab> <<<esc>
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
" Delete (additional)
noremap <del> x
" Command mode
noremap ' :
" Repeat Command
noremap " .
" g
noremap <cr> g

" Alpha Commands --------------------------

" left r1
noremap q ~
noremap Q m
noremap w r
noremap W R
noremap f c
noremap F C
noremap p x
noremap P J
map b <Plug>(wildfire-fuel)
vmap B <Plug>(wildfire-water)
" left r2
noremap a s
noremap A S
noremap r i
noremap R I
noremap s a
noremap S A
noremap t o
noremap T O
nnoremap g v
nnoremap G V
" left r3
noremap z u
noremap Z U
noremap x d
noremap X D
noremap c y
noremap C Y
noremap d p
noremap D P
noremap v <C-r>
noremap V "
" right r1
noremap j f
noremap J F
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

noremap l _
noremap L ,
" nmap L <Plug>(clever-f-repeat-back)
noremap u +
noremap U <C-e>
noremap y -
noremap Y <C-y>
" noremap ; ;
execute 'noremap ' . s:r1c10 . ' $'
execute 'noremap ' . s:R1C10 . ' ;'
" execute 'nmap ' . s:R1C10 . ' <Plug>(clever-f-repeat-forward)'
" right r2
" comment out these lines when using clever-f
noremap m t
noremap M T
noremap n ge
noremap N gE
noremap e b
noremap E B
noremap i w
noremap I W
noremap o e
noremap O E
" right r3
noremap k /
noremap K ?
noremap h {
noremap H N
noremap < <C-d>
noremap > <C-u>
noremap , <C-f>
noremap . <C-b>
noremap / }
noremap ? n
" g mappings
noremap <cr># g#
noremap <cr>$ g$
noremap <cr>& g&
noremap <cr>' g'
noremap <cr>` g`
noremap <cr>* g*
noremap <cr>+ g+
noremap <cr>, g,
noremap <cr>- g-
noremap <cr>0 g0
noremap <cr>8 g8
noremap <cr>; g;
noremap <cr>< g<
noremap <cr>? g?
noremap <cr>?? g??
noremap <cr>?h? g?g?
noremap <cr>D gD
noremap <cr>E gE
noremap <cr>H gH
" gI - insert
noremap <cr>S gI
noremap <cr>J gJ
noremap <cr>N gN
noremap <cr>P gP
noremap <cr>Q gQ
" gR - replace
noremap <cr>W gR
noremap <cr>T gT
noremap <cr>U gU
" gV - visual
noremap <cr>G gV
noremap <cr>] g]
noremap <cr>^ g^
noremap <cr>_ g_
noremap <cr>a ga
noremap <cr>d gd
noremap <cr>e ge
noremap <cr>f gf
noremap <cr>F gF
" gg
noremap <cr><cr> gg
noremap <cr>h gh
noremap <cr>v gh
" gi - insert
noremap <cr>s gi
noremap <cr>j gj
noremap <cr>k gk
noremap <cr>n gn
noremap <cr>m gm
noremap <cr>M gM
noremap <cr>o go
noremap <cr>p gp
noremap <cr>q gq
" gr - replace
noremap <cr>z gr
" Sleep is interfering with insert, "l" (think 'lock') is one of the few candidates available
" gs - sleep
noremap <cr>l gs
noremap <cr>t gt
noremap <cr>u gu
" gv - visual
noremap <cr>g gv
noremap <cr>w gw
noremap <cr>x gx
noremap <cr>@ g@
noremap <cr>~ g~
noremap <cr><Down> g<Down>
noremap <cr><End> g<End>
noremap <cr><Home> g<Home>
noremap <cr><LeftMouse> g<LeftMouse>
noremap <cr><MiddleMouse> g<MiddleMouse>
noremap <cr><RightMouse> g<RightMouse>
noremap <cr><Tab> g<Tab>
noremap <cr><Up> g<Up>

" Text Object Selection
" onoremap g a
" xnoremap g a
" onoremap t i
" xnoremap t i
onoremap G a
xnoremap G a
onoremap g i
xnoremap g i
" onoremap gw aw
" xnoremap gw aw
" onoremap tw iw
" xnoremap tw iw
" onoremap gW aW
" xnoremap gW aW
" onoremap tW iW
" xnoremap tW iW
" onoremap gs as
" xnoremap gs as
" onoremap ts is
" xnoremap ts is
" onoremap gp ap
" xnoremap gp ap
" onoremap tp ip
" xnoremap tp ip
" onoremap g] a]
" xnoremap g] a]
" onoremap g[ a[
" xnoremap g[ a[
" onoremap t] i]
" xnoremap t] i]
" onoremap t[ i[
" xnoremap t[ i[
" onoremap g) a)
" xnoremap g) a)
" onoremap g( a(
" xnoremap g( a(
" onoremap gb ab
" xnoremap gb ab
" onoremap t) i)
" xnoremap t) i)
" onoremap t( i(
" xnoremap t( i(
" onoremap tb ib
" xnoremap tb ib
" onoremap g> a>
" xnoremap g> a>
" onoremap g< a<
" xnoremap g< a<
" onoremap t> i>
" xnoremap t> i>
" onoremap t< i<
" xnoremap t< i<
" onoremap gt at
" xnoremap gt at
" onoremap tt it
" xnoremap tt it
" onoremap g} a}
" xnoremap g} a}
" onoremap g{ a{
" xnoremap g{ a{
" onoremap gB aB
" xnoremap gB aB
" onoremap t} i}	
" xnoremap t} i}	
" onoremap t{ i{
" xnoremap t{ i{
" onoremap tB iB
" xnoremap tB iB
" onoremap g" a"
" xnoremap g" a"
" onoremap g' a'
" xnoremap g' a'
" onoremap g` a`
" xnoremap g` a`
" onoremap t" i"
" xnoremap t" i"
" onoremap t' i'
" xnoremap t' i'
" onoremap t` i`
" xnoremap t` i`