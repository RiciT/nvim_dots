require("toggleterm").setup({
	size = 20,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	direction = "vertical",
	float_opts = {
		border = "curved",
		winblend = 0,
	},
})
