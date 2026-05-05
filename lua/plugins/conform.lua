local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		-- Programming Languages
		lua = { "stylua" },
		python = { "isort", "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },

		-- Shell scripting
		bash = { "shfmt" },
		sh = { "shfmt" },
		zsh = { "beautysh" },

		-- LaTeX & Document formatting
		tex = { "latexindent" },
		latex = { "latexindent" },
		bib = { "bibtex-tidy" },

		-- Data Science / Jupyter
		julia = { "jupytext" },
		r = { "jupytext" },

		-- Web, Markup & Data
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },

		-- HTML includes rustywind
		html = { "rustywind", { "prettierd", "prettier" } },

		-- Fallback
		["_"] = { "trim_whitespace" },
	},

	format_on_save = function(bufnr)
		-- Check if autoformatting is disabled globally or for this specific buffer
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})
