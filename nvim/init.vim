" Plugin Management
" Enable vim-plug https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" Onehalf theme https://github.com/sonph/onehalf/tree/master/vim
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" vim-commentary https://github.com/tpope/vim-commentary
" Type gcc to comment out a line
Plug 'tpope/vim-commentary'

" Python pep8 indent https://github.com/Vimjas/vim-python-pep8-indent
Plug 'Vimjas/vim-python-pep8-indent'

" FZF: Fuzzy file search
" See https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git-Gutter (add diff symbols in the sign column)
Plug 'airblade/vim-gitgutter'

" Syntastic
Plug 'scrooloose/syntastic'

" Airline
" See https://vimawesome.com/plugin/vim-airline-superman for more info
Plug 'vim-airline/vim-airline'

" ALE Linting
" See https://vimawesome.com/plugin/ale for more info
Plug 'dense-analysis/ale'

" Trailing whitespace highlighter
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" NerdTree
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Hotkey to open/move to NERDTree:
nnoremap <leader>n :NERDTreeFocus<CR>

" Syntastic configs
" See https://vimawesome.com/plugin/syntastic for more info
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Readability/UI
" enable syntax highlighting
syntax enable

" Syntax highlighting for groovy/Jenkins
autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy

" OneHalf Theme settings
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

"set tabs to triangles and spaces to dots
"set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" enable folding
"set foldenable

" open most folds by default
"set foldlevelstart=10

" set max of 10 nested folds
"set foldnestmax=10

" set <space> to open/close folds
"nnoremap <space> za

" set fold based on indent level
"set foldmethod=indent

" show line numbers
set number

" set tabs to have 4 spaces
set tabstop=4

"set soft tabs (number of tabs when editing) to 4
"set softtabstop=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces (this won't work with Makefiles!)
set expandtab

" load filetype-specific indent files (found in ~/.vim/indent/python.vim)
"filetype plugin indent on

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to
"set lazyredraw

" when using the >> or << commands, shift lines by 4 spaces
"set shiftwidth=4

" Update every second (default 4000 -> this is for git gutter updating)
set updatetime=1000

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" Python
let python_highlight_all = 1

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" leader is comma instead of /
"let mapleader = "\<SPACE>"

" jk is ESC (uncomment to activate)
" inoremap jk <esc>

