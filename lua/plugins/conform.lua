local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		bash = { "shfmt", "beautysh" },
		sh = { "shfmt", "beautysh" },
		zsh = { "beautysh" },
		tex = { "latexindent" },
		latex = { "latexindent" },
		bib = { "bibtex-tidy" },
		julia = { "jupytext" },
		r = { "jupytext" },
		javascript = { "prettierd" },
		typescript = { "ts-standard", "rustywind", "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		json = { "prettierd" },
		markdown = { "prettierd" },
		html = { "rustywind", "prettierd" },
		["_"] = { "trim_whitespace" },
	},

	format_on_save = function(bufnr)
		-- Check if autoformatting is disabled globally or for this specific buffer
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = true }
	end,
})
