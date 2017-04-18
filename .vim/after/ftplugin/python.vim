" PYTHON settings
"

" Enable folding
set foldmethod=indent
set foldlevel=99

" PEP8 indentation
au BufNewFile, BufRead *.py
                        \ set tabstop=4
                        \ set softtabstop=4
                        \ set shiftwidth=4
                        \ set textwidth=79
                        \ set expandtab
                        \ set autoindent
                        \ set fileformat=unix

" Flag Whitespace

" UTF-8
set encoding=utf-8

" pretty code
let python_highlight_all=1
syntax on


" from website realpython.com vim and python a match made in heaven
"
" later need to install the plugins it suggests and clean up my
" .vimrc
