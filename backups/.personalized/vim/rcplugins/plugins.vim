" vim:ft=vim

" ================= Plugin Configs ================

fu! ConfigureLightline()
    " lightline fix
    set laststatus=2
    let g:lightline = {
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'gitbranch#name',
	      \   'cocstatus': 'coc#status'
          \ },
          \ 'colorscheme': 'PaperColor',  
          \ }
    " g:lighline.colorscheme: if PaperColor installed & enabled
    " Use auocmd to force lightline update.
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
endfunction

call ConfigureLightline()

fu! ConfigureNerdTree()
    " NERDTree shortcut
    map <C-n> :NERDTreeToggle<CR>
    map <C-f> :NERDTreeFind<CR>
    
    " open files in new tab - DIR FIX: see plugins
    let g:NERDTreeMapOpenInTab='<ENTER>'
endfunction

call ConfigureNerdTree()

fu! ConfigureVimTemplate()
    " Customize the settings for vim-template plugin
    let g:email = "toran.sahu@yahoo.com"
    let g:user = "Toran Sahu"
endfunction

call ConfigureVimTemplate()

fu! ConfigureNerdTreeCommenter()
    " nerd commenter setting
    " filetype plugin on                                      " turn on filetype, plugin detection
    let g:NERDSpaceDelims = 1                               " put a space 
    let g:NERDCustomDelimiters = {'python': {'left': '#'}}  " to fix double space issue with g:NERDSpaceDelims=1
    let g:NERDDefaultAlign = 'left'
endfunction

call ConfigureNerdTreeCommenter()

fu! ConfigureVimJedi()
    let g:jedi#completions_enabled = 1
    "python.jediEnabled": false
endfunction

call ConfigureVimJedi()

fu! ConfigureYCM()
    " YCM Config
    " Pre-requisites
    set encoding=utf-8

    nnoremap <F5> :YcmCompleter GoToDefinition<CR>
    nnoremap <F6> :YcmCompleter GoToReferences<CR>
    nnoremap <F7> :YcmCompleter GoToDeclaration<CR>
    
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
    let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
    let g:ycm_complete_in_strings = 1 " Completion in string
    
    " mimic intellij
    nnoremap <C-b> :YcmCompleter GoToDefinition<CR>
    :nnoremap <C-A-Left> <C-o>
    :nnoremap <C-A-Right> <C-i>
endfunction

" call ConfigureYCM()
let g:loaded_youcompleteme = 1 "disable YCM

fu! ConfigureSyntastic()
    " Syntastic configs
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0 " dont run on open
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode_map = { 'mode': 'passive' }
    
    " linters
    let g:syntastic_python_checkers = ['pylint', 'flake8', 'yapf']
    "let g:syntastic_python_checkers = ['black']
    "let g:syntastic_python_checkers = []
endfunction

"call ConfigureSyntastic()

fu! ConfigureYAPF()
    " yapf linter
    map <C-Y> :call yapf#YAPF()<cr>
    imap <C-Y> <c-o>:call yapf#YAPF()<cr>
endfunction

"call ConfigureYAPF()

fu! ConfigureALE()
    " ALE COnfig
    "Check Python files with flake8 and others
    " for docstring lints: pip install flake8-docstrings
    let g:ale_linters = {'python': ['flake8', ], 'go': ['gopls', ],}
    "let g:ale_linters = {'python': ['flake8','mypy']}
    "let g:ale_linters = {'python': ['flake8','pylint']}
    
    " Fix Python files with black and others
    let g:ale_fixers = {'python': ['black', 'isort']}
    
    " Disable warnings about trailing whitespace for Python files.
    let b:ale_warn_about_trailing_whitespace = 0
    
    " Set this variable to 1 to fix files when you save them.
    let g:ale_fix_on_save = 0
    let g:ale_python_black_options = '--line-length 120'
    let g:ale_python_flake8_options = '--max-line-length 120'
    
    " Virtualenv/pipenv related
    "let g:ale_python_auto_pipenv = 1
    "let g:ale_python_flake8_auto_pipenv = 1
    "let g:ale_python_flake8_executable = $VIRTUAL_ENV . '/bin/flake8'
    
    "let g:ale_python_black_executable = $VIRTUAL_ENV . '/bin/black'
    "let g:ale_python_pylint_options = '--load-plugins pylint_django'
endfunction

call ConfigureALE()

fu! ConfigureVimGo()
    "================vim-go config============
    let g:go_template_autocreate = 0
    let g:go_fmt_command = "goimports"    "[disabled] Run goimports along gofmt on each save
    let g:go_auto_type_info = 0           "[disabled] Automatically get signature/type info for object under cursor
    " automatically prompt autocompletion on typing dot (.) 
    " behind the scene Ctrl x, ctrl o 
    " au filetype go inoremap <buffer> . .<C-x><C-o>  
    
    
    "gopls based configs
    " need to do `go get -u -v golang.org/x/tools/gopls`
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    
    set mouse=a
    
    " To get hover working in the terminal we need to set ttymouse. See
    "
    " :help ttymouse
    "
    " for the appropriate setting for your terminal. Note that despite the
    " automated tests using xterm as the terminal, a setting of ttymouse=xterm
    " does not work correctly beyond a certain column number (citation needed)
    " hence we use ttymouse=sgr
    set ttymouse=sgr
    
    " Suggestion: By default, govim populates the quickfix window with diagnostics
    " reported by gopls after a period of inactivity, the time period being
    " defined by updatetime (help updatetime). Here we suggest a short updatetime
    " time in order that govim/Vim are more responsive/IDE-like
    set updatetime=500
    
    " Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
    " balloondelay
    set balloondelay=250
endfunction

call ConfigureVimGo()

fu! ConfigureUntiship()
    "===============untisnip configs
    " Untisnip uses Tab for autocompletion - hence changing the keymap
    " Trigger configuration. Do not use <tab> if you use
    " https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-t>"
    let g:UltiSnipsJumpForwardTrigger="<c-f>"
    let g:UltiSnipsJumpBackwardTrigger="<c-b>"
    
    "autocmd BufWritePre *.py execute ':Black'
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    
    "eclim configs for java and other langs using eclipse
    " let g:EclimCompletionMethod = 'omnifunc' " not usinf eclim anymore - using coc-java now - hence commented out
endfunction

call ConfigureUntiship()

fu! ConfigureLivedown()
    " vim-livedown configs
    " should markdown preview get shown automatically upon opening markdown buffer
    let g:livedown_autorun = 1
    
    " should the browser window pop-up upon previewing
    let g:livedown_open = 1
    
    " the port on which Livedown server will run
    let g:livedown_port = 1337
    
    " the browser to use
    let g:livedown_browser = "firefox"
endfunction

"call ConfigureLivedown()

fu! ConfigureVimFugative()
    " vim fugative config
    "set statusline+=%{FugitiveStatusline()}
    " Fugitive Conflict Resolution
    nnoremap <leader>gd :Gvdiff<CR>
    " diffget & diffput are vim commands
    nnoremap gdh :diffget //2<CR>
    nnoremap gdl :diffget //3<CR>
endfunction

call ConfigureVimFugative()

fu! ConfigureAGAck()
    " Ag config (alongwith Ack)
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
endfunction

call ConfigureAGAck()

fu! ConfigureVimTest()
    " vim-test
    let g:test#runner_commands = ['Django', 'Nose', 'Nose2', 'PyTest', 'PyUnit', 'Maven', 'Gradle']
    
    let test#java#runner = 'maventest'
    let test#java#maventest#options = {
      \ 'nearest': '--fail-fast',
      \ 'file':    '--fail-fast', 
      \ 'suite':   '--fail-fast',
    \}
    
    "let test#python#runner = 'pytest'
    let test#python#djangotest#options = {
      \ 'nearest': '--failfast --keepdb',
      \ 'file':    '--failfast --keepdb',
      \ 'suite':   '--failfast --keepdb',
    \}
    
    let test#vim#term_position = "belowright"
endfunction

call ConfigureVimTest()

fu! ConfigureFZF()
    set rtp+=~/.fzf                                 " add fzf to env path
    " FZF configs
    map <C-f><C-f> :Files<cr>
    map <C-f><C-l> :Line<cr>
    map <C-f><C-r> :Rg<cr>
    map <Space><Space> :Files<cr>
    map <C-f> :Rg<cr>
endfunction

call ConfigureFZF()

fu! ConfigureCTag()
    " ctag configs
    set tags=tags,~/.tags                           " ask vim to pick tag generated by ctags
    "Ctrl+] - go to definition
    "Ctrl+T - Jump back from the definition.
    "Ctrl+W Ctrl+] - Open the definition in a horizontal split
    
    "Ctrl+\ - Open the definition in a new tab
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    
    "Alt+] - Open the definition in a vertical split
    map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 
endfunction

call ConfigureCTag()

fu! ConfigureVimAutoFormat()
    " Vim AutoFormat
    let g:formatterpath = ['~/black']
endfunction

" call ConfigureVimAutoFormat()

fu! ConfigureCOCBase()
    " if hidden is not set, TextEdit might fail.
    set hidden
    
    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup
    
    " Better display for messages
    set cmdheight=2
    
    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300
    
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    
    " always show signcolumns
    set signcolumn=yes
    
    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-space> to trigger completion. - this works on neovim only - hence commented out - Toran
    " inoremap <silent><expr> <c-space> coc#refresh()
    
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    
    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    
    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
    
    " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)
    
    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    endfunction

call ConfigureCOCBase()

fu! ConfigureCOCCustom()
    " fix comment highlight on json files
    autocmd FileType json syntax match Comment +\/\/.\+$+  
    " format/prettify whole file
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    " range format/prettify file with :f in visual mode
    vmap <leader>f  <Plug>(coc-format-selected)
    " range format/prettify file with :f in normal mode
    nmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  :<C-u>CocCommand prettier.formatFile<cr>
    
    " Ctrl-Space for completions. Heck Yeah!
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

endfunction

call ConfigureCOCCustom()

fu! ConfigureVimAnyFold()
    " zo opens a fold at the cursor.
    " zShift+o opens all folds at the cursor.
    " zc closes a fold at the cursor.
    " zShift+m closes all open folds.
    " zShift+r opens all folds - decreases the foldlevel to zero

    filetype plugin indent on " required
    " syntax on               " required - messing up with json comments highligh
    autocmd Filetype * AnyFoldActivate               " activate for all filetypes
    " or
    " autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype
    set foldlevel=0  " close all folds
    " or
    set foldlevel=99 " Open all folds
endfunction

call ConfigureVimAnyFold()
