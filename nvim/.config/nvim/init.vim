function! s:local_plug(plug_name)
  if isdirectory(expand("~/plugins/".a:plug_name))
    execute "Plug '~/plugins/".a:plug_name."'"
  else
    echoerr "Plugin does not exists."
  endif
endfun

call plug#begin("~/.config/nvim/plugged/")

Plug 'L3MON4D3/LuaSnip' 
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/vim-jsx-improve'
Plug 'mxw/vim-jsx'
Plug 'leafOfTree/vim-matchtag' " Use % to toggle between tags 
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer', { 'do': 'make install' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'mhinz/vim-startify'
Plug 'romgrk/barbar.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tamton-aquib/staline.nvim'
Plug 'APZelos/blamer.nvim'

" LSP

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

set rnu
set number

"LSP

lua require("completion")
lua require("lsp-config")
lua require("lualine-conf")
lua require("telescope-conf")
lua require("nvimtree-conf")
lua require("autopairs")
lua require("gitsigns-conf")
lua require("barbar-conf")

set rtp+=~/plugins/

let mapleader = "\<Space>"
" Remappings
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

set encoding=UTF-8
set scl=yes
set cursorline
set scrolloff=10

" don't unload buffers when they're not being looked at.
set hidden

" Tab size
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
filetype indent on

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.tsx,*.vue,*.svelte,*.jsp'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx,*.vue,*.svelte,*.js'

" commands
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"

set backspace=indent,eol,start

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme nord
noswapfile
syntax enable

hi Search guibg=#5E81AC guifg=#E5E9F0 
hi Normal guibg=none guifg=none
hi DashboardHeader guifg=#81A1C1
hi DashboardCenter guifg=#8FBCBB
hi BufferCurrentMod guifg=#8FBCBB
hi BufferVisibleMod guifg=#8FBCBB
hi NvimTreeNormal guibg=#292f3a
hi link LspDiagnosticsDefaultError ErrorMsg
hi link LspDiagnosticsDefaultWarning WarningMsg
hi link LspDiagnosticsDefaultInformation InfoMsg
hi link LspDiagnosticsDefaultHint InfoMsg
hi link LspDiagnosticsVirtualTextError ErrorMsg
hi link LspDiagnosticsVirtualTextWarning WarningMsg
hi link LspDiagnosticsVirtualTextInformation InfoMsg
hi link LspDiagnosticsVirtualTextHint InfoMsg
hi TSOperator guibg=NONE
hi typescriptBlock guibg=NONE
hi TargetWord guibg=NONE guifg=#8FBCBB gui=bold cterm=bold
hi NormalFloat guibg=none
hi VertSplit guifg=#5E81AC

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
nnoremap <C-b> :Telescope buffers<CR>

nnoremap <leader>gr :Telescope lsp_references<CR>
nnoremap <leader>gd :Telescope lsp_definition<CR>
nnoremap <leader>gc :Telescope find_files cwd=~/.config/nvim/<CR>



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

autocmd BufEnter,FileType NvimTree call LuaTreeHideCursor()
autocmd BufLeave,BufWinLeave,WinClosed NvimTree call LuaTreeShowCursor()


function! LuaTreeHideCursor()
  highlight! Cursor blend=100
  set guicursor=n:Cursor/lCursor,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
endfunction

function! LuaTreeShowCursor()
  highlight! Cursor blend=NONE
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
endfunction

let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
