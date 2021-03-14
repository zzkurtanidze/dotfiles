" Load packages
call plug#begin('~/.vim/autoload')

Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/AutoComplPop'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'pangloss/vim-javascript'

" React snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'



Plug 'arcticicestudio/nord-vim'

call plug#end()

set number " Numbers on lines
let g:rainbow_active = 1 " Enable rainbow brackets

" Change tabcolor
set laststatus=2
if !has('gui_running')
	  set t_Co=256
  endif


" vim autocomplete
set complete+=kspell
set completeopt=menuone,longest

" reload this configuration file
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" Toggle NERDTree on Ctrl + n
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$, ^vendor$']

" Change colorscheme
colorscheme nord

" Vim prettier configurationPlug 
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Tab size
set tabstop=2	

" Javascript autocomplete configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


