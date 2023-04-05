" autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"------------------------ Basic Plugins -----------------------
"Plug 'VundleVim/Vundle.vim'                  " Plugin Manager
Plug 'junegunn/vim-plug'                      " Plugin Manager helps
Plug 'morhetz/gruvbox'                        " Color Scheme
Plug 'NLKNguyen/papercolor-theme'             " Color Scheme - Materal Design 
Plug 'itchyny/lightline.vim'                  " Botton Status Bar
Plug 'itchyny/vim-gitbranch'                  " lightline uses it
Plug 'mhinz/vim-signify'                      " VCS - git, svn diff 
"Plug 'scrooloocse/nerdtree'                  " CLI File Manager 
Plug 'vim-nerdtree/nerdtree'                  " CLI File Manager 
Plug 'Nopik/vim-nerdtree-direnter'            " Fix dir opening in new tab on enter if let g:NERDTreeMapOpenInTab='<ENTER>'
Plug 'editorconfig/editorconfig-vim'          " Editor properties
Plug 'tpope/vim-abolish'                      " Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'justinmk/vim-gtfo'                      " GOTO PWD via file Manager or Terminal;  Usage: got; gof; goT; goF
"Plug 'shime/vim-livedown'                    " markdown live preview in mini server browser
" Plug 'suan/vim-instant-markdown',             " markdown live preview in mini server browser
            " \ {'for': 'markdown'} 
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" Plug 'iamcco/markdown-preview.nvim', 
"             \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'], 
"             \ 'on': ['MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle']}
" Plug 'toransahu/markdown-preview.nvim',
"             \ { 'do': 'cd app & yarn install',
"             \ 'on': ['MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle']}
" Plug 'toransahu/markdown-preview.nvim',
"             \ { 'do': 'cd app & yarn install'}
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'toransahu/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"Plug 'ctrlpvim/ctrlp.vim'                    " super search
Plug 'junegunn/fzf'                           " fuzzy finder
Plug 'junegunn/fzf.vim'                       " fuzzy finder
"Plug 'junegunn/fzf', \ { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'                        " Ack - search patterns; need: sudo apt-get install ack-grep
Plug 'rking/ag.vim'                           " (Depricated) Ag - Ack alternative; need: sudo apt install silversearcher-ag
Plug 'google/vim-searchindex'                 " Search index/number
Plug 'tpope/vim-sensible'                     " Default configs everyone can agree on
Plug 'vim-scripts/DrawIt'                     " For ASCII arts
Plug 'ryanoasis/nerd-fonts'                   " To support vim-devicons
Plug 'ryanoasis/vim-devicons'                 " Add icons to diff files/extensions
Plug 'rhysd/vim-grammarous'                   " Grammar check - based on www.languagetool.org tool
" Plug 'kamykn/spelunker.vim'                   " spell check - made easy
" Plug 'benmills/vimux'                         " Interact with tmux from vim
Plug 'farconics/victionary'                   " Dictionary

"------------------------ Prog utils ---------------------------

" Auto completion engine
" Plug 'Valloric/YouCompleteMe',                " Auto completion engine 
"             \ { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --clang-completer' } 
" Plug 'codota/tabnine-vim'                     " AI based autocompletion - alt.: coc-tabnine
Plug 'github/copilot.vim'                     " AI based autocompletion - Your AI pair programmer by Github
Plug 'neoclide/coc.nvim',                     " Auto completion engine
            \ {'branch': 'release'}           
Plug 'yaegassy/coc-ansible',                  " Ansible Language Server
            \ {'do': 'yarn install --frozen-lockfile'}
"Plug 'davidhalter/jedi-vim'                  " Auto completion engine for python only
"Plug 'vim-syntastic/syntastic'               " Syntax Checking
"Plug 'google/yapf', { 'rtp': 'plugins/vim' } " fmt - Python
"Plug 'ambv/black'                            " fmt - Python
"Plug 'Chiel92/vim-autoformat'                " fmt - All?
"Plug 'google/vim-codefmt'                    " fmt - All?
" Plug 'w0rp/ale'                               " Asynchronous Linting Enging - ALE
" Plug 'SirVer/ultisnips'                       " Snippet Engine
" Plug 'honza/vim-snippets'                     " Snippet files - Snippets are separated from the engine
"Plug 'aperezdc/vim-template'
Plug 'toransahu/vim-template'                 " Template System
Plug 'heavenshell/vim-pydocstring',           " Python docstring gen
            \ { 'do': 'make install' }
Plug 'scrooloose/nerdcommenter'               " for easy comments
Plug 'tpope/vim-fugitive'                     " git commands in VIM
Plug 'tpope/vim-rhubarb'                      " git in browser
Plug 'tpope/vim-surround'                     " surround text with something manually
Plug 'raimondi/delimitmate'                   " auto close
"Plug 'tmhedberg/SimpylFold'                  " python code fold
Plug 'pseewald/anyfold'                       " code fold
"Plug 'myitcv/govim'                          " new plugin for go written in go feature > vim-go
" Plug 'fatih/vim-go',                          " go support; https://github.com/fatih/vim-go-tutorial
"             \ { 'do': ':GoInstallBinaries' }  
" Plug 'jodosha/vim-godebug'                  " go debugger in split screen with delve CLI - only for neovim; TODO: check later
" Plug 'janko-m/vim-test'                     " polyglot test runner
" Plug 'toransahu/vim-test',                  " with java#maven fqcn option support
" \ { 'branch': 'java-test-file-pattern-before-Surefire-Plugin-2.19.1' }                       
Plug 'toransahu/vim-test',                    " with java#maven fqcn option support
            \ { 'commit': 'fa0d09ea4b9ca9b4fa555695bc2beaa09d81dc52' }
Plug 'sheerun/vim-polyglot'                   " syntax highlighter - language pack
Plug 'google/vim-maktaba'                     " vim-codefmt dep: Add maktaba and codefmt to the runtimepath.
Plug 'google/vim-codefmt'                     " code fmt by google
Plug 'google/vim-glaive'                      " vim-codefmt dep: Also add Glaive, which is used to configure codefmt's maktaba flags.
Plug 'puremourning/vimspector'                " polyglot debugger
" Plug 'sebdah/vim-delve'                       " golang debugger using Delve
Plug 'majutsushi/tagbar'                      " to browse tags of current file; dependency: exuberant-ctags
Plug 'turbio/bracey.vim'                      " preview markup files; html, css, js
