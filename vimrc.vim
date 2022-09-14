set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'phanviet/vim-monokai-pro'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdcommenter'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'ap/vim-css-color'
Plugin 'whatyouhide/vim-gotham'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
call vundle#end()

filetype plugin indent on
set shiftwidth=2

colorscheme gotham

syntax on
set termguicolors
set noswapfile
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set mouse=a		
set nu

function! GenerateHTMLStructure()
call append(0,'<!DOCTYPE html>')
call append(1,'<html lang="en">')
call append(2,'<head>')
call append(	3,'<meta charset="UTF-8">')
call append(    4,'<meta http-equiv="X-UA-Compatible" content="IE=edge">')
call append(    5,'<meta name="viewport" content="width=device-width, initial-scale=1.0">')
call append(    6,'<title>Document</title>')
call append(7,'</head>')
call append(8,'<body>')
call append(9,'')
call append(10,'</body>')
call append(11,'</html>')
endfunction

function! GenerateFunctionalComponent()
call append(0,'import React from "react"')
call append(1,'import "./File.css"')
call append(2,'')
call append(3,'function myComponent(){')
call append(4,'   return (<></>)')
call append(5,'}')
call append(6,'')
call append(7,'export default myComponent()')
endfunction
command GenerateFC call GenerateFunctionalComponent()
command GenerateHTML call GenerateHTMLStructure()

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
nnoremap <S-[> :update<cr>

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


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1 

filetype plugin on
let g:NERDSpaceDelims = 1 
let g:NERDDefaultAlign = 'left'

let g:ale_linters={'python':['flake8','pylint'],'javascript':['eslint']}
let g:ale_completion_enabled = 0

