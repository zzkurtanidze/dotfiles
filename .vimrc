call plug#begin("~/.vim/autoload:")

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'

Plug 'HerringtonDarkholme/yats.vim' "TS Syntax

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'alvan/vim-closetag'

call plug#end()

set encoding=UTF-8

nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

set number " Numbers on lines

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" reload this configuration file
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" Tab size
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab


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


command! -nargs=0 Prettier :CocCommand prettier.formatFile


set bg=dark
colorscheme gruvbox

" Map CTRL+S to Save
nnoremap <c-s> :w<CR> 
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>

let g:UltiSnipsExpandTrigger="<C-l>"


runtime macros/matchit.vim

filetype plugin on
