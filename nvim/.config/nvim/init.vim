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

autocmd BufEnter,FileType NvimTree call LuaTreeHideCursor()
autocmd BufLeave,BufWinLeave,WinClosed NvimTree call LuaTreeShowCursor()

function! LuaTreeShowCursor()
  highlight! Cursor blend=NONE
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
endfunction

function! LuaTreeHideCursor()
  highlight! Cursor blend=100
  set guicursor=n:Cursor/lCursor,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
endfunction
