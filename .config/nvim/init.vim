call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'SirVer/ultisnips' 
Plug 'mlaursen/vim-react-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'leafOfTree/vim-matchtag' " Use % to toggle between tags 
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'elzr/vim-json'
Plug 'rhysd/git-messenger.vim'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer', { 'do': 'make install' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ashisha/image.vim'

call plug#end()

let mapleader = "\<Space>" 

" Remappings
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
noremap <A-1> 1gt
noremap <A-2> 2gt noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
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
nmap <C-s> :w<CR>

nnoremap <silent> <leader>g :GitMessenger<CR>

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

set encoding=UTF-8
set scrolloff=20
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :GFiles<CR>
nnoremap <C-t> :tabnew<cr>

set rnu " Numbers on lines


let g:NERDTreeIgnore = ['^node_modules$']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Tab size
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 

" coc config
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
  \ ]


filetype plugin on
filetype indent on

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.tsx,*.vue,*.svelte,*.jsp'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx,*.vue,*.svelte,*.js'

" commands
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"
command! W execute "w"
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({
  \ "source": "rg --files --hidden --no-ignore-vcs --glob '!{node_modules/*,.git/*}'", 
  \ "down": "40%", "options": "--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse" 
  \ }))

set omnifunc=javascriptcomplete#CompleteJS

set backspace=indent,eol,start


set nocompatible
if (has("termguicolors"))
  set termguicolors
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax enable
colorscheme nord
let g:nord_cursor_line_number_background = 1
set background=dark
set t_Co=256
set cursorline
syntax enable

hi Search guibg=peru guifg=wheat

noswapfile

hi clear SpellBad
hi SpellBad cterm=underline

let g:vim_matchtag_both = 0

" reload this configuration file
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePre *.js Prettier autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []


function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

set nohlsearch

" Automatically import cost
augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END

" Airline config

let g:airline_powerline_fonts = 1
let g:airline_section_b = airline#section#create_left(['%t','%#__accent_bold#%#__restore__#%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}'])
let g:airline_section_c = ''
let g:airline_sextion_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create_right(['%l:%v% '])

set guifont=Hack\Nerd\Font\Mono\Normal
