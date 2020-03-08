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
Plug 'suan/vim-instant-markdown'              " markdown live preview in mini server browser
"Plug 'ctrlpvim/ctrlp.vim'                    " super search
Plug 'junegunn/fzf'                           " fuzzy finder
Plug 'junegunn/fzf.vim'                       " fuzzy finder
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'                        " Ack - search patterns; need: sudo apt-get install ack-grep
Plug 'rking/ag.vim'                           " (Depricated) Ag - Ack alternative; need: sudo apt install silversearcher-ag
Plug 'google/vim-searchindex'                 " Search index/number
Plug 'tpope/vim-sensible'                     " Default configs everyone can agree on
Plug 'vim-scripts/DrawIt'                     " For ASCII arts
Plug 'ryanoasis/nerd-fonts'                   " To support vim-devicons
Plug 'ryanoasis/vim-devicons'                 " Add icons to diff files/extensions

"------------------------ Prog utils ---------------------------

" Auto completion engine
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --clang-completer' } 
Plug 'neoclide/coc.nvim', {'branch': 'release'}                " Auto completion engine
"Plug 'davidhalter/jedi-vim'                  " Auto completion engine for python only
Plug 'toransahu/vim-template'                 " Template System
"Plug 'aperezdc/vim-template'
"Plug 'vim-syntastic/syntastic'               " Syntax Checking
"Plug 'google/yapf', { 'rtp': 'plugins/vim' }
"Plug 'ambv/black'
"Plug 'Chiel92/vim-autoformat'
"Plug 'google/vim-codefmt'
Plug 'w0rp/ale'                             " Asynchronous Linting Enging - ALE
Plug 'SirVer/ultisnips'                       " Snippet Engine
Plug 'honza/vim-snippets'                     " Snippet files - Snippets are separated from the engine
Plug 'heavenshell/vim-pydocstring'            " Python docstring gen
Plug 'scrooloose/nerdcommenter'               " for easy comments
Plug 'tpope/vim-fugitive'                     " git commands in VIM
Plug 'tpope/vim-rhubarb'                      " git in browser
Plug 'tpope/vim-surround'                     " surround text with something manually
Plug 'raimondi/delimitmate'                   " auto close
"Plug 'tmhedberg/SimpylFold'                  " python code fold
Plug 'pseewald/anyfold'                       " code fold
"Plug 'myitcv/govim'                          " new plugin for go written in go feature > vim-go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }       " go support; https://github.com/fatih/vim-go-tutorial
"Plug 'jodosha/vim-godebug'                   " go debugger in split screen with delve CLI - only for neovim; TODO: check later
Plug 'janko-m/vim-test'                       " polyglot test runner
Plug 'sheerun/vim-polyglot'                   " syntax highlighter - language pack
