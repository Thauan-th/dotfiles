set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'ap/vim-css-color'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdcommenter'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
Plugin 'alvan/vim-closetag'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
call vundle#end()

filetype plugin indent on
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

colorscheme purify
set background=dark
syntax on
set term=xterm-256color
set termguicolors
set noswapfile
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set mouse=a		
set nu


if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"
autocmd vimenter * wincmd p
let NERDTreeQuitOnOpen = 1


"vim airline
let g:airline_theme='violet'
"let g:airline_theme='wombat'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
if !exists('g:airline_powerline_fonts')
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep          = '|'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '|'
let g:airline_right_alt_sep     = '«'
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
endif

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

nnoremap zz :w<cr>>

nnoremap <S-[> <ESC>
nnoremap <S-[> <ESC>

cnoreabbrev W w
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev q1 q!
cnoreabbrev Q1 q!
nnoremap ; :
vnoremap ; :

map cc <Plug>NERDCommenterInvert
map <C-a> ggVG
map <C-x> :wq<CR>
map <C-n> :NERDTreeToggle<CR>

inoremap jj <Esc>
vnoremap jj <Esc>


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1 

filetype plugin on
let g:NERDSpaceDelims = 1 
let g:NERDDefaultAlign = 'left'
let g:ale_linters={'python':['flake8','pylint'],'javascript':['eslint']}
let g:ale_completion_enabled = 0
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
