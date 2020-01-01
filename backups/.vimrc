"~/.vimrc
"
" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings are being imported from external
" files.

set nocompatible

source ~/.personalized/vim/vars.vim

call plug#begin('~/.vim/plugged')
call SourceConfigFilesIn('plugins')
call plug#end()                                

call SourceConfigFilesIn('rcfiles')
call SourceConfigFilesIn('rcplugins')
