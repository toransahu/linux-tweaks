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

" VCS - git, svn diff 
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
"Plugin 'vim-syntastic/syntastic'
"Plugin 'google/yapf', { 'rtp': 'plugins/vim' }
"Plugin 'ambv/black'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'google/vim-codefmt'

" Asynchronous Linting Enging - ALE
Plugin 'w0rp/ale'

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
map <C-f> :NERDTreeFind<CR>

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
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0 " dont run on open
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'passive' }

"" linters
"let g:syntastic_python_checkers = ['pylint', 'flake8', 'yapf']
""let g:syntastic_python_checkers = ['black']
""let g:syntastic_python_checkers = []

"" yapf linter
"map <C-Y> :call yapf#YAPF()<cr>
"imap <C-Y> <c-o>:call yapf#YAPF()<cr>


" Vim AutoFormat
"let g:formatterpath = ['~/black']

" ALE COnfig
"Check Python files with flake8 and pylint.
"let b:ale_linters = ['flake8', 'pylint']
let b:ale_linters = ['flake8']
"let b:ale_linters = ['pylint']
" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['black', 'autopep8', 'yapf']
let b:ale_fixers = ['black']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_flake8_auto_pipenv = 1
"let g:ale_python_pylint_options = '--load-plugins pylint_django'


let g:ale_python_flake8_executable = $VIRTUAL_ENV . '/bin/flake8'

" untisnip configs
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"autocmd BufWritePre *.py execute ':Black'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"============= TODO
"1. syntastic venv [x]
"2. try google/vim-codefmt [x]
"3. status for vim-signify
"4. fuzzy finder
"5. colorize
