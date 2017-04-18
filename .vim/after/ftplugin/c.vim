" LINUX KERNEL CODING STYLE
" 80 characters line
set colorcolumn=81
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

"Highlight Trailing Spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" LINUX KERNEL CODING STYLE
"
" folding
set foldmethod=syntax
"set foldlevel=1
set foldclose=all

