syntax on
set cursorline
set nocompatible
set noerrorbells
set novisualbell
set shiftwidth=4
filetype plugin indent on

imap jj <ESC>

let mapleader = ' '

set number
set encoding=utf-8

" Copy and Paste
vmap <silent><Leader>xyy :!xclip -f -sel clip<CR>
map <Leader>xpp mz:-1r !xclip -o -sel clip<CR>`z

" map <Leader>g :Goyo<CR>

" Unhighlights Search Results
nnoremap <silent> <CR> :noh<CR><CR><Backspace>

" Alpha Sort
vnoremap <Leader>s :sort<CR>
" Line Length Sort
vnoremap <Leader>S :call SortLines()<CR>

" case insensitive searching
set hlsearch
set smartcase
set ignorecase

" indent selected code in visual mode
vnoremap < <gv
vnoremap > >gv

" cycle through tabs
nnoremap H gT
nnoremap L gt

map <Leader>n :NERDTreeToggle<CR>

" coc.nvim settings
set hidden
set cmdheight=2
set shortmess+=c
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

nmap <Leader>rn <Plug>(coc-rename)

" SortLines by Length Function
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" Transparent Toggle Function
let t:is_transparent=0
function! Toggle_transparent()
    if t:is_transparent==0
	hi Normal guibg=NONE ctermbg=NONE
	let t:is_transparent=1
    else
	set background=dark
	let t:is_transparent=0
    endif
endfunction
nnoremap <C-t> :call Toggle_transparent()<CR>

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
" Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Color Settings
let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"

if (has("termguicolors"))
    set termguicolors
endif

colorscheme nord
" transparent 
" hi Normal guibg=NONE ctermbg=NONE

let g:airline_theme='base16_nord'


