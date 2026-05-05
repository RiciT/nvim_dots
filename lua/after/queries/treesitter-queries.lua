vim.treesitter.query.set(
	"lua",
	"injections",
	'((comment) @injection.content (#set! injection.language "markdown_inline"))'
)
