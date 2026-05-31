require("render-markdown").setup({
	file_types = { "markdown" },
	completions = { lsp = { enabled = true } },
	heading = { enabled = true },
	sign = { enabled = true },
})

require("render-markdown").enable()
