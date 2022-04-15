require("telescope").setup({
	defaults = {
		layout_config = {
			vertical = { width = 0.5 },
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		prompt_prefix = "   ",
		path_display = { "smart" },
		dynamic_preview_title = true,
		history = {
			mappings = {
				i = {
					["<C-Down>"] = require("telescope.actions").cycle_history_next,
					["<C-Up>"] = require("telescope.actions").cycle_history_prev,
				},
			},
		},
	},
	grep_string = {
		use_regex = true,
	},
	live_grep = {
		use_regex = true,
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		oldfiles = {
			theme = "dropdown",
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
})

require("telescope").load_extension("media_files")
