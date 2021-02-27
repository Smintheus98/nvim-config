" some plugins

" installation of vim-plug:
" vim: 
"   `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`                                                       "vim
" neovim: 
"   `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
"   `python3 -m pip install --user pynvim`

call plug#begin('~/.vim/plugins')
    Plug 'scrooloose/nerdtree'                  " NERDtree
    Plug 'flazz/vim-colorschemes'               " additional colorschemes
    Plug 'octol/vim-cpp-enhanced-highlight'     " enhanced highlighting for C++
    Plug 'zah/nim.vim'                          " Support for the programming language Nim
    Plug 'lervag/vimtex'                        " LaTeX-support for vim
"    Plug 'valloric/youcompleteme'               " YouCompleteMe Auto Code-Completion Engine
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " dark powered neo-completion tool
    Plug 'scrooloose/syntastic'                 " Syntax checking
call plug#end()

" scrooloose/nerdtree
" toggle NERDTree
noremap <c-t> :NERDTreeToggle <cr>

" octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" lervag/vimtex
let g:tex_flavor = 'latex'

"" valloric/youcompleteme
"" install after pulling: `python ~/.vim/plugins/youcompleteme/install.py`
"" support for Nim: `git clone https://github.com/BitR/ycm-nimsuggest $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/nim`
if has('nvim')
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" Shougo/deoplete
let g:deoplete#enable_at_startup = 1

" scrooloose/syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

