local map = vim.keymap.set

---- Setup
require("buffer_manager").setup({
	select_menu_item_commands = {
		v = {
			key = "<C-v>",
			command = "vsplit",
		},
		h = {
			key = "<C-h>",
			command = "split",
		},
	},
	focus_alternate_buffer = false,
	short_file_names = true,
	short_term_names = true,
	loop_nav = true,
	highlight = "Normal:BufferManagerBorder",
	order_buffers = "lastused",
	win_extra_options = {
		winhighlight = "Normal:BufferManagerNormal",
	},
	use_shortcuts = true,
})

---- Navigate buffers bypassing the menu
local bmui = require("buffer_manager.ui")
-- local keys = "12345"
-- for i = 1, #keys do
--   local key = keys:sub(i, i)
--   map("n", string.format("<leader>%s", key), function()
-- 	bmui.nav_file(i)
--   end, { noremap = true, desc = "Go to buffer " .. key })
-- end

---- Just the menu
map({ "t", "n" }, "<leader>h", bmui.toggle_quick_menu, { noremap = true, desc = "Toggle Buffer Menu" })

-- Setup styling
vim.api.nvim_set_hl(0, "BufferManagerModified", { bold = true })
vim.api.nvim_set_hl(0, "BufferManagerIndicator", { italic = true })
