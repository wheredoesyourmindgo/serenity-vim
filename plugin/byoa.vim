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
  let s:r2c10 = "o"
  let s:R2C10 = "O"
elseif s:byoa_keymap == 'qwerty'
  let s:r2c10 = ";"
  let s:R2C10 = ":"
endif

" Map double quote to line comment toggle
map " <plug>NERDCommenterToggle

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

" vim-textobj-entire
let g:textobj_entire_no_default_key_mappings = 1
xmap Ge <Plug>(textobj-entire-a)
omap Ge <Plug>(textobj-entire-a)
xmap ge <Plug>(textobj-entire-i)
omap ge <Plug>(textobj-entire-i)
" vim-textobj-indent
let g:textobj_indent_no_default_key_mappings = 1
xmap Gi <Plug>(textobj-indent-a)
omap Gi <Plug>(textobj-indent-a)
xmap gi <Plug>(textobj-indent-i)
omap gi <Plug>(textobj-indent-i)
xmap GI <Plug>(textobj-indent-same-a)
omap GI <Plug>(textobj-indent-same-a)
xmap gI <Plug>(textobj-indent-same-i))
omap gI <Plug>(textobj-indent-same-i))


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
noremap <leader>i zt
" Scroll Mid
noremap <leader>E zz
noremap <leader>I zz
" Scroll Bottom
noremap <leader>e zb
" Next instance of current word
noremap <leader>/ *
" Previous instance of current word
noremap <leader>h #
" Extra commands
noremap <leader>z z
" Hard Bol
noremap <leader>n 0
" Extra commands
noremap <cr> g
" Expert mode
noremap <leader>x Q
" Help
noremap <leader>` K
" G - End of file / Goto line
noremap <leader><cr> G
" Prev sentence
noremap <leader>l (
" End sentence
noremap <leader>; )
" Next/Previous whitespace, exclusive and inclusive
noremap <leader>u <left>T<space><right>T<space>
noremap <leader>U F<space>
noremap <leader>y <right>t<space><left>t<space>
noremap <leader>Y f<space>


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
" Delete
noremap <del> x
" Command mode
noremap ' :
" g
noremap <cr> g
" goto mark bol
noremap ~ '

" Alpha Commands --------------------------

" left r1
noremap q ~
noremap Q J
noremap w r
noremap W R
noremap f c
noremap F C
noremap p "
noremap P m
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
noremap V .
" right r1
noremap j T
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
noremap l ge
noremap L gE
noremap u b
noremap U B
noremap y w
noremap Y W
noremap ; e
noremap : E
" right r2
noremap m t
noremap M f
noremap n _
noremap N ,
" nmap N <Plug>(clever-f-repeat-back)
noremap e +
noremap E <C-e>
noremap i -
noremap I <C-y>
" noremap ; ;
execute 'noremap ' . s:r2c10 . ' $'
execute 'noremap ' . s:R2C10 . ' ;'
" execute 'nmap ' . s:R2C10 . ' <Plug>(clever-f-repeat-forward)'
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
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap <cr>o g$
noremap <cr>o g_
noremap <cr>n g^
noremap <cr>& g&
noremap <cr>~ g'
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
" noremap <cr>E gE
noremap <cr>V gH
" gI - insert
noremap <cr>S gI
noremap <cr><S-tab> gD
noremap <cr>N gN
noremap <cr>D gP
noremap <cr>e gQ
" gR - replace
noremap <cr>W gR
noremap <cr>T gT
noremap <cr>U gU
" gV - visual
noremap <cr>G gV
noremap <cr>] g]
noremap <cr>a ga
" noremap <cr>e ge
noremap <cr>f gf
noremap <cr>F gF
" gg
noremap <cr><cr> gg
noremap <cr>v gh
" gi - insert
noremap <cr>s gi
noremap <cr><tab> gd
noremap <cr>k gk
noremap <cr>/ gn
noremap <cr>h gN
noremap <cr>m gm
noremap <cr>M gM
noremap <cr>O go
noremap <cr>d gp
noremap <cr>; gq
" gr - replace
noremap <cr>w gr
noremap <cr>s gs
noremap <cr>t gt
noremap <cr>u gu
" gv - visual
noremap <cr>g gv
noremap <cr>: gw
noremap <cr>x gx
noremap <cr>@ g@
noremap <cr>q g~
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