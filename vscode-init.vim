call plug#begin('~/.config/nvim/plugged-vscode/')
  " Better Find:
  Plug 'rhysd/clever-f.vim'

  " LaTeX Plugins:
  Plug 'lervag/vimtex', {'for': 'tex'}

  " Tim Pope:
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
call plug#end()


""""""""""""""""
" KEYBINDINGS: "
""""""""""""""""

autocmd!
" Change Leaders:
let mapleader = " "
let maplocalleader = ","

" Movement Keybinds:
if exists('g:vscode')
  nmap j gj
  nmap k gk
  vmap j gj
  vmap k gk
else
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk
endif
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
nnoremap V v$

"  " Tab Movement:
nnoremap K gt
nnoremap J gT


"if exists('g:vscode')
"else
"  " Easier Split Navigation:
"  nnoremap <Leader> <C-w>
"
"  " Exit Terminal:
"  nnoremap <C-q> <C-\><C-n>
"
"  " View Errors:
"  nmap <Leader>e :lopen<CR>
"
"  " Remove Trailing Spaces:
"  nnoremap <Leader>x ma:%s/\s\+$//<CR>:nohl<CR>'a
"
"  " Open New Buffer:
"  nmap <leader>t :tabnew<CR>
"
"endif


"""""""""""""""
" Better VIM: "
"""""""""""""""

" Colourscheme:
set expandtab
set shiftwidth=2
set softtabstop=2

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" TEXT: """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable soft-wrapping for text files
autocmd FileType mail,text,markdown,html,tex setlocal wrap
" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell

autocmd FileType tex syntax sync minlines=200

" Set up vim-surround for LaTeX command:
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

let g:tex_fast="mMr"

" Set up vimtex:
" let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 0

let g:vimtex_quickfix_enabled = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" MISC """"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clever-f:
let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 3000


" Autocompletion:
" Other miscellaneous options
" set number
set relativenumber
set hidden
set cursorline
set title
set ttimeoutlen=0
set autowrite
let $PAGER=''

" Folding:
set foldmethod=manual
set foldnestmax=2
set foldlevel=0
set foldenable
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END

set lazyredraw
set whichwrap+=<,>,h,l
set display=lastline
set icm=nosplit
set breakindent
" set iskeyword-=_
set mouse=a
