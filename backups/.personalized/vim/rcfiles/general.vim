" vim:ft=vim

"===================== General Settings =====================
set encoding=utf-8                              " encoding
set number                                      " set line number
" filetype plugin indent on                       " filetype func off
set title                                       " set filename in terminal window
" set nobackup
" set nowritebackup
" set noswapfile
set clipboard=unnamedplus                       " this supports only vim-gnome not vim or vim-tiny
set relativenumber                              " relative line number ON

fu! PyAutoActivateVenv()
"python with virtualenv support
    py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF
endfunction

call PyAutoActivateVenv()

fu! ConfigureIDEDesign()
    set hlsearch                                    " highlight search patterns
    colorscheme gruvbox                             " set colorscheme
    set background=dark                             " set bg color
    " colorscheme PaperColor                        " set colorscheme
    " set background=light                          " set bg color
    " set column limit/line length limit
    execute 'set colorcolumn=' .g:MAX_LINE_COL
endfunction

call ConfigureIDEDesign()

fu! ConfigureTabKeyBindings()
    " Tabs keybinding
    map <C-t><C-n> :tabnew<cr>
    map <C-t><up> :tabr<cr>
    map <C-t><down> :tabl<cr>
    map <C-t><left> :tabp<cr>
    map <C-t><right> :tabn<cr>

    " switch between tabs
    nnoremap <C-Up> :tabprevious<CR>
    nnoremap <C-Down> :tabnext<CR>
    
    " open every buffer in a new tab
    " https://vim.fandom.com/wiki/Open_every_buffer_in_its_own_tabpage
    " :au BufAdd,BufNewFile,BufRead * nested tab sball
    " :au BufRead * nested tab sball
endfunction

call ConfigureTabKeyBindings()

fu! ConfigureIntelliJAlikeKeyBinding()
    :nnoremap <C-A-Left> <C-o>
    :nnoremap <C-A-Right> <C-i>
    nmap <silent> <C-b> <Plug>(coc-definition) 
endfunction

call ConfigureIntelliJAlikeKeyBinding()

fu! ConfigureRunFile()
    "vim-run <F4> 
    autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
    autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    "autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % :r&& java %:r<CR>
    " TODO: F4
    autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % :r&& java %:r<CR>
    "autocmd filetype php nnoremap <Leader>c :w <CR>:!clear && php  %<CR>
    " TODO: F4
    autocmd filetype php nnoremap <Leader>c :w <CR>:!clear && php  %<CR>
    autocmd filetype go nnoremap <F4> :GoRun <CR>
    " execute python code usin F9
    nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
endfunction

call ConfigureRunFile()

fu! ConfigureManualCodeFolding()
    " zo opens a fold at the cursor.
    " zShift+o opens all folds at the cursor.
    " zc closes a fold at the cursor.
    " zm increases the foldlevel by one.
    " zShift+m closes all open folds.
    " zr decreases the foldlevel by one.
    " zShift+r decreases the foldlevel to zero == opens all folds
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2
endfunction

" call ConfigureManualCodeFolding()

fu! ConfigureCodeFoldKeymap()
    noremap <C-F5> :exe "normal zM"<CR>
endfunction

call ConfigureCodeFoldKeymap()
