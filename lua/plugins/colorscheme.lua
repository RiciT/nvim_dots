require("pywal").setup()
vim.g.colors_name = "pywal"
vim.cmd("colorscheme pywal")

local function apply_custom_highlights()
	vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Statement" })
	vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Comment" })
	vim.api.nvim_set_hl(0, "DashboardDesc", { link = "String" })
	vim.api.nvim_set_hl(0, "DashboardKey", { link = "Number" })
	vim.api.nvim_set_hl(0, "DashboardIcon", { link = "Function" })
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = apply_custom_highlights,
})
