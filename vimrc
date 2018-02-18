set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" filetype plugin on

augroup vimrcEx
au!
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" color
color desert

" remap bufexplorer window selector
map <cr> \be

" highlight search
set hlsearch

" change vim swp/swo files location
set backup
set backupdir=/var/tmp/backups+swaps
set dir=/var/tmp/backups+swaps

" airline
set laststatus=2
set ttimeoutlen=50

" results in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

hi Search cterm=NONE ctermfg=black ctermbg=darkyellow

" indentation rules: 4 spaces, no tabs
" set expandtab
" set shiftwidth=4
" set softtabstop=4
" set cindent
" set cinoptions=(0
"

" GNU Coding Standards
set cindent
set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
set shiftwidth=2
set softtabstop=2
set textwidth=79
set fo-=ro fo+=cql
set expandtab

" allow tabs in Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=8

" airline
let g:airline#extensions#whitespace#enabled = 0

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Don't save options
set sessionoptions-=options

" e: tab behaviour
set wildmode=longest,list,full
set wildmenu

" don't lose undo history
set hidden

" tagbar
nmap <C-k> :TagbarToggle<CR>
