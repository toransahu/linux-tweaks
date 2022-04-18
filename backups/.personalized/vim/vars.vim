"========================= CONSTS ===========================
let MAX_LINE_COL=120
" not being used
let VIM_PYTHON_VENV='~/miniconda3'  


"========================= FUNCS ===========================
function! SourceConfigFilesIn(directory)
  let directory_splat = '~/.personalized/vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

function! SourceConfigIn(file)
    let file_path = . a:file
    if filereadable(file_path)
      execute 'source' file_path
    endif
endfunction



