vim.api.nvim_create_autocmd("FileType", {
	pattern = "lean",
	once = true,
	callback = function()
		require("lean").setup({ mappings = true })
	end,
})
