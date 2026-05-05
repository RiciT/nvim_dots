-- AUTOCOMMANDS

-- automatically disable search highlighting when going into insert mode of after 'updatetime'
vim.cmd("packadd! nohlsearch")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Set up the listener for the bash script signal
vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = function()
		-- Clear the cache and reload
		package.loaded["pywal.core"] = nil
		package.loaded["pywal.colors"] = nil
		package.loaded["pywal.theme"] = nil

		require("pywal").setup()
		vim.cmd("colorscheme pywal")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"regex",
		"markdown",
		"markdown-inline",
		"html",
		"latex",
		"rust",
		"zig",
		"nim",
		"c",
		"cpp",
		"asm",
		"awk",
		"bibtex",
		"cmake",
		"dart",
		"glsl",
		"ini",
		"julia",
		"lua",
		"make",
		"matlab",
		"nasm",
		"python",
		"r",
		"json",
		"toml",
		"vim",
		"yaml",
		"zsh",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

-- autowrap in tex files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})

-- autowrap in bib files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "bib",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})

-- create an isolated group so this cannot be overwritten by other autocommands
local template_group = vim.api.nvim_create_augroup("TexTemplateDiag", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = template_group,
	pattern = "tex",
	callback = function()
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		if #lines == 1 then
			local template_path = vim.fn.expand("~/.config/nvim/templates/skeleton.tex")

			if vim.fn.filereadable(template_path) == 1 then
				local template_lines = vim.fn.readfile(template_path)
				vim.api.nvim_buf_set_lines(0, 0, -1, false, template_lines)
			else
				vim.notify("ERROR: Template missing at " .. template_path, vim.log.levels.ERROR)
			end
		else
			vim.notify("(Aborted): Buffer is not empty, skipping template.", vim.log.levels.WARN)
		end
	end,
})
