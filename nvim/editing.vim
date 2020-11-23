""" some own commands, automatic commands, mappings and abbreviations 
""" to simplify and speed up the editing of files 

"" command line commands making life easier
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

"" automatic commands
augroup filetype_set
    autocmd!
    autocmd BufNewFile,BufRead *.nim    setlocal filetype=nim           " recognize *.nim files
    autocmd BufNewFile,BufRead *.nims   setlocal filetype=nim           " recognize *.nims files
    autocmd BufNewFile,BufRead *.t      setlocal filetype=cpp           " use *.t files as cpp-template-headers
augroup end
augroup filetype_mappings
    autocmd!
    autocmd FileType tex        setlocal wrap                           " wrap lines for tex-files
    autocmd FileType tex        setlocal spell                          " check spell for tex-files
    autocmd FileType c,cpp,java inoremap {<enter> {<enter>}<esc>O       " make pair of curly brackets and insert between these lines
    autocmd FileType c,cpp,java nnoremap <buffer><leader>c I//<esc>     " comment out this line in C,C++,Java
    autocmd FileType python,nim nnoremap <buffer><leader>c I#<esc>      " comment out this line in Python,Nim
    autocmd FileType vim        nnoremap <buffer><leader>c I"<esc>      " comment out this line in VimL/VimScript
augroup end


"" some further mappings

" edit config in new splitted window
nnoremap <leader>ecs :split $MYVIMRC<cr>
nnoremap <leader>ecv :vsplit $MYVIMRC<cr>
nnoremap <leader>sc  :source $MYVIMRC<cr>
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
" toggle search-highlighting
noremap <leader>hl :set hlsearch!<cr>

