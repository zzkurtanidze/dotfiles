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
Plug 'leafOfTree/vim-matchtag' " Use % to toggle between tags Plug 'alvan/vim-closetag' 
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
Plug 'itsvinayak/image.vim'
Plug 'numirias/semshi'
Plug 'majutsushi/tagbar'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mbbill/undotree'

call plug#end()

let mapleader = "\<Space>" 

" Remappings
noremap <A-h> :tabprevious<CR>
noremap <A-l> :tabnext<CR>
noremap <A-1> 1gt
noremap <A-2> 2gt 
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
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

nmap <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

set encoding=UTF-8

set scrolloff=20
" !if
" nnoremap n nzzzv
" nnoremap N Nzzzv

" don't unload buffers when they're not being looked at.
set hidden
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :GFiles<CR>
nnoremap <C-t> :tabnew<cr>


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
  \ 'coc-python',
  \ ]


filetype plugin on
filetype indent on

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.tsx,*.vue,*.svelte,*.jsp'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx,*.vue,*.svelte,*.js'

" commands
command! Config execute ":tabnew $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"
command! W execute "w"
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({
  "source": "rg --files --hidden --no-ignore-vcs --glob '!{node_modules/*,.git/*}'", 
  "down": "40%", "options": "--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse" 
  \ }))

set omnifunc=javascriptcomplete#CompleteJS

set backspace=indent,eol,start

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

if has ('autocmd') 
  augroup numbers
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber 
  augroup END
  autocmd! BufWritePre *.js Prettier 
  augroup vimrc     " Source vim configuration upon save
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    autocmd BufWritePost $MYVIMRC AirlineRefresh
  augroup END
endif " has autocmd

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

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
let g:airline_section_z = airline#section#create_right(['%l:%v% '])
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let airline#extensions#coc#error_symbol = '✗ '
let airline#extensions#coc#warning_symbol = '⚠️ '
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 45,
      \ 'error': 45,
      \ }


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 50})
augroup END

inoremap <C-d> <esc>
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" Greatest remaps
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
noremap <leader>u :UndotreeToggle<CR>

nnoremap Y yg$
nnoremap J mzJ`z

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

set colorcolumn=120

