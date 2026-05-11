-- unlink tab when in insert mode so tab works normally
require("luasnip").config.setup({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})
