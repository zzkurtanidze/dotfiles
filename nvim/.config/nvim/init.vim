source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/starter.vim
source ~/.config/nvim/config/rotateline.vim
source ~/.config/nvim/config/highlights.vim
source ~/.config/nvim/config/functions.vim

lua require("completion")
lua require("lsp-config")
lua require("lualine-conf")
lua require("telescope-conf")
lua require("nvimtree-conf")
lua require("autopairs")
lua require("gitsigns-conf")
lua require("barbar-conf")
lua require("indent-blankline-conf")
lua require("comment-nvim-conf")
lua require("snippets")
