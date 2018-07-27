" ~/.vimrc
"

" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'scrooloose/nerdtree.git'
Plugin 'aperezdc/vim-template'
"Plugin 'toransahu/vim-template'
Plugin 'davidhalter/jedi-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-abolish'

" for easy comments
Plugin 'scrooloose/nerdcommenter'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" set color
colorscheme gruvbox
set background=dark
set colorcolumn=80

" lightline fix
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Customize the settings for vim-template plugin
let g:email = "toran.sahu@yahoo.com"
let g:user = "Toran Sahu"


set clipboard=unnamedplus


" execute python code usin F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" nerd commenter setting
filetype plugin on
