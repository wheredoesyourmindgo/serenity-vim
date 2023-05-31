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

" Comment line toggle
if exists('g:vscode')
  nnoremap <leader>c <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
  vnoremap <leader>c <Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 1)<CR>
else
  " Opt out of default mappings
  let g:NERDCreateDefaultMappings = 0
  " Map leader-g to line comment toggle
  map <leader>c <plug>NERDCommenterToggle
endif

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
" TODO - Setup custom Insert mappings
let g:surround_no_insert_mappings = 1
nmap xm  <Plug>Dsurround
nmap cm  <Plug>Csurround
nmap cM  <Plug>CSurround
nmap wm  <Plug>Ysurround
nmap wM  <Plug>YSurround
nmap wmm <Plug>Yssurround
nmap wMm <Plug>YSsurround
nmap wMM <Plug>YSsurround
xmap M   <Plug>VSurround
xmap gM  <Plug>VgSurround

if !hasmapto('<Plug>(RepeatDot)', 'n')
    nmap <tab> <Plug>(RepeatDot)
endif
if !hasmapto('<Plug>(RepeatUndo)', 'n')
    nmap v <Plug>(RepeatUndo)
endif
if maparg('U','n') ==# '' && !hasmapto('<Plug>(RepeatUndoLine)', 'n')
    nmap V <Plug>(RepeatUndoLine)
endif
if !hasmapto('<Plug>(RepeatRedo)', 'n')
    nmap z <Plug>(RepeatRedo)
endif


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
" vim-textobj-line
let g:textobj_line_no_default_key_mappings = 1
xmap gl <Plug>(textobj-line-i)
omap gl <Plug>(textobj-line-i)
xmap Gl <Plug>(textobj-line-a)
omap Gl <Plug>(textobj-line-a)

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
" use plugin with %(^) and match tag leader
nmap <silent> ^ <Plug>(MatchitNormalForward)
xmap <silent> ^ <Plug>(MatchitVisualForward)
omap <silent> ^ <Plug>(MatchitOperationForward)
nmap <silent> <leader>t <Plug>(MatchitNormalForward)
xmap <silent> <leader>t <Plug>(MatchitVisualForward)
omap <silent> <leader>t <Plug>(MatchitOperationForward)
" Text object
xmap g% <Plug>(MatchitVisualTextObject)


" Leaders --------------------------

" Quit w/ save
" noremap <leader>v ZZ
" Quit w/o save
" noremap <leader>V ZQ


" (| note, pipe symbol must be escaped, or use <bar>)
" noremap <bar> **

" Show Hover
if exists('g:vscode')
  nnoremap <leader>p <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
endif
" Goto Definition
if exists('g:vscode')
  nnoremap <leader>d <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
else
  noremap <leader>d gD
endif

" jump to position
if exists('g:vscode')
  function s:moveCursor(to)
    " Native VSCode commands don't register jumplist. Fix by registering jumplist in Vim e.g. for subsequent use of <C-o>
    normal! _'
    call VSCodeExtensionNotify('move-cursor', a:to)
  endfunction

  nnoremap <leader>o <Cmd>call <SID>moveCursor('top')<CR>
  xnoremap <leader>o <Cmd>call <SID>moveCursor('top')<CR>
  nnoremap <leader>e <Cmd>call <SID>moveCursor('middle')<CR>
  xnoremap <leader>e <Cmd>call <SID>moveCursor('middle')<CR>
  nnoremap <leader>/ <Cmd>call <SID>moveCursor('bottom')<CR>
  xnoremap <leader>/ <Cmd>call <SID>moveCursor('bottom')<CR>
else
  noremap <leader>/ L
  noremap <leader>o H
  noremap <leader>e M
endif

" scroll to position
if exists('g:vscode')
  function s:reveal(direction, resetCursor)
    call VSCodeExtensionNotify('reveal', a:direction, a:resetCursor)
  endfunction

  nnoremap <silent> <leader>U :<C-u>call <SID>reveal('top', 1)<CR>
  xnoremap <silent> <leader>U :<C-u>call <SID>reveal('top', 1)<CR>
  nnoremap <silent> <leader>u :<C-u>call <SID>reveal('top', 0)<CR>
  xnoremap <silent> <leader>u :<C-u>call <SID>reveal('top', 0)<CR>
  nnoremap <silent> <leader>I :<C-u>call <SID>reveal('center', 1)<CR>
  xnoremap <silent> <leader>I :<C-u>call <SID>reveal('center', 1)<CR>
  nnoremap <silent> <leader>i :<C-u>call <SID>reveal('center', 0)<CR>
  xnoremap <silent> <leader>i :<C-u>call <SID>reveal('center', 0)<CR>
  nnoremap <silent> <leader>< :<C-u>call <SID>reveal('bottom', 1)<CR>
  xnoremap <silent> <leader>< :<C-u>call <SID>reveal('bottom', 1)<CR>
  nnoremap <silent> <leader>, :<C-u>call <SID>reveal('bottom', 0)<CR>
  xnoremap <silent> <leader>, :<C-u>call <SID>reveal('bottom', 0)<CR>
else
  noremap <leader>u zb
  noremap <leader>i zz
  noremap <leader>, zt
endif
" sentences
noremap _ (
noremap ] )
" paragraphs
noremap + }
noremap [ {
" Help
if exists('g:vscode')
else
  noremap <leader>h K
endif
" Bracket cmds (TODO)
"noremap <leader>< ]
"noremap <leader>> [
" Home
noremap <home> gg
" End
noremap <End> G
" Pg up
"noremap <PageUp> <C-b>
noremap <PageUp> m' <bar> <C-b>
" Pg down
"noremap <PageDown> <C-f>
noremap <PageDown> m' <bar> <C-f>

" (un)indent
if exists('g:vscode')
  nnoremap - <Cmd>call VSCodeNotify('editor.action.outdentLines')<CR>
  vnoremap - <Cmd>call VSCodeNotifyVisual('editor.action.outdentLines', 1)<CR>
  nnoremap } <Cmd>call VSCodeNotify('editor.action.indentLines')<CR>
  vnoremap } <Cmd>call VSCodeNotifyVisual('editor.action.indentLines', 1)<CR>
else
  noremap - <<
  noremap } >>
endif

" swap lines
if exists('g:vscode')
  nnoremap = <Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>
  vnoremap = <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesDownAction', 1)<CR>
  nnoremap { <Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>
  vnoremap { <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesUpAction', 1)<CR>
else
  noremap = ddp
  noremap { dd<up><up>p
endif

" back & forward Jumplist/Changelist
if exists('g:vscode')
  nnoremap NN <Cmd>call VSCodeNotify("workbench.action.navigateBack")<CR>
  nnoremap AA <Cmd>call VSCodeNotify("workbench.action.navigateForward")<CR>
  nnoremap Nn g;
  nnoremap Aa g,
else
  "noremap NN <C-o>
  "noremap AA <C-i>
  noremap NN <Plug>EnhancedJumpsOlder
  noremap AA <Plug>EnhancedJumpsNewer
  noremap Nn g;
  noremap Aa g,
endif

" Join lines
noremap \ J
" unused
map $ <nop>
" Match
" noremap ^ % See matchit plugin
" Toggle fold
noremap <leader>f za

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
" Command Mode
if exists('g:vscode')
  " see VSCode keybindings
else
  noremap <cr> :
  " This is used w/ help mode in order to access command mode
  noremap <leader><cr> :
endif

" auto format
noremap $ =
" repeat command
noremap <tab> .
" register spc.
noremap q "
" Set mark
noremap Q m
" Goto mark
noremap j `
" Goto mark bol
noremap J '
" Z commands
noremap <leader>z z

" Three in one bol.
" note - parenthesis with multiple ternary expression seems necessary
noremap <expr> n v:count > 1 ? '_' : (virtcol('.') == indent('.')+1 ? '0' : '^')

" Up and down arrow, register with jumplist (2 or more lines)
noremap <expr> <down> (v:count > 1 ? "m'" . v:count : '') . '<down>'
noremap <expr> <up> (v:count > 1 ? "m'" . v:count : '') . '<up>'

" Alpha Commands --------------------------

" left r1
" execute 'noremap ' . s:r1c1 . ' g'
" execute 'noremap ' . s:R1C1 . ' z'
execute 'noremap ' . s:r1c2 . ' ~'
execute 'noremap ' . s:r1c3 . ' c'
execute 'noremap ' . s:R1C3 . ' C'
execute 'noremap ' . s:r1c4 . ' r'
execute 'noremap ' . s:R1C4 . ' R'
if exists('g:vscode')
  " TODO
else
  execute 'map ' . s:r1c5 . ' <Plug>(wildfire-fuel)'
  execute 'vmap ' . s:R1C5 . ' <Plug>(wildfire-water)'
endif
" map b <Plug>(wildfire-fuel)
" vmap B <Plug>(wildfire-water)
"execute 'map ' . s:r1c5 . ' <Plug>(wildfire-fuel)'
"execute 'vmap ' . s:R1C5 . ' <Plug>(wildfire-water)'
" left r2
execute 'noremap ' . s:r2c1 . ' s'
" Using M in visual mode w/ vim-surround
execute 'nnoremap ' . s:R2C1 . ' S'
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
if exists('g:vscode')
  " Keep undo list in sync with VSCode
  "nmap <silent> v <Cmd>call VSCodeNotify('undo')<CR>
  execute 'noremap ' . s:r3c1 . ' u'
else
  execute 'noremap ' . s:r3c1 . ' u'
endif
execute 'noremap ' . s:R3C1 . ' U'
execute 'noremap ' . s:r3c2 . ' d'
execute 'noremap ' . s:R3C2 . ' D'
execute 'noremap ' . s:r3c3 . ' y'
execute 'noremap ' . s:R3C3 . ' Y'
execute 'noremap ' . s:r3c4 . ' p'
execute 'noremap ' . s:R3C4 . ' P'
if exists('g:vscode')
  " Keep redo list in sync with VSCode
  "nmap <silent> z <Cmd>call VSCodeNotify('redo')<CR>
  "vmap <silent> z <Cmd>call VSCodeNotify('redo')<CR>
  "execute 'nmap ' . s:r3c5 . ' <C-r>'
  "execute 'vmap ' . s:r3c5 . ' <C-r>'
  execute 'noremap ' . s:r3c5 . ' <C-r>'
else
  execute 'noremap ' . s:r3c5 . ' <C-r>'
endif
execute 'noremap ' . s:R3C5 . ' &'
" right r1
"execute 'noremap ' . s:r1c6 . ' f'
"execute 'noremap ' . s:R1C6 . ' F'

" Clever Find
nmap ' <Plug>(clever-f-f)
xmap ' <Plug>(clever-f-f)
omap ' <Plug>(clever-f-f)
nmap " <Plug>(clever-f-F)
xmap " <Plug>(clever-f-F)
omap " <Plug>(clever-f-F)
nmap y <Plug>(clever-f-t)
xmap y <Plug>(clever-f-t)
omap y <Plug>(clever-f-t)
nmap Y <Plug>(clever-f-T)
xmap Y <Plug>(clever-f-T)
omap Y <Plug>(clever-f-T)
"noremap <esc> <Plug>(clever-f-reset)

execute 'noremap ' . s:r1c7 . ' ge'
execute 'noremap ' . s:R1C7 . ' gE'
execute 'noremap ' . s:r1c8 . ' b'
execute 'noremap ' . s:R1C8 . ' B'
execute 'noremap ' . s:r1c9 . ' e'
execute 'noremap ' . s:R1C9 . ' E'
execute 'noremap ' . s:r1c10 . ' w'
execute 'noremap ' . s:R1C10 . ' W'
" right r2
"execute 'noremap ' . s:r2c6 . ' t'
"execute 'noremap ' . s:R2C6 . ' T'
"execute 'noremap ' . s:r2c7 . ' ^' // see three in one bol. above
"execute 'noremap ' . s:R2C7 . ' ,' // see back & forward jumplist/changelist
"execute 'noremap ' . s:r2c8 . ' +'
" Up and down line, register with jumplist (2 or more lines)
noremap <expr> e (v:count > 1 ? "m'" . v:count : '') . '+'
execute 'noremap ' . s:R2C8 . ' <C-e>'
"execute 'noremap ' . s:r2c9 . ' -'
noremap <expr> i (v:count > 1 ? "m'" . v:count : '') . '-'
execute 'noremap ' . s:R2C9 . ' <C-y>'
execute 'noremap ' . s:r2c10 . ' $'
"execute 'noremap ' . s:R2C10 . ' ;' // see clever find
" right r3
execute 'noremap ' . s:r3c6 . ' /'
execute 'noremap ' . s:R3C6 . ' ?'
execute 'noremap ' . s:r3c7 . ' #'
execute 'noremap ' . s:R3C7 . ' N'
"execute 'noremap ' . s:R3C8 . ' ' // see matchit
"execute 'noremap ' . s:r3c8 . ' <C-d>'
noremap / m' <bar> <C-d>
"execute 'noremap ' . s:R3C9 . ' ' // see matchit
"execute 'noremap ' . s:r3c9 . ' <C-u>'
" TODO - for some reason setting mark prior to half page up breaks page up in both neovim and vscode-neovim. workaround is to not set mark if on last line.
noremap <expr> , line('.') == line('$') ? '<C-u>' : "m'" . '<C-u>'
execute 'noremap ' . s:r3c10 . ' *'
execute 'noremap ' . s:R3C10 . ' n'

" Quit commands
noremap <leader>gQ ZQ
noremap <leader>gZ ZZ

" g mappings
noremap <leader>g# g#
" A bit counter-intuitive, but there is no soft bol. down for "g" using "_", but instead there is opposite, soft eol. down
" noremap -o g$
noremap <leader>go g_
noremap <leader>gn g^
noremap <leader>g& g&
noremap <leader>g~ g'
noremap <leader>g\" g`
noremap <leader>g* g*
noremap <leader>g+ g+
noremap <leader>g, g,
noremap <leader>g- g-
noremap <leader>gy g-
noremap <leader>g0 g0
noremap <leader>g8 g8
noremap <leader>g< g<
noremap <leader>g? g?
noremap <leader>g?? g??
noremap <leader>g?g? g?g?
noremap <leader>gQ gQ
noremap <leader>ge ge
noremap <leader>gE gE
noremap <leader>gV gH
" gI - insert
noremap <leader>gS gI
noremap <leader>g<S-tab> gD
noremap <leader>gD gP
" gR - replace
noremap <leader>gP gR
noremap <leader>gT gT
noremap <leader>gU gU
" gV - visual
noremap <leader>gG gV
noremap <leader>g] g]
noremap <leader>ga ga
noremap <leader>gf gf
noremap <leader>gF gF
" gg mapped >
" noremap <leader>gl gg
noremap <leader>gv gh
" gi - insert
noremap <leader>gs gi
noremap <leader>g<tab> gd
noremap <leader>gk gk
noremap <leader>g. gn
noremap <leader>gh gh
noremap <leader>gW gJ
noremap <leader>gm gm
noremap <leader>gM gM
noremap <leader>gO go
noremap <leader>gd gp
noremap <leader>g; g;
noremap <leader>gq gq
" gr - replace
noremap <leader>gp gr
noremap <leader>gs gs
noremap <leader>gt gt
noremap <leader>gu gu
" gv - visual
noremap <leader>gg gv
noremap <leader>g: gw
noremap <leader>gx gx
noremap <leader>g@ g@
noremap <leader>g~ g~
noremap <leader>g<Down> g<Down>
noremap <leader>g<End> g<End>
noremap <leader>g<Home> g<Home>
noremap <leader>g<LeftMouse> g<LeftMouse>
noremap <leader>g<MiddleMouse> g<MiddleMouse>
noremap <leader>g<RightMouse> g<RightMouse>
noremap <leader>g<Tab> g<Tab>
noremap <leader>g<Up> g<Up>

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