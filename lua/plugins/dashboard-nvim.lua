local function get_loaded_plugins_count()
	local loaded = {}
	local pack_dir = vim.fn.stdpath("data") .. "/site/pack"
	for _, path in ipairs(vim.opt.runtimepath:get()) do
		if path:find(pack_dir, 1, true) then
			local base_path = path:gsub("/after$", "")
			loaded[base_path] = true
		end
	end
	local count = 0
	for _ in pairs(loaded) do
		count = count + 1
	end
	return count
end

require("dashboard").setup({
	theme = "doom",
	shortcut_type = "letter",
	shuffle_letter = false,
	config = {
		week_header = { enable = true },
		center = {
			{
				icon = " ",
				desc = "Find File",
				key = "f",
				key_format = " %s",
				action = "Telescope find_files",
			},
			{
				icon = " ",
				desc = "Recent files",
				key = "r",
				key_format = " %s",
				action = "Telescope oldfiles",
			},
			{
				icon = " ",
				desc = "Config",
				key = "c",
				key_format = " %s",
				action = ":Telescope find_files cwd=/home/br4mos/.config/nvim/",
			},
			{
				icon = "󰰏 ",
				desc = "Mason",
				key = "m",
				key_format = " %s",
				action = "Mason",
			},
			{
				icon = "󰩈 ",
				desc = "Quit",
				key = "q",
				key_format = " %s",
				action = "q",
			},
		},
		footer = {
			"",
			"⚡ Neovim loaded "
				.. tostring(get_loaded_plugins_count())
				.. "/"
				.. tostring(_G.TotalPluginCount or 0)
				.. " plugins",
		},
		vertical_center = true,
	},
})
