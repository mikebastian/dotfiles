set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

syntax on
set number
set mouse=a
set mousehide

autocmd BufNewFile,BufRead *.tex set spell
set hlsearch
set showmatch
set incsearch
set ignorecase
set autoindent
set history=1000
set cursorline
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set textwidth=79

let g:colorizer_fgcontrast=1

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

set laststatus=2
let g:airline_theme='dark'

colorscheme devbox-dark-256

"==== Show 80st column ====

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

"==== Highlight matches when jumping to next ====

nnoremap <silent> n     n:call HLNext(0.4)<cr>
nnoremap <silent> N     N:call HLNext(0.4)<cr>

" EITHER blink the line containing the match...
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

"==== Make tabs, trailing whitespace, and non-breaking spaces visible ====

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"==== Swap : and ; ====

nnoremap  ;  :
nnoremap  :  ;

"==== Swap v and CTRL-V ====

nnoremap    v    <C-V>
nnoremap <C-V>      v

vnoremap    v    <C-V>
vnoremap <C-V>      v
