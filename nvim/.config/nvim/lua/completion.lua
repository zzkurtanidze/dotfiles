local lspkind = require("lspkind")
local luasnip = require("luasnip")
lspkind.init()

local cmp = require("cmp")

vim.o.completeopt = "menuone,noselect"

cmp.setup({
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(t("<C-p>"), "n")
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<ESC>"] = cmp.mapping(function(fallback)
			print("testing")
			if luasnip.expand_or_jumpable() then
				luasnip.unlink_current()
				fallback()
			else
				fallback()
			end
		end, { "i" }),
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer" },
	},

	view = {
		entries = "native",
	},

	experimental = {
		ghost_text = true,
	},

	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "﬘ [BUF]",
				nvim_lsp = "ﲳ [LSP]",
				path = "ﱮ [PATH]",
				luasnip = " [SNIP]",
			},
		}),
	},
})

cmp.setup.cmdline("/", {
	completion = {
		-- Might allow this later, but I don't like it right now really.
		-- Although, perhaps if it just triggers w/ @ then we could.
		--
		-- I will have to come back to this.
		autocomplete = false,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		-- { name = "buffer", keyword_length = 5 },
	}),
})

cmp.setup.cmdline(":", {
	completion = {
		autocomplete = false,
	},

	sources = cmp.config.sources({
		{
			name = "path",
		},
	}, {
		{
			name = "cmdline",
			max_item_count = 20,
			keyword_length = 4,
		},
	}),
})
