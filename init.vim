call plug#begin('~/.config/nvim/plugged/')

" UI:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Colourscheme:
Plug 'joshdick/onedark.vim'

" Better Brackets:
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/matchit'

" Better Find:
Plug 'rhysd/clever-f.vim'

" Fast Folding:
Plug 'Konfekt/FastFold'

" Tim Pope IS A GOD:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Faster Coding:
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'

" Easy Error-checking:
Plug 'benekastah/neomake'

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

" Haskell Plugins:
Plug 'nbouscal/vim-stylish-haskell', {'for' : 'haskell'}
Plug 'eagletmt/neco-ghc', {'for' : 'haskell'}
Plug 'eagletmt/ghcmod-vim', {'for' : 'haskell'}
Plug 'chrisdone/hindent', {'for' : 'haskell'}
Plug 'gilligan/vim-textobj-haskell', {'for' : 'haskell'}

" Rust Plugins:
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}

" Pandoc Plugins:
Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}

" Python Plugins:
Plug 'zchee/deoplete-jedi', {'for': 'python'}

" Text Plugins:
Plug 'reedes/vim-lexical', {'for': ['markdown', 'tex', 'text'] }


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
let g:one_allow_italics = 1
colorscheme onedark
set background=dark

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
let g:airline_theme='onedark'
" let g:airline#extensions#ale#enabled = 1


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
""""""""""""""""""""""""" NEOMAKE: """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call neomake#configure#automake('rw', 1000)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""" ALE: """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_linters = { 'rust': ['cargo'] }
" let g:ale_rust_cargo_use_check = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" RUST: """""""""""""""""""""""""""

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ }
" if executable('rls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"         \ 'whitelist': ['rust'],
"         \ })
" endif

" nnoremap <silent> <leader>i :LspHover<CR>
" nnoremap <silent> <leader>d :LspDefinition<CR>
" nnoremap <silent> <leader>r :LspRename<CR>
" nnoremap <silent> <leader>f :LspDocumentFormat<CR>

let g:neomake_open_list = 2
let g:neomake_place_signs = 1
let g:neomake_rust_enabled_makers = ['cargo']
" augroup my_neomake_cmds
"     autocmd!
"     " Have neomake run cargo when Rust files are saved.
"     autocmd BufWritePost *.rs Neomake cargo
" augroup END

let g:rust_conceal = 1
let g:rust_fold = 1
let g:rustfmt_autosave = 0
let g:racer_no_default_keybindings = 1

let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#racer_binary='/home/mithrandir/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/mithrandir/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

au FileType rust nmap <buffer> <Leader>d <Plug>DeopleteRustGoToDefinitionSplit
au FileType rust nmap <buffer> <localleader>gd <Plug>DeopleteRustShowDocumentation


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" TEXT: """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable soft-wrapping for text files
autocmd FileType mail,text,markdown,html,tex setlocal wrap
" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell

autocmd FileType tex syntax sync minlines=400

autocmd FileType mail set fo-=t

" Set up vim-surround for LaTeX command:
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

let g:tex_fast="bMpr"

" Set up vimtex:
" let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 0

let g:vimtex_quickfix_enabled = 1
let g:vimtex_quickfix_method = "pplatex"
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1

let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = "zathura"

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd FileType tex let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

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


" Deoplete:
set complete+=U,s,k,kspell,d
set completeopt=menu,preview,noselect
set dictionary+="/usr/dict/words"
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><BS>   deoplete#mappings#smart_close_popup()."\<C-h>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif


" Other miscellaneous options
" set number
" set relativenumber
set hidden
set cursorline
set title
set ttimeoutlen=0
set autowrite
let $PAGER=''

" Folding:
" set foldmethod=manual
set foldnestmax=2
set foldlevel=0
set foldenable

set lazyredraw
set whichwrap+=<,>,h,l
set display=lastline
set icm=nosplit
set breakindent
" set iskeyword-=_
set mouse=a
