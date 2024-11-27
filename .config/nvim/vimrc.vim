map <leader>i :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/my_ulti_snippets']

let g:python3_host_prog = "/home/liosergent/.pyenv/versions/nvim-env/bin/python"

" to get line numbers in netrw 
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

autocmd FileType netrw setlocal number

let g:UltiSnipsSnippetStorageDirectoryForUtilSnipsEdit = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

filetype plugin on

autocmd Filetype tex setlocal textwidth=99
autocmd Filetype tex setlocal colorcolumn=100
