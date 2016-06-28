call plug#begin('~/.config/nvim/plugged/')

" UI:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colourscheme:
Plug 'altercation/vim-colors-solarized'

" Better Brackets:
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/matchit'

" Fast Folding:
Plug 'Konfekt/FastFold'

" Tim Pope IS A GOD:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Faster Coding:
Plug 'Shougo/deoplete.nvim'

" Easy Errorchecking:
Plug 'benekastah/neomake'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" NotMuch FrontEnd:
Plug 'felipec/notmuch-vim'

" Nice Search:
" Plug 'osyo-manga/vim-over'

" TextObjects:
Plug 'kana/vim-textobj-user'
Plug 'gilligan/vim-textobj-haskell', {'for' : 'haskell'}

""""""""""""""""""""""
" LANGUAGE SPECIFIC: "
""""""""""""""""""""""

" LaTeX Plugins:
Plug 'lervag/vimtex', {'for': 'tex'}

" Haskell Plugins:
Plug 'raichoo/haskell-vim', {'for' : 'haskell'}
Plug 'nbouscal/vim-stylish-haskell', {'for' : 'haskell'}
Plug 'eagletmt/neco-ghc', {'for' : 'haskell'}
Plug 'eagletmt/ghcmod-vim', {'for' : 'haskell'}
Plug 'chrisdone/hindent', {'for' : 'haskell'}

" Sage Plugins:
Plug 'petRUShka/vim-sage'

" PureScript Plugins:
Plug 'FrigoEU/psc-ide-vim/', {'for' : 'purescript'}
Plug 'raichoo/purescript-vim', {'for' : 'purescript'}

" Pandoc Plugins:
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 

call plug#end()


""""""""""""""""
" KEYBINDINGS: "
""""""""""""""""

" Change Leaders:
let mapleader = " "
let maplocalleader = ","

" Movement Keybinds:
nnoremap j gj
nnoremap k gk
noremap H ^
noremap L $
vnoremap L g_


" Smart Indentation:
vnoremap < <gv
vnoremap > >gv


" Productivity Keybinds:
nnoremap Q <nop>
nnoremap ; :
nnoremap Y y$


" Easier Split Navigation:
nnoremap <Leader> <C-w>

" Exit Terminal:
nnoremap <C-q> <C-\><C-n>

" View Errors:
nmap <Leader>e :lopen<CR>

" Make:
nnoremap <Leader>m :make<CR><CR><CR>

" Remove Trailing Spaces:
nnoremap <Leader>x ma:%s/\s\+$//<CR>:nohl<CR>'a

" Open New Buffer:
nmap <leader>t :tabnew<CR>

" Tab Movement:
nnoremap K gt
nnoremap J gT

autocmd! BufWritePost * Neomake

"""""""""""""""
" Better VIM: "
"""""""""""""""

" Better Indentation:
set expandtab
set shiftwidth=2
set softtabstop=2

" Sudo Save:
command! W w !sudo tee % > /dev/null

" Syntax Highlighting:
filetype plugin indent on
syntax enable
set encoding=utf-8

" Colourscheme:
colorscheme solarized
set background=light


" Use System Clipboard:
set clipboard=unnamedplus

"
" Wildmenu For Better Navigation:
set wildchar=<Tab>
set wildignore=*.swp,*.pyc,*.bak,*.class
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.log,*.aux,*.out,*.toc,*.fls    " LaTeX intermediate files
set wildignore+=*.bbl,*.blg,*.fdb_latexmk,*.dvi  " LaTeX intermediate files
set wildignore+=*.synctex.gz,*.brf,*.pdf         " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.hi                             " Haskell intermediate file
set wildignore+=*.orig                           " Merge resolution files

" Set up defaults for search
set ignorecase
set smartcase
set showmatch
nnoremap <leader><leader> :noh<CR>

" Set up wrapping lines
set linebreak
set nolist
set formatoptions+=l
set colorcolumn=79
set nowrap

" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell

" Enable soft-wrapping for text files
autocmd FileType text,markdown,html,tex setlocal wrap "linebreak nolist

" set up Deoplete and completion
set complete+=U,s,k,kspell,d
set completeopt=menu,preview,noselect
set dictionary+="/usr/dict/words"
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><BS>   deoplete#mappings#smart_close_popup()."\<C-h>"


" Set up Statusline
let g:airline_powerline_fonts = 1

" Set up vim-surround
" LaTeX command
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

" Set up vimtex:
let g:vimtex_fold_enabled = 1


" Other miscellaneous options
set number
set relativenumber
set hidden
set cursorline
set title
set ttimeoutlen=0
set autowrite
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $PAGER=''

" Folding:
set foldmethod=syntax
set foldnestmax=10
set foldlevel=0
set foldenable

set whichwrap+=<,>,h,l
set display=lastline
