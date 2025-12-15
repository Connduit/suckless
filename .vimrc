syntax on
set cursorline
set nocompatible
set noerrorbells
set novisualbell
set tabstop=4
set shiftwidth=4
filetype plugin indent on


call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'bfrg/vim-c-cpp-modern'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

" Color Settings
let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"

if (has("termguicolors"))
    set termguicolors
endif

" colorscheme nord
" colorscheme iceberg
" colorscheme OceanicNext
colorscheme codedark " vscode colorscheme
" transparent 
" hi Normal guibg=NONE ctermbg=NONE

let g:airline_theme='base16_nord'


" Load custom Windows syntax for C++
" autocmd FileType c,cpp,h source ~/.vim/syntax/cpp_windows.vim

autocmd FileType c setlocal filetype=cpp
autocmd BufNewFile,BufRead *.h set filetype=cpp

" Enable semantic highlights for C files
autocmd FileType c,cpp let b:coc_semantic_highlight = 1



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

" open ctag in tabnew
nnoremap <C-]> :tab stj <C-R><C-W><CR>


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
			\ coc#pum#visible() ? coc#pum#confirm() :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <Leader>rn <Plug>(coc-rename)

" SortLines by Length Function
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" Transparent Toggle Function
let g:is_transparent=0
function! Toggle_transparent()
    if g:is_transparent==0
	hi Normal guibg=NONE ctermbg=NONE
	let g:is_transparent=1
    else
	set background=dark
	let g:is_transparent=0
    endif
endfunction
nnoremap <C-t> :call Toggle_transparent()<CR>

" nerdcommenter settings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


" Enable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Enable highlighting of type names in class, struct, union, enum, using, and
" concept declarations (affects both C and C++ files)
let g:cpp_type_name_highlight = 1

" Highlight operators (affects both C and C++ files)
let g:cpp_operator_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1"

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_posix_standard = 1

let g:coc_default_semantic_highlight_groups = 1
let g:coc_enable_locationlist = 0


" Put in your vimrc/init.vim
nmap <silent> gd <Plug>(coc-definition)

" coc.nvim semantic types (Vim-compatible)
hi! link CocSemanticType Type
hi CocSemanticType ctermfg=Blue guifg=#61afef

