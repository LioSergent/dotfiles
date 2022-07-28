"All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

set number
autocmd FileType help setlocal number
set laststatus=2
set autoread
au CursorHold * checktime  

" Remove delay after escape press in terminal vim
set timeoutlen=1000 ttimeoutlen=0

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
  " Line highlight depending on mode
  autocmd InsertEnter,InsertLeave * set cul!
endif

" Cursor change in terminal mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set encoding=utf8

" COLORS
" I don't which one is actually correct
" term=screen-256color is attempt to make colors work in vim+tmux
let g:solarized_termcolors=256
" set term=screen-256color-bce
set t_Co=256
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

set encoding=utf-8
syntax enable
set background=dark
colorscheme solarized8

" indentation de 4 espaces, y compris pour 'tab'
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"YCM python with virtualenv support
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/ycm_global_extra_conf.py'

set colorcolumn=100

" to reformat at right length
" set textwidth=99

" colors to indicate lines that are too long
autocmd Filetype python setlocal textwidth=79
autocmd Filetype python setlocal colorcolumn=80

autocmd Filetype matlab setlocal textwidth=99
autocmd Filetype matlab setlocal colorcolumn=100

autocmd Filetype rust setlocal textwidth=99
autocmd Filetype rust setlocal colorcolumn=100


autocmd Filetype tex setlocal textwidth=99
autocmd Filetype tex setlocal colorcolumn=100

autocmd Filetype markdown setlocal spell
autocmd Filetype markdown setlocal spelllang=fr,en
autocmd Filetype markdown setlocal conceallevel=1

autocmd Filetype tex setlocal spell
autocmd Filetype tex setlocal spelllang=fr,en

" on rétabli le fonctionnement 'normal' de 'backspace'
set backspace=indent,eol,start

" indentation automatique
set autoindent

"Hybrid numbers
" set number relativenumber
" set nu rnu

" from real python - maybe make specific
set fileformat=unix

" 5 lines at the begining and end of file when scrolling
set so=5

" For autocomplete preview
set wildmenu


" Default register = system clipboard
set clipboard=unnamedplus

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Disable saves and swaps
set nobackup
set nowritebackup
set noswapfile


" Allow rainbow brackets
let g:rainbow_active = 1

" path to workspace
set path=~ 

" Shortcuts
" Search and replace word under cursor using F4
" nnoremap <F4> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i don't how it works
"
let mapleader = ","
let maplocalleader = ","
noremap <leader>a :bprevious<cr>
noremap <leader>e :bnext<cr>
noremap <leader>t :NERDTree<cr>
noremap <leader>b :TagbarToggle<cr>
map <leader>i :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Goes to last spelling mistake and choses first suggestion
imap <F2> <Esc>mti<C-X>s<Esc>`tla

" Alt chars can be read by launching 'sed -n l' followed by pressing your 
" Alt+letter. Need to tell vim what it is before using Alt remaps
execute "set <A-z>=\ez"
nnoremap <A-z> <C-w>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Close a buffer without quiting window
nnoremap <leader>c :bp\|bd #<CR>

" Start server, useful for coupling vimtex with viewer
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

"Cite as you write function
function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>

" ctags
set autochdir
set tags=tags;
" Try to add libraries for matlab
autocmd Filetype matlab setlocal tags+=/home/liosergent/pkg/matlab/**/tags

"Vim Plugins
"

"Installation of vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Call Vimplug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'luochen1990/rainbow'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
" Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'LioSergent/matlab-vim' 
Plug 'djoshea/vim-matlab-fold'
call plug#end()

let g:black_quiet=1

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

" Precompile math
set conceallevel=1
let g:tex_conceal='abdmgs'
"
" let g:rainbow_ctermfgs = ['lightred', 'green', 'blue', 'yellow', 'grey'] 
let g:rainbow_conf = {
\	'ctermfgs': ['darkgreen', 'magenta', 'darkyellow', 'darkblue', 'yellow', 'red'],
\}

let g:UltiSnipsSnippetStorageDirectoryForUtilSnipsEdit = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:airline#extensions#tabline#enabled = 1
let g:syntastic_matlab_mlint_exec = '/usr/local/MATLAB/R2020b/bin/glnxa64/mlint'
let g:ale_matlab_mlint_executable = '/usr/local/MATLAB/R2020b/bin/glnxa64/mlint'
let g:ale_echo_msg_format = '%linter%::%s'

let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen=1

let g:tagbar_width = max([25, winwidth(0) / 10])
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Markdown
let g:mkdp_auto_close = 0
let g:mkdp_browser = 'firefox'


set statusline+=%{gutentags#statusline()}
