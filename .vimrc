call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'dyng/ctrlsf.vim'
Plug 'tonchis/vim-to-github'
Plug 'prettier/vim-prettier'
Plug 'psf/black', { 'branch': 'stable'  }
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'jpalardy/vim-slime'
Plug 'lifepillar/vim-solarized8'

call plug#end()


" Space for a leader
let mapleader = " "

" Use js extension for jsx
let g:jsx_ext_required = 0

" Prettier
let g:prettier#config#print_width = '120'
let g:prettier#config#tab_width = '4'
let g:prettier#config#use_tabs = 'false'

" Formatting logic
autocmd FileType python nnoremap <leader>p :Black<CR>

set number      " show line numbers
set ruler       " Show cursor position.
set incsearch   " Highlight matches as you type.
set hlsearch    " Highlight matches.
set wrap        " Turn on line wrapping.

" Git setup
map <Leader>b :Git blame<cr>
map <Leader>w :ToGithub<cr>

" Tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" display whitespace chars
set list
set listchars=tab:␉·,trail:␠,nbsp:⎵

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Startup nerdtree if vim .
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Sync current buffer to nerdtree
map <Leader>r :NERDTreeFind<cr>
map <Leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Theme
syntax on
set t_Co=256
set background=dark
colorscheme solarized8

" Ignore files in CtrlP search
map <Leader>t :CtrlP<cr>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|build|coverage|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|pyc)$'
    \ }

" CtrlSF search options
map <Leader>f :CtrlSF
map <Leader>g :CtrlSFToggle<cr>
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'build', 'coverage']
let g:ctrlsf_ackprg = '/opt/homebrew/bin/ack'

" Split pane navigation
:nnoremap <Leader>l <C-w>l
:nnoremap <Leader>h <C-w>h
:nnoremap <Leader>j <C-w>j
:nnoremap <Leader>k <C-w>k
:nnoremap <Leader>m <C-w>=

" Slime / vim -> R/Python
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
map <Leader>a <Plug>SlimeParagraphSend
map <Leader>s :SlimeSend<cr>

set visualbell
set noswapfile
set cursorline
set cursorcolumn
