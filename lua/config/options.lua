-- GLOBAL OPTIONS
vim.g["loaded_python3_provider"] = nil

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- OPTIONS
vim.o.number = true
vim.o.relativenumber = true
vim.opt.hlsearch = true

-- at UIEnter so it doesnt slow startup
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.o.clipboard = "unnamedplus"
	end,
})

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.list = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.confirm = true
vim.g.have_nerd_font = true

vim.opt.termguicolors = true

-- enable concealing for markdown rendering
vim.o.conceallevel = 2

--vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
--vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.o.undofile = true
vim.o.breakindent = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.scrolloff = 12

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})

vim.opt.listchars:append({
	tab = "│ ",
	leadmultispace = "│   ",
})
