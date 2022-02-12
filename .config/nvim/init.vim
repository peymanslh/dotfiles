
" Requirements
" Install python3
" Install jedi lsp > pip install jedi-language-server
" Install Go
" Install Node.js
" Install vim-plug
" -------------------------
" Shortcuts -------
" User ctrl-p for search file
" Use :Ve for file explorer
" Type :Rg <text> for serach a keyword in files
" Use :Goyo for direction-free writing
" Type :Codi for an interactive scratchpad
" -------------------------
" KEYMAP
" :Goyo > focus view
" :Codi > REPL mode
" K > show doc
" gh > show refrence and defenition
" ca > code action
" gr > rename var or function
" gp > preview def
" :Commits > show commits
"
"
"
" vim plug ---- plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim'
Plug 'wakatime/vim-wakatime'
Plug 'metakirby5/codi.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'wadackel/vim-dogrun'

Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" nvim > 0.5.0
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'

Plug 'puremourning/vimspector'
call plug#end()


" ---------------------------------------------
"                Basic config
" ---------------------------------------------
set encoding=utf-8
set ls=2 " This makes Vim show a status line even when only one window is shown
filetype plugin on " This line enables loading the plugin files for specific file types
set tabstop=4 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide
set expandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

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
" set cursorline " highlight current line
set cindent " This turns on C style indentation
set si " Smart indent
syntax enable " syntax highlighting
set showmatch " Show matching brackets
set hlsearch " Highlight in search, use :noh to disable

" undo even when file is closed
set undodir=~/.nvimdid
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

set backspace=indent,eol,start " Fix backspace in macos
" set shell=sh " UnComment for fish shell
nnoremap <space> za

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20



" ---------------------------------------------
"                Colorscheme config
" ---------------------------------------------
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"set t_Co=256 " makes Vim use 256 colors
set background=dark " or light

let g:gruvbox_italic = 1
"colorscheme gruvbox
colorscheme dogrun

highlight Comment cterm=italic gui=italic

" lightline
let g:lightline = {
    \ 'colorscheme': 'dogrun',
    \ 'active': {
    \   'left': [
    \     [ 'mode', 'paste' ],
    \     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \   ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \ }
    \ }



" ---------------------------------------------
"                Plugins config
" ---------------------------------------------
" blamer config
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0

" use ctrl-p to open fzf
map <C-p> :Files <CR>

" vim-go config
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Jedi-vim
let g:jedi#environment_path = "/usr/local/bin/python3.9"
let g:jedi#environment_path = ".venv"

" ale - use it with coc
let g:ale_disable_lsp = 1

" set python path
let g:python3_host_prog = expand("/usr/local/bin/python3.9")

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" saga lsp
" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

inoremap <silent> <C-k> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

nnoremap <silent> gp <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>

" vim insprctor
packadd! vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" Import LSP config lua file
luafile ~/.config/nvim/lua-conf.lua
