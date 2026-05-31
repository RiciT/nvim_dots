local lint = require("lint")

lint.linters.luacheck.args = {
	"--globals",
	"vim",
	"--formatter",
	"plain",
	"--codes",
	"--ranges",
	"-",
}

lint.linters_by_ft = {
	c = { "cpplint" },
	cpp = { "cpplint" },
	lua = { "luacheck" },
	sh = { "shellcheck" },
	javascript = { "ts-standard" },
	typescript = { "ts-standard" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("Linting", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
