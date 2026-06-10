local autopairs = require("nvim-autopairs")

-- Basic setup
autopairs.setup({
	check_ts = true, -- Enable treesitter integration
})

-- Integrate with nvim-cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

-- This tells cmp to trigger autopairs when a completion is confirmed
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true,
	},
})
