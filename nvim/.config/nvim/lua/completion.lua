local lspkind = require "lspkind"
lspkind.init()

local cmp = require "cmp"

vim.o.completeopt = "menuone,noselect"

require("luasnip").filetype_extend("javascript", { "react" })
require("luasnip/loaders/from_vscode").load()

cmp.setup {
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    }
  },

		['<Tab>'] = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(t('<C-n>'), 'n')
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
			elseif check_back_space() then
				vim.fn.feedkeys(t('<Tab>'), 'n')
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(t('<C-p>'), 'n')
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
			elseif check_back_space() then
				vim.fn.feedkeys(t('<C-h>'), 'n')
			else
				fallback()
			end
		end, { 'i', 's' }),

  snippet = {
    expand = function(args)
      require"luasnip".lsp_expand(args.body)
    end
  },

  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },


  experimental = {
    native_menu = true,
    ghost_text = true,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "﬘ [BUF]",
        nvim_lsp = "ﲳ [LSP]",
        path = "ﱮ [PATH]",
        luasnip = " [SNIP]",
      },
    },
  },

}

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

