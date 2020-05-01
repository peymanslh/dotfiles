
" To use fzf: apt-get install fzf
" Use :Goyo for direction-free writing
" Install jedi > pip install jedi

:set encoding=utf-8

" Display line numbers on the left side
:set number

" This makes Vim show a status line even when only one window is shown
:set ls=2

" This line enables loading the plugin files for specific file types
:filetype plugin on

 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
:set tabstop=4

" When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
:set expandtab

" Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
:set softtabstop=4

" Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation
:set shiftwidth=4

" makes Vim use 256 colors
:set t_Co=256

" Don't Wrap lines!
:set nowrap

:set nocp

" This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
:set clipboard=unnamed
:set clipboard=unnamedplus

" Automatic indentation
:set autoindent

" highlight current line
:set cursorline

" This turns on C style indentation
:set cindent

" Smart indent
:set si

" syntax highlighting
:syntax enable

" Show matching brackets
:set showmatch

" Highlight in search, use :noh to disable
:set hlsearch

" undo even when file is closed
:set undodir=~/.vimdid
:set undofile

"" disable arrow keys
:nnoremap <up> <nop>
:nnoremap <down> <nop>
:inoremap <up> <nop>
:inoremap <down> <nop>
:inoremap <left> <nop>
:inoremap <right> <nop>


" Ignore case in search
"":set ignorecase

" Avoid swap files
:set noswapfile

" Mouse Integration
:set mouse=a

set scrolloff=10

:set foldmethod=indent
:set foldlevel=99

:nnoremap <space> za

" Fix backspace in macos
:set backspace=indent,eol,start

let g:ale_completion_enabled = 1

" vim plug ---- plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Insert plugin git url here then run :PluginInstall to install plugins 
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentLine'
Plug 'raimondi/delimitmate'
"Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
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
" Plug 'wakatime/vim-wakatime'
call plug#end()
" End of plugins list

:set termguicolors
:set background=dark " or light
" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_palette = 'mix'
:colorscheme gruvbox-material
" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" UnComment for fish shell
" set shell=sh

" vim markdown options
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" Javascript setting
let g:javascript_plugin_jsdoc = 1
" let g:jsx_ext_required = 0

" JSON setting
" disable hide quote
let g:vim_json_syntax_conceal = 0

" Indentline setting
let g:indentLine_char = '.'

" Rust-lang plugins
let g:autofmt_autosave = 1
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

map <C-n> :Vex<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

map <C-p> :FZF<CR>
" Map ctrl-h and ctrl-l to next and prev tab 
" map <C-h> :tabprevious<CR>
" map <C-l> :tabnext<CR>

" ALE config for go
let g:ale_linters = {
	\ 'go': ['gopls'],
	\}
" vim-go config
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Setup some styles for for OperatorMono font
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
