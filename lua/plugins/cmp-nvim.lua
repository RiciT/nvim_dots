local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
-- Inherited snippets
luasnip.filetype_extend("cpp", { "c" })
luasnip.filetype_extend("markdown", { "html" })
luasnip.filetype_extend("zsh", { "bash", "sh" })
luasnip.filetype_extend("bash", { "sh" })
luasnip.filetype_extend("latex", { "tex" })

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Use <C-Space> to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
		-- Confirm selection with Enter
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Standard Tab / Shift-Tab to navigate the completion menu
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
