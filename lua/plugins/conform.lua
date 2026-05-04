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

-- Manual formatting keymap (always works, even if autoformat is toggled off)
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	conform.format({
		lsp_format = "fallback",
		timeout_ms = 500,
	})
end, { desc = "Format file or range" })

-- TOGGLE KEYMAPS
-- Toggle formatting for the current buffer only
vim.keymap.set("n", "<leader>cb", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	if vim.b.disable_autoformat then
		vim.notify("Autoformat disabled for this buffer", vim.log.levels.WARN, { title = "Conform" })
	else
		vim.notify("Autoformat enabled for this buffer", vim.log.levels.INFO, { title = "Conform" })
	end
end, { desc = "Toggle autoformat (Buffer)" })

-- Toggle formatting globally
vim.keymap.set("n", "<leader>cg", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	if vim.g.disable_autoformat then
		vim.notify("Autoformat disabled globally", vim.log.levels.WARN, { title = "Conform" })
	else
		vim.notify("Autoformat enabled globally", vim.log.levels.INFO, { title = "Conform" })
	end
end, { desc = "Toggle autoformat (Global)" })
