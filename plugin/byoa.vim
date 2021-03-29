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
" Don't use Fugitive mappings
let g:fugitive_no_maps = 1
" Don't use Clever-f mappings
let g:clever_f_not_overwrites_standard_mappings = 1

" Don't use Sandwhich mappings
let g:sandwich_no_default_key_mappings = 1
silent! nmap <unique><silent> ad <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> ar <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> adb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> arb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! nmap <unique> aa <Plug>(operator-sandwich-add)
silent! xmap <unique> aa <Plug>(operator-sandwich-add)
silent! omap <unique> aa <Plug>(operator-sandwich-g@)
" delete
silent! xmap <unique> ad <Plug>(operator-sandwich-delete)
" replace
silent! xmap <unique> ar <Plug>(operator-sandwich-replace)

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
noremap <leader>k M
" Screen Bottom
noremap <leader>, L
" Scroll Top
noremap <leader>y zt
" Scroll Mid
noremap <leader>j zz
" Scroll Bottom
noremap <leader>u zb
" Next instance of current word
noremap <leader>? *
" Previous instance of current word
noremap <leader>H #
" Extra commands
noremap <leader>z z
" Hard Bol
noremap <leader>l 0
" Extra commands (alt)
noremap <leader>g g
" End of file / Goto line (alt)
noremap <leader>G G
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
" Repeat command
noremap <leader><cr> .


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
noremap g v
noremap G V
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
" noremap j f
" noremap J F
nmap j <Plug>(clever-f-f)
xmap j <Plug>(clever-f-f)
omap j <Plug>(clever-f-f)
nmap J <Plug>(clever-f-F)
xmap J <Plug>(clever-f-F)
omap J <Plug>(clever-f-F)
nmap m <Plug>(clever-f-t)
xmap m <Plug>(clever-f-t)
omap m <Plug>(clever-f-t)
nmap M <Plug>(clever-f-T)
xmap M <Plug>(clever-f-T)
omap M <Plug>(clever-f-T)

noremap l _
noremap L ,
noremap u +
noremap U <C-e>
noremap y -
noremap Y <C-y>
" noremap ; ;
execute 'noremap ' . s:r1c10 . ' $'
execute 'noremap ' . s:R1C10 . ' ;'
" right r2
" See clever-f usage above
" noremap m t
" noremap M T
noremap n ge
" noremap N gE
noremap N {
noremap e b
" noremap E B
noremap E (
noremap i w
" noremap I W
noremap I )
noremap o e
" noremap O E
noremap O }
execute 'noremap ' . s:r2c11 . ' :'
" right r3
noremap k /
noremap K ?
noremap h g
noremap H N
noremap , <C-d>
noremap . <C-u>
noremap < <C-f>
noremap > <C-b>
noremap / G
noremap ? n
" g mappings
noremap h# g#
noremap h$ g$
noremap h& g&
noremap h' g'
noremap h` g`
noremap h* g*
noremap h+ g+
noremap h, g,
noremap h- g-
noremap h0 g0
noremap h8 g8
noremap h; g;
noremap h< g<
noremap h? g?
noremap h?? g??
noremap h?h? g?g?
noremap hD gD
noremap hE gE
noremap hH gH
" noremap hI gI
noremap hS gI
noremap hJ gJ
noremap hN gN
noremap hP gP
noremap hQ gQ
" noremap hR gR
noremap hZ gR
noremap hT gT
noremap hU gU
" noremap hV gV
noremap hG gV
noremap h] g]
noremap h^ g^
noremap h_ g_
noremap ha ga
noremap hd gd
noremap he ge
noremap hf gf
noremap hF gF
" noremap hg gg
" noremap hh gh
noremap hh gg
" noremap hg gh
noremap hv gh
" noremap hi gi
noremap hs gi
noremap hj gj
noremap hk gk
noremap hn gn
noremap hm gm
noremap hM gM
noremap ho go
noremap hp gp
noremap hq gq
" noremap hr gr
noremap hz gr
" Sleep is interfering with insert, "l" (think 'lock') is one of the few candidates available
" noremap hs gs
noremap hl gs
noremap ht gt
noremap hu gu
" noremap hv gv
noremap hg gv
noremap hw gw
noremap hx gx
noremap h@ g@
noremap h~ g~
noremap h<Down> g<Down>
noremap h<End> g<End>
noremap h<Home> g<Home>
noremap h<LeftMouse> g<LeftMouse>
noremap h<MiddleMouse> g<MiddleMouse>
noremap h<RightMouse> g<RightMouse>
noremap h<Tab> g<Tab>
noremap h<Up> g<Up>


" Text Object Selection
onoremap aw aw
xnoremap aw aw
onoremap iw iw
xnoremap iw iw
onoremap aW aW
xnoremap aW aW
onoremap iW iW
xnoremap iW iW

onoremap as as
onoremap is is
onoremap ai sp
onoremap ip ip
onoremap a] a]
onoremap a[ a[
onoremap i] i]
onoremap i[ i[
onoremap a) a)
onoremap a( a(
onoremap ab ab
onoremap i) i)
onoremap i( i(
onoremap ib ib
onoremap a> a>
onoremap a< a<
onoremap i> i>
onoremap i< i<
onoremap at at
onoremap it it
onoremap a} a}
onoremap a{ a{
onoremap aB aB
onoremap i} i}	
onoremap i{ i{
onoremap iB iB
onoremap a" a"
onoremap a' a'
onoremap a` a`
onoremap i" i"
onoremap i' i'
onoremap i` i`