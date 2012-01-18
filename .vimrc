nmap . .`[

set spelllang=en_gb
set spell

"noremap J F|noremap <C-w>J <C-w>F

"L & H is remaped to S & T so unmap L & H
"nnoremap L <Nop>
"nnoremap H <Nop>

"Remap ctrl-n to be save. I don't think :w<CR> is helping my rsi.
"nnoremap <C-n> :w<CR>

" set the various plugin paths
set runtimepath+=/home/jack/.vim/gnupg
set runtimepath+=/home/jack/.vim/commentary
set runtimepath+=/home/jack/.vim/gundo
set runtimepath+=/home/jack/.vim/puppet
set runtimepath+=/home/jack/.vim/repeat
set runtimepath+=/home/jack/.vim/surround
set runtimepath+=/home/jack/.vim/speeddating
set runtimepath+=/home/jack/.vim/solarized
set runtimepath+=/home/jack/.vim/utl

source /home/jack/.vim/udev.vim
source /home/jack/.vim/autotag.vim

nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<cr>
nnoremap <leader>w :set nowrap!<cr>
nnoremap <leader>m :GundoToggle<cr>
nnoremap <leader>r :set filetype=ruby<cr>

syntax enable
syntax sync fromstart

filetype on
filetype plugin on
filetype indent on

map sb :se paste<cr>ggI#!/usr/bin/env ruby<cr># -*- encoding: utf-8 -*-<cr><cr><esc>`':se nopaste<cr>
map us :se paste<cr>ggI# -*- encoding: utf-8 -*-<cr><esc>`':se nopaste<cr>

highlight Pmenu ctermbg=238 gui=bold

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufWritePre * :%s/\s\+$//e

let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_termtrans=1

syntax enable
set background=dark
colorscheme solarized


runtime macros/matchit.vim

:nohlsearch

let g:allml_global_maps = 1
let loaded_matchparen = 1

" rails stuff.

"set nocompatible  " We don't want vi compatibility.

if $USER != 'root'
  set modeline
else
  set nomodeline
endif

set tags=tags;

set pastetoggle=<c-v>

set viminfo^=!
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

set autoindent

" For vim/ctags to recognise methods with a ?
set iskeyword+=?

" Visual
set novisualbell  " No blinking .
set noerrorbells  " No noise.

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set nonumber

" See http://items.sjbach.com/319/configuring-vim-right for an
" explanation of the following:
set hidden
set wildmode=list:longest,full

set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" persistent undo.
if v:version >= 703
  set undofile
  set undodir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
endif

" Shorten messages
set shortmess=aI

" Don't add two spaces when joining lines
set nojoinspaces

" Vi-style editing in the command-line
"nnoremap : q:a
"nnoremap / q/a
"nnoremap ? q?a

" Set the title in screen.
if $TERM=='screen' || $TERM=='screen-256color'
    exe "set title titlestring=%f"
    exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

if has("gui_running")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=R
  set guioptions-=b

  colorscheme slate
endif
