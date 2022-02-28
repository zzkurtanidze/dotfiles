let mapleader = "\<Space>"

set rnu
set number
set encoding=UTF-8
set scl=yes
set cursorline
set scrolloff=10
" don't unload buffers when they're not being looked at.
set hidden
" Tab size
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
set inccommand=split
set splitbelow
set splitright
set rtp+=~/plugins/
set guicursor=n:Cursor/lCursor,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set nohlsearch 
set mouse+=a
set linespace=10

filetype indent on
set backspace=indent,eol,start

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme nord
noswapfile

" commands
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END

inoremap <C-d> <esc>
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
nnoremap Y yg$
nnoremap J mzJ`z

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
nnoremap <C-b> :Telescope buffers<CR>

nnoremap <leader>gr :Telescope lsp_references<CR>
nnoremap <leader>gd :Telescope lsp_definition<CR>
nnoremap <leader>gc :Telescope find_files cwd=~/.config/nvim/<CR>
nnoremap <leader>t :Telescope<CR>

noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

nmap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>a

nmap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeFindFile<CR>
nnoremap <C-c> :bd<CR>
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <leader>gi <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<cr>

" Remaps
noremap <silent> <A-h> :BufferPrevious<CR>
noremap <silent> <A-l> :BufferNext<CR> 
noremap <silent> <A-1> :BufferGoto 1<CR>
noremap <silent> <A-2> :BufferGoto 2<CR>
noremap <silent> <A-3> :BufferGoto 3<CR>
noremap <silent> <A-4> :BufferGoto 4<CR>
noremap <silent> <A-5> :BufferGoto 5<CR>
noremap <silent> <A-6> :BufferGoto 6<CR>
noremap <silent> <A-7> :BufferGoto 7<CR>
noremap <silent> <A-8> :BufferGoto 8<CR>
noremap <silent> <A-9> :BufferGoto 9<CR>
noremap <silent> <A-0> :BufferLast<CR>
noremap <silent> <leader>gr :LspUtilsRename<CR>
noremap <silent> gr :LspUtilsReference<CR>

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.tsx,*.vue,*.svelte,*.jsp'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx,*.vue,*.svelte,*.js'
let g:vim_matchtag_both = 0
