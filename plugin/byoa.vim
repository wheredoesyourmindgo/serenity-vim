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
  let s:r2c10 = "a"
  let s:R2C10 = "A"
elseif s:byoa_keymap == 'qwerty'
  let s:r2c10 = ";"
  let s:R2C10 = ":"
endif

" Map leader enter to line comment toggle
map <leader><cr> <plug>NERDCommenterToggle

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
silent! nmap <unique><silent> xo <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> fo <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> xO <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> fO <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> co <Plug>(operator-sandwich-add)
silent! xmap <unique> O <Plug>(operator-sandwich-add)
silent! omap <unique> O <Plug>(operator-sandwich-g@)
" delete
" silent! xmap <unique> ax <Plug>(operator-sandwich-delete)
" replace
" silent! xmap <unique> af <Plug>(operator-sandwich-replace)
let g:textobj_sandwich_no_default_key_mappings = 1
silent! omap <unique> gO <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> gO <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> GO <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> GO <Plug>(textobj-sandwich-auto-a)
silent! omap <unique> go <Plug>(textobj-sandwich-query-i)
silent! xmap <unique> go <Plug>(textobj-sandwich-query-i)
silent! omap <unique> Go <Plug>(textobj-sandwich-query-a)
silent! xmap <unique> Go <Plug>(textobj-sandwich-query-a)
" vim-surround keymap macro
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> coo <Plug>(operator-sandwich-add)<SID>line
onoremap <SID>gul g_
nmap cO co<SID>gul
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
" Find
noremap ] /
" Find reverse
noremap [ ?
" Find next
noremap \ n
" Find prev
noremap _ N
" Till Char
noremap ) t
" Till Char reverse
noremap ( T
" Find Char
noremap } f
" Find Char reverse
noremap { F
" Find/till next
noremap \| ;
noremap * ;
" Find/till prev
noremap - ,
noremap & ,
" Extra commands
noremap <leader>` z
" Extra commands (g command)
noremap ` g
" G - End of file / Goto line
noremap ' G
" Expert mode
noremap <leader>x Q
" Help
noremap <leader><tab> K
" Prev sentence
noremap <leader>h (
" End sentence
noremap <leader>/ )
" Next/Previous whitespace, exclusive and inclusive
noremap <leader>n <left>T<space><right>T<space>
noremap <leader>N F<space>
noremap <leader>o <right>t<space><left>t<space>
noremap <leader>O f<space>
" Empty line (neither of these work)
" noremap <leader><del> 0d$
map <leader><del> O<esc>
" Delete line
noremap <leader><bs> dd


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
noremap <cr> :
" goto mark
noremap \" `
" goto mark bol
noremap ~ '

" Alpha Commands --------------------------

" left r1
noremap q "
noremap Q m
noremap w r
noremap W R
noremap f c
noremap F C
noremap p ~
noremap P J
map b <Plug>(wildfire-fuel)
vmap B <Plug>(wildfire-water)
" left r2
noremap o s
" Using A in visual mode w/ vim-sandwhich
nnoremap O S
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
noremap j H
noremap K zt
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
noremap m M
noremap M zz
noremap n _
noremap N 0
noremap e +
noremap E <C-e>
noremap i -
noremap I <C-y>
execute 'noremap ' . s:r2c10 . ' $'
" execute 'noremap ' . s:R2C10 . ' ;'
" right r3
noremap k L
noremap J zb
noremap h {
" Previous instance of current word
noremap H #
noremap < <C-d>
noremap > <C-u>
noremap , <C-f>
noremap . <C-b>
noremap / }
" Next instance of current word
noremap ? *
" g mappings
noremap `# g#
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap `o g$
noremap `o g_
noremap `n g^
noremap `& g&
noremap `~ g'
noremap `\" g`
noremap `* g*
noremap `+ g+
noremap `, g,
noremap `- g-
noremap `0 g0
noremap `8 g8
noremap `; g;
noremap `< g<
noremap `? g?
noremap `?? g??
noremap `?h? g?g?
" noremap `E gE
noremap `V gH
" gI - insert
noremap `S gI
noremap `<S-tab> gD
noremap `N gN
noremap `D gP
noremap `e gQ
" gR - replace
noremap `W gR
noremap `T gT
noremap `U gU
" gV - visual
noremap `G gV
noremap `] g]
noremap `a ga
" noremap `e ge
noremap `f gf
noremap `F gF
" gg
noremap `` gg
noremap `v gh
" gi - insert
noremap `s gi
noremap `<tab> gd
noremap `k gk
noremap `/ gn
noremap `h gN
noremap `P gJ
noremap `m gm
noremap `M gM
noremap `O go
noremap `d gp
noremap `; gq
" gr - replace
noremap `w gr
noremap `s gs
noremap `t gt
noremap `u gu
" gv - visual
noremap `g gv
noremap `: gw
noremap `x gx
noremap `@ g@
noremap `q g~
noremap `<Down> g<Down>
noremap `<End> g<End>
noremap `<Home> g<Home>
noremap `<LeftMouse> g<LeftMouse>
noremap `<MiddleMouse> g<MiddleMouse>
noremap `<RightMouse> g<RightMouse>
noremap `<Tab> g<Tab>
noremap `<Up> g<Up>

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