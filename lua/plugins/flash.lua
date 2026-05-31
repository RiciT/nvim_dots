require("flash").setup({
	modes = { search = { enabled = true } },
})

local map = vim.keymap.set

map({ "n", "x", "o" }, "gs", function()
	require("flash").jump()
end, { desc = "Flash Jump" })
map({ "n", "x", "o" }, "gS", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
