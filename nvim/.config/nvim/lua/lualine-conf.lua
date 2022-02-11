
require('staline').setup {
	defaults = {
		left_separator  = "",
		right_separator = "",
		cool_symbol     = " ",       -- Change this to override defult OS icon.
		full_path       = false,
		mod_symbol      = "  ",
		lsp_client_symbol = " ",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
		fg              = "#2E3440",  -- Foreground text color.
		bg              = "none",     -- Default background is transparent.
		inactive_color  = "#303030",
		inactive_bgcolor = "none",
		true_colors     = true,       -- true lsp colors.
		font_active     = "none",     -- "bold", "italic", "bold,italic", etc
		branch_symbol   = " ",
	},
	mode_colors = {
		n = "#88C0D0",
		i = "#88C0D0",
		c = "#88C0D0",
		v = "#88C0D0",   -- etc..
	},
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	sections = {
		left = { '- ', '-mode', 'left_sep_double', ' ', 'branch', 'lsp' },
		mid  = { 'file_name' },
    right = { 
      'cool_symbol',
      'right_sep_double',
      '-line_column' 
    },
	},
	lsp_symbols = {
		Error=" ",
		Info=" ",
		Warn=" ",
		Hint=" ",
	}
}

-- Lua

-- Customized config
