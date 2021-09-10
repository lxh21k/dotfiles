" ===
" === Editor behavior
" ===

set number
set relativenumber
set tabstop=4
" set autoindent
syntax on


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" Automatically populate the `g:airline_symbols` dictionary with the powerline
" symbols.
let g:airline_powerline_fonts = 1
