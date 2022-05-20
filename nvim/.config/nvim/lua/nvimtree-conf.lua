require("nvim-tree").setup({
	update_cwd = true,
	disable_netrw = false,
	hijack_netrw = false,
	ignore_ft_on_setup = {},
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 35,
		side = "right",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
	},
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", ":BufferMovePrevious<CR>", opts)
map("n", "<A-.>", ":BufferMoveNext<CR>", opts)
-- Goto buffer in position...
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
