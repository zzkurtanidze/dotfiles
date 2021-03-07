" Load packages
call plug#begin('~/.vim/autoload')

Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'

call plug#end()

set number " Numbers on lines
syntax on " Enable syntax highlighting
let g:rainbow_active = 1 " Enable rainbow brackets
let g:gruvbox_contrast_dark = 'soft' " Change gruvbox theme contrast

" Change tabcolor
set laststatus=2
if !has('gui_running')
	  set t_Co=256
  endif
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" Set color scheme to gruvbox
let g:gruvbox_termcolors = 16 " Enable dark mode
colorscheme gruvbox
