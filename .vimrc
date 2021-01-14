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

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

set backspace=indent,eol,start " Fix backspace in macos
" set shell=sh " UnComment for fish shell
nnoremap <space> za
