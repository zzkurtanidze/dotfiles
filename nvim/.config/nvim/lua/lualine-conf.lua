local vim = vim

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { '' },
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {{ 'mode', fmt = function() return ' ' end }},
    lualine_b = {{'branch', icon = ""}},
    lualine_c = {'buffers', 'diagnostics'},
    lualine_x = {{
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return " " .. client.name
          end
        end
        return msg
      end,
      color = { fg = "#88C0D0", gui = "bold,italic" }
    }},
    lualine_y = {{'diff', symbols = { added = " ", modified = " ", removed = " " }}},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree'}
}
-- Lua

-- Customized config
