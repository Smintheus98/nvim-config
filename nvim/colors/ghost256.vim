"      _____ _   _ _____ ____ _____
"     |  __ \ | | |  _  | ___\_   _|
"     | |  \/ |_| | | | | |__  | |
"     | | __|  _  | | | |___ \ | |  - 256
"     | |_\ \ | | | \_/ /__| | | |
"      \____/_| |_/\___/\____/ \_/
"
" Aurhor: Yannic Kitten <yannic.kitten@gmail.com>
" Version: 1.0
" License: MIT
" Large parts have been copied from gotham-256 colorscheme written by Andrea Leopardi <an.leopardi@gmail.com> (https://github.com/whatyouhide/vim-gotham)


" Bootstrap ===================================================================

hi clear
if exists('syntax_on') | syntax reset | endif
set background=dark
let g:colors_name = 'ghost256'


" Helper functions =============================================================

" Execute the 'highlight' command with a List of arguments.
function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    call add(new_list, where . a:ground . '=' . value)
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction


" Colors ======================================================================

" Let's store all the colors in a dictionary.
let s:colors = {}

" Base colors.
let s:colors.base0 = { 'gui': '#0c1014', 'cterm': 232 }
let s:colors.base1 = { 'gui': '#11151c', 'cterm': 233 }
let s:colors.base2 = { 'gui': '#091f2e', 'cterm': 17  }
let s:colors.base3 = { 'gui': '#0a3749', 'cterm': 18  }
let s:colors.base4 = { 'gui': '#1e6479', 'cterm': 31  }
let s:colors.base5 = { 'gui': '#599cab', 'cterm': 81  }
let s:colors.base6 = { 'gui': '#99d1ce', 'cterm': 122 }
let s:colors.base7 = { 'gui': '#d3ebe9', 'cterm': 194 }

" Other colors.
let s:colors.red            = { 'gui': '#c23127', 'cterm': 124 }
let s:colors.orange         = { 'gui': '#d26937', 'cterm': 166 }
let s:colors.yellow         = { 'gui': '#edb443', 'cterm': 214 }
let s:colors.magenta        = { 'gui': '#888ca6', 'cterm': 67  }
let s:colors.violet         = { 'gui': '#4e5166', 'cterm': 60  }
let s:colors.blue           = { 'gui': '#195466', 'cterm': 24  }
let s:colors.cyan           = { 'gui': '#33859E', 'cterm': 44  }
let s:colors.green          = { 'gui': '#2aa889', 'cterm': 78  }
let s:colors.purple4        = { 'gui': '#5f0087', 'cterm': 54  }
let s:colors.navyblue       = { 'gui': '#00005f', 'cterm': 17  }

let s:colors.darkred        = { 'gui': '#661a1b', 'cterm': 52  }
let s:colors.darkorange     = { 'gui': '#af5f00', 'cterm': 130 }
let s:colors.darkviolet     = { 'gui': '#8700d7', 'cterm': 92  }
let s:colors.darkblue       = { 'gui': '#0f3843', 'cterm': 18  }
let s:colors.darkcyan       = { 'gui': '#1f4d5c', 'cterm': 36  }
let s:colors.darkgreen      = { 'gui': '#005000', 'cterm': 22  }
let s:colors.aquamarine3    = { 'gui': '#5fd7af', 'cterm': 79  }
let s:colors.paleturquoise1 = { 'gui': '#afffff', 'cterm': 159 }


" Neovim :terminal colors.
let g:terminal_color_0  = get(s:colors.base0, 'gui')
let g:terminal_color_8  = g:terminal_color_0
let g:terminal_color_1  = get(s:colors.red, 'gui')
let g:terminal_color_9  = g:terminal_color_1
let g:terminal_color_2  = get(s:colors.green, 'gui')
let g:terminal_color_10 = g:terminal_color_2
let g:terminal_color_3  = get(s:colors.yellow, 'gui')
let g:terminal_color_11 = g:terminal_color_3
let g:terminal_color_4  = get(s:colors.blue, 'gui')
let g:terminal_color_12 = g:terminal_color_4
let g:terminal_color_5  = get(s:colors.violet, 'gui')
let g:terminal_color_13 = g:terminal_color_5
let g:terminal_color_6  = get(s:colors.cyan, 'gui')
let g:terminal_color_14 = g:terminal_color_6
let g:terminal_color_7  = get(s:colors.base6, 'gui')
let g:terminal_color_15 = g:terminal_color_7


" Native highlighting ==========================================================

let s:background = 'base0'
let s:linenr_background = 'base1'

" Everything starts here.
call s:Col('Normal', 'base6', s:background)

" Line, cursor and so on.
call s:Col('Cursor', 'base1', 'base6')
call s:Col('CursorLine', '', 'base1')
call s:Col('CursorColumn', '', 'base1')

" Sign column, line numbers.
call s:Col('LineNr', 'blue', s:linenr_background)
call s:Col('CursorLineNr', 'base5', s:linenr_background)
call s:Col('SignColumn', '', s:linenr_background)
call s:Col('ColorColumn', '', s:linenr_background)

" Visual selection.
call s:Col('Visual', '', 'base3')

" Easy-to-guess code elements.
call s:Col('Comment', 'blue')
call s:Col('String', 'green')
call s:Col('Number', 'orange')
call s:Col('Statement', 'base5')
call s:Col('Special', 'orange')
call s:Col('Identifier', 'base5')

" Constants, Ruby symbols.
call s:Col('Constant', 'magenta')

" Some HTML tags (<title>, some <h*>s)
call s:Col('Title', 'orange')

" <a> tags.
call s:Col('Underlined', 'yellow')
call s:Attr('Underlined', 'underline')

" Types, HTML attributes, Ruby constants (and class names).
call s:Col('Type', 'orange')

" Stuff like 'require' in Ruby.
call s:Col('PreProc', 'red')

" Tildes on the bottom of the page.
call s:Col('NonText', 'blue')

" Concealed stuff.
call s:Col('Conceal', 'cyan', s:background)

" TODO and similar tags.
call s:Col('Todo', 'magenta', s:background)

" The column separating vertical splits.
call s:Col('VertSplit', 'base2', s:linenr_background)
call s:Col('StatusLineNC', 'blue', 'base2')

" Matching parenthesis.
call s:Col('MatchParen', 'orange', 'base1')

" Special keys, e.g. some of the chars in 'listchars'. See ':h listchars'.
call s:Col('SpecialKey', 'base3')

" Folds.
call s:Col('Folded', 'base6', 'blue')
call s:Col('FoldColumn', 'base5', 'base3')

" Searching.
call s:Col('Search', 'aquamarine3', 'darkorange')
call s:Attr('IncSearch', 'reverse')

" Popup menu.
call s:Col('Pmenu', 'base6', 'base2')
call s:Col('PmenuSel', 'base7', 'blue')
call s:Col('PmenuSbar', '', 'base2')
call s:Col('PmenuThumb', '', 'blue')

" Command line stuff.
call s:Col('ErrorMsg', 'red', 'base1')
call s:Col('Error', 'red', 'base1')
call s:Col('ModeMsg', 'blue')
call s:Col('WarningMsg', 'red')

" Wild menu.
" StatusLine determines the color of the non-active entries in the wild menu.
call s:Col('StatusLine', 'base5', 'base2')
call s:Col('WildMenu', 'base7', 'cyan')

" The 'Hit ENTER to continue prompt'.
call s:Col('Question', 'green')

" Tab line.
call s:Col('TabLineSel', 'base7', 'blue')  " the selected tab
call s:Col('TabLine', 'base6', 'base2')     " the non-selected tabs
call s:Col('TabLineFill', 'base0', 'base0') " the rest of the tab line

" Spelling.
call s:Col('SpellBad', 'base7', 'red')
call s:Col('SpellCap', 'base7', 'blue')
call s:Col('SpellLocal', 'yellow')
call s:Col('SpellRare', 'base7', 'violet')

" Diffing.
call s:Col('DiffAdd', 'base7', 'darkgreen')
call s:Col('DiffChange', 'base7', 'navyblue')
call s:Col('DiffDelete', 'base7', 'darkred')
call s:Col('DiffText', 'paleturquoise1', 'purple4')
call s:Col('DiffAdded', 'darkgreen')
call s:Col('DiffChanged', 'navyblue')
call s:Col('DiffRemoved', 'darkred')
call s:Col('DiffSubname', 'navyblue')

" Directories (e.g. netrw).
call s:Col('Directory', 'cyan')


" Programming languages and filetypes ==========================================

" Ruby.
call s:Col('rubyDefine', 'blue')
call s:Col('rubyStringDelimiter', 'green')

" HTML (and often Markdown).
call s:Col('htmlArg', 'blue')
call s:Col('htmlItalic', 'magenta')
call s:Col('htmlBold', 'cyan', '')

" Python                                                                                                                   
call s:Col('pythonStatement', 'blue')


" Plugin =======================================================================

" GitGutter
call s:Col('GitGutterAdd', 'green', s:linenr_background)
call s:Col('GitGutterChange', 'cyan', s:linenr_background)
call s:Col('GitGutterDelete', 'orange', s:linenr_background)
call s:Col('GitGutterChangeDelete', 'magenta', s:linenr_background)

" CtrlP
call s:Col('CtrlPNoEntries', 'base7', 'orange') " no entries
call s:Col('CtrlPMatch', 'green')               " matching part
call s:Col('CtrlPPrtBase', 'blue')             " '>>>' prompt
call s:Col('CtrlPPrtText', 'cyan')              " text in the prompt
call s:Col('CtrlPPtrCursor', 'base7')           " cursor in the prompt

" unite.vim
call s:Col('UniteGrep', 'base7', 'green')
let g:unite_source_grep_search_word_highlight = 'UniteGrep'


" Cleanup =====================================================================

unlet s:colors
unlet s:background
unlet s:linenr_background
