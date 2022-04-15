local vim = vim

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { {
			"mode",
			fmt = function()
				return " "
			end,
		} },
		lualine_b = { { "branch", icon = "" } },
		lualine_c = {
			{ "filetype", colored = true, icon_only = true, padding = { left = 1, right = 0 } },
			{ "filename", symbols = { modified = " ", readonly = " ", padding = 0 } },
			"diagnostics",
		},
		lualine_x = {
			{
				function()
					local msg = ""
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						msg = "No Active Lsp"
					end
					local lengthNum = 0
					for _ in ipairs(clients) do
						lengthNum = lengthNum + 1
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							if lengthNum == _ then
								msg = msg .. client.name .. " "
							elseif _ == 4 then
								msg = ""
							else
								msg = msg .. client.name .. ", "
							end
						end
					end
					return " " .. msg
				end,
				color = { fg = "#88C0D0", gui = "bold,italic" },
			},
		},
		lualine_y = { { "diff", symbols = { added = " ", modified = " ", removed = " " } } },
		lualine_z = {
			"progress",
		},
	},
	inactive_sections = {
		lualine_a = { {
			"mode",
			fmt = function()
				return " "
			end,
		} },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = { "progress" },
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
