" vim:ft=vim

"===================== General Settings =====================
set encoding=utf-8                              " encoding
set number                                      " set line number
" filetype plugin indent on                       " filetype func off
set title                                       " set filename in terminal window
" set nobackup
" set nowritebackup
" set noswapfile
set clipboard^=unnamed,unnamedplus                       " this supports only vim-gnome not vim or vim-tiny
set relativenumber                              " relative line number ON
set autoread                                    " automatically refresh any files that haven't been edited by Vim
set mouse=nicra

"===================== Issue Fix =====================
" Issue: https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""
let &t_TE = ""

"===================== Other =====================

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

" call PyAutoActivateVenv()  "OBSOLETE: coc-python takes care of auto venv - supports virtualenv + pipenv

fu! ConfigureIDEDesign()
    set hlsearch                                    " highlight search patterns
    colorscheme gruvbox                             " set colorscheme; dependency=Plug
    " colorscheme PaperColor                        " set colorscheme
    set background=dark                             " set bg color
    " set background=light                          " set bg color
    " set column limit/line length limit
    execute 'set colorcolumn=' .g:MAX_LINE_COL
    " set cursorcolumn                              " highlight cursor column
    " set cursorline                                " highlight cursor row
endfunction

call ConfigureIDEDesign()

" Switch into the specified Tab number.
"
" @param direction.
fu! TabSwitch(direction)
    execute "tabnext ".a:direction
endfunction

" Move current tab into the specified direction.
"
" @param direction -1 for left, 1 for right.
fu! TabMove(direction)
    " get number of tab pages.
    let ntp=tabpagenr("$")
    " move tab, if necessary.
    if ntp <= 1
        return
    endif
    " get number of current tab page.
    let ctpn=tabpagenr()
    let new_idx = a:direction

    if a:direction > 0
        let new_idx = "+1"
        if ctpn+1>ntp
            let new_idx = "0"
        endif
    elseif a:direction < 0
        let new_idx = "-1"
        if ctpn-1<1
            let new_idx="$"
        endif
    endif

    " execute "echo 'ntp' ntp 'ctpn' ctpn 'I' new_idx"
    " move tab page.
    execute "tabmove ".new_idx
endfunction

fu! ConfigureTabKeyBindings()
    " TABS KEYBINDING

    " OPEN NEW TAB
    map <C-n> :tabnew<cr>

    " SWITCH BETWEEN TABS
    nnoremap <C-Up> :tabprevious<CR>
    nnoremap <C-Down> :tabnext<CR>
    " map <C-t><up> :tabr<cr>
    " map <C-t><down> :tabl<cr>
    " map <C-t><left> :tabp<cr>
    " map <C-t><right> :tabn<cr>
    
    " SWITCH tabs by number (0 & 1 are not detected)
    "map <C-@> :call TabSwitch(2)<CR>
    "map <C-[> :call TabSwitch(3)<CR>
    " map <C-\> :call TabSwitch(4)<CR>
    " map <C-]> :call TabSwitch(5)<CR>
   
    " RELOCATE TABS RELATIVELY
    map <C-t><Left> :call TabMove(-1)<CR>
    map <C-t><Right> :call TabMove(1)<CR>
    
    " OPEN EVERY BUFFER IN A NEW TAB
    " https://vim.fandom.com/wiki/Open_every_buffer_in_its_own_tabpage
    " :au BufAdd,BufNewFile,BufRead * nested tab sball
    " :au BufRead * nested tab sball

endfunction

call ConfigureTabKeyBindings()

" TODO: save current session with dir structure

fu! ConfigureRunFile()
    "vim-run <F4> 
    autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
    autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype java nnoremap <F4> :w <bar> exec '!javac '.shellescape('%').' && java '.shellescape('%:r')<CR>
    " TODO: F4 
    " autocmd filetype php nnoremap <Leader>c :w <CR>:!clear && php  %<CR>
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

" call ConfigureManualCodeFolding()  " turning it off as VimAnyFold does better

fu! ConfigureCodeFoldKeymap()
    noremap <C-F5> :exe "normal zM"<CR>
endfunction

call ConfigureCodeFoldKeymap()
