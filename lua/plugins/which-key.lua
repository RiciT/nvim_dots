local wk = require("which-key")

wk.setup({
	preset = "helix",
})

wk.add({
	{ "<leader>t", group = "Toggles Autoformat", icon = "󰔡" },
	{ "<localleader>l", group = "LaTeX", icon = "󰗊" },
	{ "<leader>g", icon = " " },
	{ "<leader>f", group = "TODO", icon = " " },
	{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find Todo comments", icon = "📝" },
	{ "<leader>fb", "<cmd>TodoQuickFix<CR>", desc = "Trouble Todo list", icon = " " },
	{ "<leader>e", group = "NeoTree", icon = "󱘎 " },
	{ "<leader>eg", "<cmd>Neotree filesystem toggle left<CR>", desc = "Toggle global NeoTree", icon = " " },
	{ "<leader>ee", "<cmd>Neotree reveal_force_cwd toggle left<CR>", desc = "Toggle CWD NeoTree", icon = " " },
	{ "<leader>k", group = "Telescope", icon = " " },
	{ "<leader>kr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files", icon = "󰑌 " },
	{ "<leader>kf", "<cmd>Telescope find_files<CR>", desc = "Find files", icon = " " },
	{ "<leader>kd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics", icon = " " },
	{ "<leader>c", group = "Conform (Autoformat)", icon = " " },
	{ "<leader>cf", desc = "Format selection/file", icon = "󰉦 " },
	{ "<leader>cb", desc = "Toggle buffer autoformatting", icon = " " },
	{ "<leader>cg", desc = "Toggle global autoformatting", icon = " " },
	{ "<leader>d", group = "Debug", icon = "󰃤 " },
	{ "<leader>db", desc = "Toggle breakpoint", icon = "󱈸 " },
	{ "<leader>dc", desc = "Clear breakpoint", icon = " " },
	{ "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle DAP UI", icon = " " },
})
