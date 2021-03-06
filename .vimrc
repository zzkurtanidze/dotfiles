" Load packages
call plug#begin('~/.vim/autoload')

Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'

call plug#end()

" Numbers on lines
set number

" Enable syntax highlighting
syntax on

" Enable rainbow brackets
let g:rainbow_active = 1

" Change gruvbox theme contrast
let g:gruvbox_contrast_dark = 'soft'

" Change tabcolor
set laststatus=2
if !has('gui_running')
	  set t_Co=256
  endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

