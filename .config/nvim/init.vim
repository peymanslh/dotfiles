
" To use fzf: apt-get install fzf
" Use :Goyo for direction-free writing
" Run :GoUpdateBinaries for vim-go after installation
" Install jedi > pip install jedi

" vim plug ---- plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-rooter'
Plug 'machakann/vim-highlightedyank'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'fgrsnau/ncm2-aspell'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-go'
Plug 'junegunn/goyo.vim'
Plug 'ntk148v/vim-horizon'
Plug 'sainnhe/gruvbox-material'
call plug#end()

set encoding=utf-8
set number " Display line numbers on the left side
set ls=2 " This makes Vim show a status line even when only one window is shown
filetype plugin on " This line enables loading the plugin files for specific file types
set tabstop=4 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide
set expandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces

" Set softtabstop to control how many columns vim uses when you hit Tab in
" insert mode. If softtabstop is le
" ss than tabstop and expandtab is not set, vim will use a combination of tabs
" and spaces to make up the desir
" ed spacing. If softtabstop equals tabstop and expandtab is not set, vim will
" always use tabs. When expandtab
"  is set, vim will always use the appropriate number of spaces.
set softtabstop=4

" Set shiftwidth to control how many columns text is indented with the
" reindent operations (<< and >>) and a
" utomatic C-style indentation
set shiftwidth=4

set nowrap " Don't Wrap lines!
set nocp

" This changes the values of a LOT of options, enabling features which are not
" Vi compatible but really really nice
set clipboard=unnamed
set clipboard=unnamedplus

set autoindent " Automatic indentation
set cursorline " highlight current line
set cindent " This turns on C style indentation
set si " Smart indent
syntax enable " syntax highlighting
set showmatch " Show matching brackets
set hlsearch " Highlight in search, use :noh to disable

" undo even when file is closed
set undodir=~/.vimdid
set undofile

" disble arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" set ignorecase " Ignore case in search

set noswapfile " Avoid swap files
set mouse=a " Mouse Integration
set scrolloff=10
set foldmethod=indent
set foldlevel=99

"set termguicolors
set t_Co=256 " makes Vim use 256 colors
set background=dark " or light
" theme: https://github.com/sainnhe/gruvbox-material
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_palette = 'mix'
colorscheme gruvbox-material

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

set backspace=indent,eol,start " Fix backspace in macos
" set shell=sh " UnComment for fish shell
nnoremap <space> za

" use ctrl-p to open fzf
map <C-p> :FZF<CR>

" Ale config
let g:ale_completion_enabled = 1
let g:ale_linters = {
        \ 'go': ['gopls'],
        \}

" vim-go config
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Javascript setting
let g:javascript_plugin_jsdoc = 1
" let g:jsx_ext_required = 0

" Rust-lang plugins
let g:autofmt_autosave = 1
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
