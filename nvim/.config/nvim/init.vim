function! s:local_plug(plug_name)
  if isdirectory(expand("~/plugins/".a:plug_name))
    execute "Plug '~/plugins/".a:plug_name."'"
  else
    echoerr "Plugin does not exists."
  endif
endfun

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'SirVer/ultisnips' 
Plug 'mlaursen/vim-react-snippets'
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'leafOfTree/vim-matchtag' " Use % to toggle between tags 
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'arcticicestudio/nord-vim', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'elzr/vim-json' 
Plug 'rhysd/git-messenger.vim'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer', { 'do': 'make install' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'itsvinayak/image.vim'
Plug 'numirias/semshi'
Plug 'majutsushi/tagbar'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mbbill/undotree'
Plug 'ferrine/md-img-paste.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'maaslalani/slides'
Plug 'windwp/nvim-autopairs'
Plug 'karb94/neoscroll.nvim'
Plug 'mhinz/vim-startify'

" LSP

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

"	call s:local_plug("img-paste.vim")
set rnu

call plug#end()

"LSP


"let g:coq_settings = { 'auto_start': 'shut-up', 'keymap': { 'jump_to_mark': '<c-c>' } }
lua require("completion")
lua require("lsp-config")
lua require("lualine-conf")
lua require("telescope-conf")
lua require("autopairs")

set rtp+=~/plugins/

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
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Map CTRL+S to Save
nmap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i

nnoremap <silent> <leader>g :GitMessenger<CR>

nmap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<CR>
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

set encoding=UTF-8

set scrolloff=20
" !if
" nnoremap n nzzzv
" nnoremap N Nzzzv

" don't unload buffers when they're not being looked at.
set hidden
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :GFiles<CR>

let g:NERDTreeIgnore = ['^node_modules$']

" Tab size
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 

nnoremap <leader>a :PlugUpdate
" " coc config
" let g:coc_global_extensions = [
" 	\ 'coc-snippets',
" 	\ 'coc-pairs',
" 	\ 'coc-tsserver',
" 	\ 'coc-eslint',
" 	\ 'coc-prettier',
" 	\ 'coc-json',
"   \ 'coc-python',
"   \ ]


filetype plugin on
filetype indent on

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.tsx,*.vue,*.svelte,*.jsp'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx,*.vue,*.svelte,*.js'

" commands
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"
command! W execute "w"
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"command! -bang -nargs=*  All
"  \ call fzf#run(fzf#wrap({
"  "source": "rg --files --hidden --no-ignore-vcs --glob '!{node_modules/*,.git/*}'", 
"  "down": "40%", "options": "--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse" 
"  \ }))

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
noswapfile
syntax enable

hi Search guibg=#5E81AC guifg=#E5E9F0
hi DashboardHeader guifg=#81A1C1
hi DashboardCenter guifg=#8FBCBB
hi CmpItemMenu guifg=#D08770
hi CmpItemAbbrMatch guifg=#191

set hlsearch
set hid

hi SpellBad guibg=#BF616A guifg=#E5E9F0 cterm=underline


let g:vim_matchtag_both = 0

if has ('autocmd') 
  augroup vimrc     " Source vim configuration upon save
    autocmd!
    " autocmd BufWritePost $MYVIMRC AirlineRefresh
  augroup END
endif " has autocmd

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction


" Automatically import cost
augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END

" Airline config
let g:airline_disable_statusline = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let airline#extensions#coc#error_symbol = '✗ '
let airline#extensions#coc#warning_symbol = '⚠️ '
let g:airline_stl_path_style = 'long'

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
set inccommand=split
set splitbelow

set nohlsearch 

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
" nnoremap <C-b> :Telescope buffers<CR>

nnoremap <leader>gr :Telescope lsp_references<CR>
nnoremap <leader>gd :Telescope lsp_definition<CR>
nnoremap <leader>gc :Telescope find_files cwd=~/.config/nvim/<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Press \r to start rotating lines and <C-c> (Control+c) to stop.

function! s:RotateString(string)
    let split_string = split(a:string, '\zs')
    return join(split_string[-1:] + split_string[:-2], '')
endfunction

function! s:RotateLine(line, leading_whitespace, trailing_whitespace)
    return substitute(
        \ a:line,
        \ '^\(' . a:leading_whitespace . '\)\(.\{-}\)\(' . a:trailing_whitespace . '\)$',
        \ '\=submatch(1) . <SID>RotateString(submatch(2)) . submatch(3)',
        \ ''
    \ )
endfunction

function! s:RotateLines()
    let saved_view = winsaveview()
    let first_visible_line = line('w0')
    let last_visible_line = line('w$')
    let lines = getline(first_visible_line, last_visible_line)
    let leading_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''^\s*'')'
    \ )
    let trailing_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''\s*$'')'
    \ )
    try
        while 1 " <C-c> to exit
            let lines = map(
                \ range(len(lines)),
                \ '<SID>RotateLine(lines[v:val], leading_whitespace[v:val], trailing_whitespace[v:val])'
            \ )
            call setline(first_visible_line, lines)
            redraw
            sleep 50m
        endwhile
    finally
        if &modified
            silent undo
        endif
        call winrestview(saved_view)
    endtry
endfunction

nnoremap <silent> <Plug>(RotateLines) :<C-u>call <SID>RotateLines()<CR>

nmap \r <Plug>(RotateLines)

set guicursor=i:ver25-iCursor
