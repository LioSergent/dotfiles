map <leader>i :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" let g:UltiSnipsSnippetStorageDirectoryForUtilSnipsEdit = '~/.vim/UltiSnips'
" let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = "/home/liosergent/.vim/"

let g:python3_host_prog = "/home/liosergent/.pyenv/versions/nvim-env/bin/python"

" to get line numbers in netrw 
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

autocmd FileType netrw setlocal number

let g:UltiSnipsSnippetStorageDirectoryForUtilSnipsEdit = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
