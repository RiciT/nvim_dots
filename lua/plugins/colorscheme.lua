require("pywal").setup()
vim.g.colors_name = "pywal"
vim.cmd("colorscheme pywal")

local function apply_custom_highlights()
	vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Statement" })
	vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Comment" })
	vim.api.nvim_set_hl(0, "DashboardDesc", { link = "String" })
	vim.api.nvim_set_hl(0, "DashboardKey", { link = "Number" })
	vim.api.nvim_set_hl(0, "DashboardIcon", { link = "Function" })

	local colors = require("pywal.core").get_colors()
	vim.api.nvim_set_hl(0, "WhichKey", { fg = colors.color4 })
	vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = colors.foreground })
	vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = colors.color2 })
	vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = colors.color8 })
	vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = colors.color8 })
	vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = colors.background })
	vim.api.nvim_set_hl(0, "WhichKeyTitle", { fg = colors.color5, bold = true })
	vim.api.nvim_set_hl(0, "WhichKeyIcon", { fg = colors.color6 })
	vim.api.nvim_set_hl(0, "WhichKeyIconAzure", { fg = colors.color4 })
	vim.api.nvim_set_hl(0, "WhichKeyIconBlue", { fg = colors.color4 })
	vim.api.nvim_set_hl(0, "WhichKeyIconGreen", { fg = colors.color2 })
	vim.api.nvim_set_hl(0, "WhichKeyIconRed", { fg = colors.color1 })
	vim.api.nvim_set_hl(0, "WhichKeyIconYellow", { fg = colors.color3 })
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = apply_custom_highlights,
})
