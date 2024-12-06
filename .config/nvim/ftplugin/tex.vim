let maplocalleader = ","
syntax on
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \    '-shell-escape',
    \    '-verbose',
    \    '-file-line-error',
    \    '-synctex=1',
    \    '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_open_on_warning=0
" Quickfix window supposed to open on error, but no focus
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_autoclose_after_keystrokes=0
let g:vimtex_complete_close_braces=1
let g:vimtex_toc_config = {
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'split_width' : 50,
      \ 'fold_enable': 1,
      \ 'fold_level_start': 1,
      \ 'show_help' : 1,
      \ 'indent_levels': 1,
      \}
      " \ 'resize' : 1,
      " \ 'todo_sorted' : 0,
      " \ 'show_numbers' : 1,
      " \ 'mode' : 2,
      "
let g:vimtex_grammar_vlty = {}
let g:vimtex_grammar_vlty.lt_directory = "~/pkg/LanguageTool-6.3"
" let g:vimtex_grammar_vlty.server = 'my' $ azelkjlazje $
let g:vimtex_grammar_vlty.show_suggestions = 1
let g:vimtex_grammar_vlty.shell_options =
        \   ' --multi-language'
        \ . ' --packages "*"'
        " \ . ' --define ~/vlty/defs.tex' 
        " \ . ' --replace ~/vlty/repls.txt'
        \ . ' --equation-punctuation display'
        \ . ' --languagemodel /home/liosergent/pkg/LanguageTool_n-grams'
        \ . ' --single-letters "i.\,A.\|z.\,B.\|\|"'
map <F9> :w <bar> compiler vlty <bar> make <bar> :cw <cr><esc>
" Precompile math
set conceallevel=1
let g:tex_conceal='abdmgs'

" colorscheme OceanicNext

autocmd Filetype tex setlocal textwidth=99
autocmd Filetype tex setlocal colorcolumn=100

function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1&command=parencite'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>
