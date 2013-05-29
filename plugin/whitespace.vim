" Highlight Whitespace
function! SpaceHighlight()
    syntax match hi_trailing_whitespace /\s\+$/ containedin=ALL
    execute("highlight hi_trailing_whitespace ctermfg=1 cterm=underline gui=underline guifg=#4c4c4c")
	syntax match hi_blank_lines  /^\s\+$/ containedin=ALL
    execute("highlight hi_blank_lines ctermfg=1 cterm=underline gui=underline guifg=#4c4c4c")
endfunction

if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal! g'\"" | endif

    autocmd syntax * call SpaceHighlight()
endif

" Clean Whitespace
nnoremap <leader><backspace> :%s/\s\+$//<CR>
nnoremap <leader>o :put=''<CR>
nnoremap <leader>O :put!=''<CR>
