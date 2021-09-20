vim.cmd('packadd packer.nvim')

return require('packer').startup(
    function()
      use 'neoclide/coc.nvim'
      use 'scrooloose/nerdtree'
    end
)
