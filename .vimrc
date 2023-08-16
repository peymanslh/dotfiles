syntax enable
filetype plugin on

set encoding=utf-8
set ls=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END


set nowrap
set nocp

set clipboard=unnamed
set clipboard=unnamedplus

set autoindent
set cindent
set si
set showmatch
set hlsearch

set undodir=~/.vimdid
set undofile

" disble arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set noswapfile
set mouse=a
set scrolloff=10
set foldmethod=indent
set foldlevel=99

"set termguicolors
set t_Co=256
set background=dark

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

set backspace=indent,eol,start " Fix backspace in macos
nnoremap <space> za
