"" for more information on a set option, open vim and type `:help 'option_name'` (without backticks)

set background=dark                             " set default color groups for dark background
set backspace=indent,eol,start                  " makes <bs> work intuitively. See `:help 'backspace'`
set display=truncate                            " change the way text is displayed. See `:help 'display'`
set fileencodings=ucs-bom,utf-8,default,latin1  " encodings to test on start. See `:help 'fileencodings'`
set helplang=de                                 " language of help files if available. Otherwise fallback to english
set history=200                                 " history length of used commands and search patterns
set incsearch                                   " highlight matching strings while typing search pattern
set hlsearch                                    " highlight all matching strings
set nolangremap                                 " See `:help 'langremap'`
set nrformats=bin,octal,hex                     " make binary, octal and hexadecimal numbers and single alpabetical characters incrementable. See `:help 'nrformats'`
set scrolloff=3                                 " minimum of screen lines to keep above and below the cursor
set sidescrolloff=8                             " minimum of screen columnes to keep to left and right of the cursor (when wrap is off)
set suffixes=.~,.o,.out,.info,.swp,.aux,.bbl,.toc,.bak,.jpg,.png    " file suffixes with lower priority
set ttimeout                                    " TUI timeout for terminal key codes. See `:help 'ttimeout'`
set ttimeoutlen=100                             " TUI timeout in milliseconds. See `:help 'ttimeoutlen'`
set wildmenu                                    " commandline completion with window for possible completions

set backupdir=~/.cache/vim/backup               " directory to store backups there
set directory=~/.cache/vim/swap                 " directory to store swap-files there
set undodir=~/.cache/vim/undo                   " directory to store undone file-modifications there
set viewdir=~/.cache/vim/view                   " directory to store views there

set guifont=DejaVu\ Sans\ Mono\ Book\ 11        " applied font when using GUI
set number                                      " show line number
set relativenumber                              " show relative line numbers from curserline
set showmode                                    " if in Insert, Replace or Visual mode show in last line
set showcmd                                     " additional information about selected area in visual mode. See `:help 'showcmd'`
set report=0                                    " report in last line if more than 'report' lines changed
set cmdheight=1                                 " hight of last line
set cmdwinheight=9                              " hight of command line window (:<c-f>)
set statusline=%.85F                           " status line: filepath in max 25 characters
set statusline+=%r%m                            " status line: modification-indicator
set statusline+=\ %y                            " status line: filetype
set statusline+=\ [%{&fileformat}]              " status line: fileformat (unix,dos,mac)
set statusline+=\ [%{&fileencoding}]            " status line: fileencoding (unix,dos,mac)
set statusline+=\ %#warningmsg#                 " status line: Warnings by syntastic plugin
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=                              " status line: split/right align
set statusline+=\ <%b(0x%B)>                    " statusline: selected character in dec and hex
set statusline+=\ [%l,%v\ (%p%%\ ^%L)]          " statusline: line, column, file percentage, max lines
set statusline+=\ [#%n]                         " statusline: buffer number
set laststatus=2                                " show status line (2=always)

set cursorline                                  " highlight line of cursor
set cursorcolumn                                " highlight column of cursor
"set colorcolumn=80                              " highlight column
set title                                       " set filename as window title
set nowrap                                      " do not wrap lines
set ignorecase                                  " ignore case in searching
set autoindent                                  " indent automatically
set tabstop=4                                   " tabulator width in columns
set softtabstop=4                               " soft tabulator width. May consist of tabs and spaces. See `:help 'tabstop'`
set shiftwidth=4                                " width of autoindent, cindent, >> and << operations
set shiftround                                  " rounding shift with >> and << to a factor of shiftwidth
set expandtab                                   " expand tabulators to spaces
set matchtime=2                                 " highlight corresponding bracket in 10 milliseconds
syntax on                                       " syntax highlighting
set spelllang=de,en                             " languages for spell checking
set mouse=a                                     " activate mouse in all modes
set foldenable                                  " activate folding
set foldcolumn=2                                " width of folding-bar on the left
set foldmethod=syntax                           " automatic folding follows syntax
set foldlevelstart=99                           " open files in unfolded mode (as long as the code doesn't exceed the set fold level)
set nospell                                     " no spell checking by default
set clipboard+=unnamedplus                      " add yanked text to clipboard automatically (nvim only)

colorscheme ghost256                             " dark, blue
"colorscheme gotham256                           " dark, blue
"colorscheme moriarty                            " dark, contrast, gray
"colorscheme moria                               " bright-dark
"colorscheme gruvbox                             " solarized-dark
"colorscheme molokai                             " dark, bright fg
"colorscheme solarized8_dark_low                 " solarized-dark, bright fg, grass green

set colorcolumn=101
highlight ColorColumn ctermbg=Black guibg=Black

let mapleader = "¸"                             " <leader>-key (escaped: '¸')
let maplocalleader = ","                        " <localleader>-key

" 
" magma config:
nnoremap <silent><expr> <leader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <leader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <leader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <leader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <leader>rd :MagmaDelete<CR>
nnoremap <silent>       <leader>ro :MagmaShowOutput<CR>
