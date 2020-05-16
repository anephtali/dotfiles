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
Plugin 'Yggdroot/indentLine'

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

" set highlight color to orange
hi Search cterm=NONE ctermfg=black ctermbg=darkyellow

" airline
let g:airline#extensions#whitespace#enabled = 0

" don't save options
set sessionoptions-=options

" e: tab behaviour
set wildmode=longest,list,full
set wildmenu

" don't lose undo history
set hidden

" indentation rules: 4 spaces, no tabs
" set expandtab softtabstop=4 shiftwidth=4 cindent cinoptions=(0

" indentation rules: tabs
set autoindent noexpandtab tabstop=8 shiftwidth=8 cino+=(0

" allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

" display line numbers
set number

" color > 80 chars
" highlight OverLength ctermbg=magenta ctermfg=white
" match OverLength /\%81v.\+/

" backspace everywhere
set backspace=indent,eol,start

" disable mouse integration
set mouse-=a

" disable Ex mode
map q: <Nop>
nnoremap Q <nop>
