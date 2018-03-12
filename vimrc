"deactivate mouse
set mouse=
" set color
set number
syntax on
set tabstop=2

" from bit
set t_Co=256
set number
colorscheme koehler
set background=dark
set hidden
set history=100
filetype indent on
"set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
" set autoindent
set hlsearch
set ignorecase
set incsearch
set smartcase
set wildmenu
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" disable page up/down
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>
"set list
" for more visible cursor
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul
" add full file path to your existing statusline
set statusline=%F
set laststatus=2
