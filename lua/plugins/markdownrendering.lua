require("render-markdown").setup({
	file_types = { "markdown", "lua", "python", "c", "cpp", "zig", "nim", "tex" },
	completions = { lsp = { enabled = true } },
	heading = { enabled = true },
	sign = { enabled = true },
})

require("render-markdown").enable()
