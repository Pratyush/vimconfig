call plug#begin('~/.config/nvim/plugged/')

" UI:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Colourscheme:
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'nightsense/snow'
Plug 'arcticicestudio/nord-vim'

" Better Brackets:
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/matchit'

" Better Find:
Plug 'rhysd/clever-f.vim'

" Fast Folding:
Plug 'Konfekt/FastFold'

" Tim Pope:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Faster Coding:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'

"  Display changes in git:
Plug 'airblade/vim-gitgutter'

" TextObjects:
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

""""""""""""""""""""""
" LANGUAGE SPECIFIC: "
""""""""""""""""""""""

" General:
Plug 'Shougo/echodoc.vim'


" LaTeX Plugins:
Plug 'lervag/vimtex', {'for': 'tex'}

" Rust Plugins:
Plug 'cespare/vim-toml', {'for': 'toml'}

" Pandoc Plugins:
Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}

" Python Plugins:

" OCaml Plugins:
Plug 'rgrinberg/vim-ocaml'

" Text Plugins:
Plug 'reedes/vim-lexical', {'for': ['markdown', 'tex', 'text'] }

" Fish:
Plug 'dag/vim-fish', {'for': ['fish']}

call plug#end()


""""""""""""""""
" KEYBINDINGS: "
""""""""""""""""

autocmd!
" Change Leaders:
let mapleader = " "
let maplocalleader = ","

" Movement Keybinds:
nnoremap j gj
nnoremap k gk
noremap H ^
noremap L $
vnoremap L g_
vnoremap j gj
vnoremap k gk


" Smart Indentation:
vnoremap < <gv
vnoremap > >gv


" Productivity Keybinds:
nnoremap Q <nop>
nnoremap ; :
nnoremap Y y$
nnoremap V v$


" Easier Split Navigation:
nnoremap <Leader> <C-w>

" Exit Terminal:
nnoremap <C-q> <C-\><C-n>

" View Errors:
nmap <Leader>e :lopen<CR>

" Remove Trailing Spaces:
nnoremap <Leader>x ma:%s/\s\+$//<CR>:nohl<CR>'a

" Open New Buffer:
nmap <leader>t :tabnew<CR>

" Tab Movement:
nnoremap K gt
nnoremap J gT


"""""""""""""""
" Better VIM: "
"""""""""""""""

" Colourscheme:
set termguicolors
if strftime('%H') >= 7 && strftime('%H') < 19
  set background=light
else
  set background=dark
endif
let g:airline_theme = 'nord'
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_italic = 1
colorscheme nord

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

" Airline:
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_theme='onedark'
let g:airline#extensions#ale#enabled = 1


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
""""""""""""""""""""""""""""" COC: """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'rust': [] }
" let g:ale_rust_cargo_use_check = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" RUST: """""""""""""""""""""""""""

let g:rust_conceal = 1
" let g:rust_fold = 1
let g:rustfmt_autosave = 0
let g:racer_no_default_keybindings = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" TEXT: """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:neosolarized_visibility = "high"

let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
augroup TeX
  autocmd!
  autocmd FileType tex colorscheme NeoSolarized
  autocmd FileType tex AirlineTheme solarized
augroup END

" Enable soft-wrapping for text files
autocmd FileType mail,text,markdown,html,tex setlocal wrap
" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell

autocmd FileType tex syntax sync minlines=200

autocmd FileType mail set fo-=t
augroup CompileTeX
    autocmd FileType tex
        \ autocmd! CompileTeX BufWritePost <buffer> VimtexCompile
augroup END

" Set up vim-surround for LaTeX command:
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

let g:tex_fast="mMr"

" Set up vimtex:
" let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 0

let g:vimtex_quickfix_enabled = 1
let g:vimtex_quickfix_method = "pplatex"
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1

let g:vimtex_compiler_method = 'latexrun'
" let g:vimtex_compiler_latexrun = 'nvr'
" let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = "zathura"

let g:vimtex_compiler_latexrun = {
      \ 'backend' : "nvim",
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'options' : [
      \   '--verbose-cmds',
      \   '--latex-args="-synctex=1"',
      \   '--latex-args="-halt-on-error"',
      \ ],
      \}


augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,tex call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" MISC """"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CtrlP:
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
" let g:ctrlp_match_window_reversed = 0

" Clever-f:
let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 3000


" Autocompletion:
set complete+=U,s,k,kspell,d
set completeopt=menu,preview,noselect
set dictionary+="/usr/dict/words"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
