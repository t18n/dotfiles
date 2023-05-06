" JSON
setl nospell
setl nowrap
setl tabstop=2
setl shiftwidth=2

" Pretty-print JSON
noremap <Leader>p :% !aeson-pretty --indent=2<CR>
" Sort Pretty-print JSON
noremap <Leader>s :% !aeson-pretty --sort --indent=2<CR>
" Compact JSON
noremap <Leader>c :% !aeson-pretty --compact<CR>