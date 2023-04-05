" vim:ft=vim

" ================= Plugin Configs ================

fu! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

fu! ConfigureLightline()
    " lightline fix
    set laststatus=2
    let g:lightline = {
          \ 'active': {
          \   'left': [
          \         [ 'paste', ],
          \         [ 'gitbranch', 'readonly', 'filename', 'modified', ],
          \         [ 'tagbar', ],
          \   ],
          \   'right': [ [ 'lineinfo' ],
          \              [ 'percent' ],
          \              [ 'fileformat', 'fileencoding', 'filetype', ]
          \   ]
          \ },
          \ 'component': {
          \         'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
          \ },
          \ 'component_function': {
          \   'gitbranch': 'gitbranch#name',
	      \   'cocstatus': 'coc#status',
	      \   'currentfunction': 'CocCurrentFunction',
          \ },
          \ 'colorscheme': 'seoul256',
          \ }
    " g:lighline.colorscheme: if PaperColor installed & enabled
    " Use auocmd to force lightline update.
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
endfunction

call ConfigureLightline()

fu! ConfigureNerdTree()
    " NERDTree shortcut
    map <C-l> :NERDTreeToggle<CR>
    map <C-f> :NERDTreeFind<CR>
    
    " open files in new tab - DIR FIX: see plugins
    " let g:NERDTreeMapOpenInTab='<ENTER>'
    " let g:NERDTreeMapActivateNode='<ENTER>'
    " let NERDTreeCustomOpenArgs = {'file':{'reuse':'all', 'where': '<ENTER>', 'keepopen': 1}}
    " TODO: introduce NERDTreeMapActivateNodeOrOpenInTab
    " TODO: open the existing NERDTree on each new tab, and toggle NERDTree should toggle in all the tabs
endfunction

call ConfigureNerdTree()

fu! ConfigureVimTemplate()
    " Customize the settings for vim-template plugin
    let g:email = "toran.sahu@yahoo.com"
    let g:user = "Toran Sahu"
    
    let g:templates_user_variables = [
		\   ['FULLPATH', 'GetFullPath'],
		\   ['CURRDIRNAME', 'GetCurrDirName'],
		\ ]

	function! GetFullPath()
		return expand('%:p')
	endfunction

    fu! GetCurrDirName()
        return fnamemodify(fnamemodify(expand('%'), ':h'), ':t')
    endfunction

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
    " let g:ale_linters = {'python': ['flake8', ], 'go': ['gopls', ],}
    let g:ale_linters = {'python': ['flake8', ],}
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

" call ConfigureALE()

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
    " let g:go_gopls_enabled = 0          " `0` to disable VimGo + gopls
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

" call ConfigureVimGo()

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

" fu! ConfigureLivedown()
"     " vim-livedown configs
"     " should markdown preview get shown automatically upon opening markdown buffer
"     let g:livedown_autorun = 1
    
"     " should the browser window pop-up upon previewing
"     let g:livedown_open = 1
    
"     " the port on which Livedown server will run
"     let g:livedown_port = 1337
    
"     " the browser to use
"     let g:livedown_browser = "firefox"
" endfunction

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
    
    " let g:test#java#runner = 'maventest' " not defining explicitly; vim-test algo with decide
    let g:test#java#maventest#options = {
      \ 'nearest': '--fail-fast -Dmaven.test.skip=false',
      \ 'file':    '--fail-fast -Dmaven.test.skip=false', 
      \ 'suite':   '--fail-fast -Dmaven.test.skip=false',
    \}

    " maven specific: this commit
    " https://github.com/janko/vim-test/commit/8e137f223df427e620496f02f0fda6363a76435f#diff-de9502e2cc9bf7533b5e918d295734cb
    " requires Surefire Plugin 2.19.1 (https://maven.apache.org/surefire/maven-surefire-plugin/examples/single-test.html)
    " TODO: send PR to use test pattern based on Surefire version.
    let g:test#java#maventest#fqcn = 0
    
    "let test#python#runner = 'pytest' " not defining explicitly; vim-test algo with decide
    let g:test#python#djangotest#options = {
      \ 'nearest': '--failfast --keepdb',
      \ 'file':    '--failfast --keepdb',
      \ 'suite':   '--failfast --keepdb',
    \}

    " let g:test#python#djangotest#executable = 'python manage.py test --failfast --keepdb' " not required - already ^^
    
    let g:test#go#gotest#options = {
      \ 'nearest': '-v',
      \ 'file':    '-v',
      \ 'suite':   '-v',
    \}

    let g:test#vim#term_position = "belowright"

    " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
    nmap <silent> t<C-t> :TestNearest<CR>
    " nmap <silent> t<C-f> :TestFile<CR>
    " nmap <silent> t<C-s> :TestSuite<CR>
    " nmap <silent> t<C-l> :TestLast<CR>
    " nmap <silent> t<C-g> :TestVisit<CR>
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
    " May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
    " utf-8 byte sequence
    set encoding=utf-8
    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup
    
    " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    " delays and poor user experience
    set updatetime=300
    
    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved
    set signcolumn=yes
    
    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    
    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif
    
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>
    
    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction
    
    " Highlight the symbol and its references when holding the cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)
    
    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    
    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)
    
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    
    " Remap <C-f> and <C-b> to scroll float windows/popups
    " if has('nvim-0.4.0') || has('patch-8.2.0750')
    "   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    "   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    "   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    "   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    "   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    "   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    " endif
    
    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
    
    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')
    
    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
    
    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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
    " mimic intellij
    :nnoremap <C-A-Left> <C-o>
    :nnoremap <C-A-Right> <C-i>
    nmap <silent> <C-b> <Plug>(coc-definition) 
endfunction

call ConfigureCOCCustom()

fu! ConfigureCOCAnsible()
    let g:coc_filetype_map = {
        \ 'yaml.ansible': 'ansible',
        \ }
endfunction

call ConfigureCOCAnsible()

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

fu! ConfigureCodeFMT()
    call glaive#Install()
    Glaive codefmt plugin[mappings]
    Glaive codefmt google_java_executable="java -jar /home/toransahu/.vim/google-java-format-1.7-all-deps.jar"
endfunction

call ConfigureCodeFMT()

fu! ConfigureMarkdownPreview()
    "-------------DEFAULT CONFIG START-------------
    " set to 1, nvim will open the preview window after entering the markdown buffer
    " default: 0
    let g:mkdp_auto_start = 0
    
    " set to 1, the nvim will auto close current preview window when change
    " from markdown buffer to another buffer
    " default: 1
    let g:mkdp_auto_close = 1
    
    " set to 1, the vim will refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
    " default: 0
    let g:mkdp_refresh_slow = 0
    
    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it can be use in markdown file
    " default: 0
    let g:mkdp_command_for_global = 0
    
    " set to 1, preview server available to others in your network
    " by default, the server listens on localhost (127.0.0.1)
    " default: 0
    let g:mkdp_open_to_the_world = 0
    
    " use custom IP to open preview page
    " useful when you work in remote vim and preview on local browser
    " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
    " default empty
    let g:mkdp_open_ip = ''
    
    " specify browser to open preview page
    " default: ''
    let g:mkdp_browser = ''
    
    " set to 1, echo preview page url in command line when open preview page
    " default is 0
    let g:mkdp_echo_preview_url = 0
    
    " a custom vim function name to open preview page
    " this function will receive url as param
    " default is empty
    let g:mkdp_browserfunc = ''
    
    " options for markdown render
    " mkit: markdown-it options for render
    " katex: katex options for math
    " uml: markdown-it-plantuml options
    " maid: mermaid options
    " disable_sync_scroll: if disable sync scroll, default 0
    " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
    "   middle: mean the cursor position alway show at the middle of the preview page
    "   top: mean the vim top viewport alway show at the top of the preview page
    "   relative: mean the cursor position alway show at the relative positon of the preview page
    " hide_yaml_meta: if hide yaml metadata, default is 1
    " sequence_diagrams: js-sequence-diagrams options
    " content_editable: if enable content editable for preview page, default: v:false
    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false
        \ }
    
    " use a custom markdown style must be absolute path
    " like '/Users/username/markdown.css' or expand('~/markdown.css')
    let g:mkdp_markdown_css = ''
    
    " use a custom highlight style must absolute path
    " like '/Users/username/highlight.css' or expand('~/highlight.css')
    let g:mkdp_highlight_css = ''
    
    " use a custom port to start server or random for empty
    let g:mkdp_port = ''
    
    " preview page title
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'
    "-------------DEFAULT CONFIG END-------------
    

    "-------------DEFAULT MAPPING START-------------
    " <Plug>MarkdownPreview
    " <Plug>MarkdownPreviewStop
    " <Plug>MarkdownPreviewToggle

    nmap <C-s> <Plug>MarkdownPreview
    nmap <M-s> <Plug>MarkdownPreviewStop
    nmap <C-p> <Plug>MarkdownPreviewToggle
    "-------------DEFAULT MAPPING END-------------
    

    let g:mkdp_refresh_slow = 1
    let g:mkdp_command_for_global = 1

endfunction

call ConfigureMarkdownPreview()

fu! ConfigureVimSpector()
    let g:vimspector_enable_mappings = 'HUMAN'
    " packadd! vimspector
endfunction

call ConfigureVimSpector()

fu! ConfigurePyDocString()
    " TODO: automate it, e.g.: system('which doq')
    let g:pydocstring_doq_path = '~/.local/bin/doq'
    
    " choice[pydocstring_formatter] = Sphinx, Numpy, Google
    let g:pydocstring_formatter = 'sphinx'
    nmap <silent> <C-_> <Plug>(pydocstring)
endfunction

call ConfigurePyDocString()

fu! ConfigureTpopeRhubarb()
    let g:github_enterprise_urls = ['https://gerrit.corp.arista.io']
endfunction

call ConfigureTpopeRhubarb()

set guifont=:h

