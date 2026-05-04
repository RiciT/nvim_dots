-- GLOBAL OPTIONS
vim.g["loaded_python3_provider"] = nil

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- OPTIONS
vim.o.number = true
vim.o.relativenumber = true

-- at UIEnter so it doesnt slow startup
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.o.clipboard = "unnamedplus"
	end,
})

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.confirm = true
vim.g.have_nerd_font = true

vim.opt.termguicolors = true
