call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips' 
Plug 'mlaursen/vim-react-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox' 
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'leafOfTree/vim-matchtag' " Use % to toggle between tags 
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-surround'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'elzr/vim-json'
Plug 'rhysd/git-messenger.vim'

call plug#end()

let mapleader = " "

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-b> :GitMessenger<CR>

set encoding=UTF-8

nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
set scrolloff=20

set nu " Numbers on lines

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Tab size
set tabstop=2 softtabstop=2 shiftwidth=2 smartindent expandtab 

" coc config
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
  \ ]

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Map CTRL+S to Save
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

let g:UltiSnipsExpandTrigger="<C-l>"

runtime macros/matchit.vim

filetype plugin on
filetype indent on

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.tsx,*.vue,*.svelte,*.jsp'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx,*.vue,*.svelte,*.js'

command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"
command! W execute "w"

set omnifunc=javascriptcomplete#CompleteJS

set nocompatible
set backspace=indent,eol,start

set bg=dark

colorscheme nord

hi Search guibg=peru guifg=wheat

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

noswapfile

hi clear SpellBad
hi SpellBad cterm=underline

let g:vim_matchtag_both = 0

map <leader>r :NERDTreeFind<cr>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" reload this configuration file
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePre *.js Prettier
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :GFiles<CR>

set nohlsearch
