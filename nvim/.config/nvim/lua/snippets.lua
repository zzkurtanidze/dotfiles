local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

ls.snippets = {
	all = {
		ls.parser.parse_snippet("cl", "console.log($1)"),
	},
	typescriptreact = {
		ls.parser.parse_snippet("cl", "console.log($1)"),
	},
	typescript = {
		ls.parser.parse_snippet("cl", "console.log($1)"),
	},
}

ls.filetype_extend("javascript", { "react", "react-ts", "twig" }, "html")
require("luasnip/loaders/from_vscode").load()

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>")
