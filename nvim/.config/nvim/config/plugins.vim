function! s:local_plug(plug_name)
  if isdirectory(expand("~/plugins/".a:plug_name))
    execute "Plug '~/plugins/".a:plug_name."'"
  else
    echoerr "Plugin does not exists."
  endif
endfun

call plug#begin("~/.config/nvim/plugged/")

call s:local_plug("lsp-utils.nvim")
Plug 'L3MON4D3/LuaSnip' 
Plug 'neoclide/vim-jsx-improve'
Plug 'mxw/vim-jsx'
Plug 'leafOfTree/vim-matchtag' " Use % to toggle between tags 
Plug 'windwp/nvim-ts-autotag' 
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer', { 'do': 'make install' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'mhinz/vim-startify'
Plug 'romgrk/barbar.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'yamatsum/nvim-nonicons'
Plug 'billyvg/tigris.nvim'
Plug 'nelsyeung/twig.vim'
Plug 'axieax/urlview.nvim'
Plug 'pedro757/emmet'

" ------ LSP ------

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'weilbith/nvim-code-action-menu'
Plug 'wiliamks/nice-reference.nvim'

call plug#end()
