require("dashboard").setup({
	theme = "doom",
	shortcut_type = "letter",
	shuffle_letter = false,
	config = {
		week_header = { enable = true },
		center = {
			{
				icon = " ",
				desc = "New File",
				key = "t",
				key_format = " %s",
				action = "ene",
			},
			{
				icon = " ",
				desc = "Find File",
				key = "f",
				key_format = " %s",
				action = "FzfLua files",
			},
			{
				icon = " ",
				desc = "Recent files",
				key = "r",
				key_format = " %s",
				action = "FzfLua oldfiles",
			},
			{
				icon = "󰒮 ",
				desc = "Open Last Session",
				key = "l",
				key_format = " %s",
				action = function()
					require("persistence").load({ last = true })
				end,
			},
			{
				icon = " ",
				desc = "Choose Session to Open",
				key = "s",
				key_format = " %s",
				action = function()
					require("persistence").select()
				end,
			},
			{
				icon = " ",
				desc = "Live Grep",
				key = "g",
				key_format = " %s",
				action = "FzfLua live_grep",
			},
			{
				icon = " ",
				desc = "Projects",
				key = "p",
				key_format = " %s",
				action = "FzfProjects",
			},
			{
				icon = " ",
				desc = "Config",
				key = "c",
				key_format = " %s",
				action = "FzfLua files cwd=/home/br4mos/.config/nvim/",
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
				action = "qa",
			},
		},
		vertical_center = true,
	},
})
