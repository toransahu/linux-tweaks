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

"================= Basic Plugins

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'

" Color Scheme
Plugin 'morhetz/gruvbox'

" Botton Status Bar
Plugin 'itchyny/lightline.vim'

" lightline uses it
Plugin 'itchyny/vim-gitbranch'

" VCS diff 
Plugin 'mhinz/vim-signify'

" CLI File Manager 
Plugin 'scrooloose/nerdtree.git'

" Editor properties
Plugin 'editorconfig/editorconfig-vim'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plugin 'tpope/vim-abolish'

" GOTO PWD via file Manager or Terminal
Plugin 'justinmk/vim-gtfo'

"==================== Prog utils

" Auto completion engine
" Plugin 'davidhalter/jedi-vim' " for python only
Plugin 'Valloric/YouCompleteMe'

" Template System
Plugin 'aperezdc/vim-template'
" Plugin 'toransahu/vim-template' " using upstream

" Syntax Checking
Plugin 'vim-syntastic/syntastic'

" Snippet Engine
Plugin 'SirVer/ultisnips'

" Snippet files - Snippets are separated from the engine
Plugin 'honza/vim-snippets'

" for easy comments
Plugin 'scrooloose/nerdcommenter'


" stop - all plugins above
call vundle#end()


"===================== Other 

" filetype func on
filetype plugin indent on

set clipboard=unnamedplus


" execute python code usin F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


"============= Plugin Configs

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

" nerd commenter setting
filetype plugin on


" vim-jedi (disable)
let g:jedi#completions_enabled = 0

" YCM Config
nnoremap <F5> :YcmCompleter GoToDefinition<CR>
nnoremap <F6> :YcmCompleter GoToReferences<CR>
nnoremap <F7> :YcmCompleter GoToDeclaration<CR>

" Syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 " dont run on open
let g:syntastic_check_on_wq = 0

" linters
let g:syntastic_python_checkers = ['pylint', 'flake8', 'yapf']

" untisnip configs
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"============= TODO
"1. syntastic venv 
"2. try google/vim-codefmt
