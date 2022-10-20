"" some own commands, automatic commands, mappings and abbreviations 
"" to simplify and speed up the editing of files 

" commands {{{
" command line commands making life easier
command! W w
command! Q q
command! Wq wq
command! WQ wq
command! Wa wa
command! WA wa
command! Qa qa
command! QA qa
command! Wqa wqa
command! WQa wqa
command! WQA wqa
" }}}

" automatic commands {{{
augroup filetype_set
    autocmd!
    autocmd BufNewFile,BufRead *.nim    setlocal filetype=nim               " recognize *.nim files
    autocmd BufNewFile,BufRead *.nims   setlocal filetype=nim               " recognize *.nims files
    autocmd BufNewFile,BufRead *.t      setlocal filetype=cpp               " use *.t files as cpp-template-headers
augroup end
augroup filetype_mappings
    autocmd!
    autocmd FileType tex            setlocal wrap                               " wrap lines for tex-files
    autocmd FileType tex            setlocal spell                              " check spell for tex-files
    autocmd FileType tex            setlocal tabstop=2
    autocmd FileType tex            setlocal softtabstop=2
    autocmd FileType tex            setlocal shiftwidth=2
    " make pair of curly brackets and insert between these lines
    autocmd FileType c,cpp,java     inoremap {<enter> {<enter>}<esc>O
    " additional support for programming in kitten
    autocmd FileType kitten         setlocal tabstop=2
    autocmd FileType kitten         setlocal softtabstop=2
    autocmd FileType kitten         setlocal shiftwidth=2
    " comment out this line in C,C++,Java
    autocmd FileType c,cpp,java     nnoremap <buffer><leader>c I//<esc>
    " comment out this line in Python,Nim
    autocmd FileType python,nim,sh  nnoremap <buffer><leader>c I#<esc>
    " comment out this line in VimL/VimScript
    autocmd FileType vim            nnoremap <buffer><leader>c I"<esc>
    autocmd FileType vim            setlocal foldmethod=marker                  " sets different folding method for vim filles
augroup end
" }}}

" mappings {{{

" edit config in new splitted window
nnoremap <leader>ec  :split  ~/.config/nvim <cr>
nnoremap <leader>ecv :vsplit ~/.config/nvim <cr>
nnoremap <leader>sc  :source $MYVIMRC <cr>
" write and quit
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>a
nnoremap <c-q> :q<cr>
inoremap <c-q> <esc>:q<cr>
" capitalize word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe
" string word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>lel
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>lel
" move to beginning/end of line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_
" escape
inoremap jk <esc>
" stop highlighting last search (will be activated on next seach automatically)
noremap <leader>nhl :nohlsearch<cr>
" highlight trailing spaces as Error
nnoremap <leader>w :match Error /\v\s+$/<cr>
" stop highlight trailing spaces as Error
nnoremap <leader>W :match Error //<cr>
" auto insert \v for normal regex when searching
nnoremap / /\v
" open new line below or above from insert mode
inoremap <leader>o <esc>o
inoremap <leader>O <esc>O
" add new line below/above without leaving normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
" paste from insertmode
inoremap <leader>p <esc>p
inoremap <leader>P <esc>P
" }}}
