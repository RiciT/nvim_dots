local wk = require("which-key")

wk.setup({
	preset = "helix",
})

wk.add({
	{ "<localleader>l", group = "LaTeX", icon = "󰗊" },
	-------------------------------------------------------------
	{ "<leader>g", "<cmd>LazyGitCurrentFile<CR>", desc = "LazyGit", icon = " " },
	-------------------------------------------------------------
	{ "<leader>f", group = "TODO", icon = " " },
	{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find Todo comments", icon = "📝" },
	{ "<leader>fb", "<cmd>TodoQuickFix<CR>", desc = "Trouble Todo list", icon = " " },
	-------------------------------------------------------------
	{ "<leader>e", group = "NeoTree", icon = "󱘎 " },
	{ "<leader>eg", "<cmd>Neotree filesystem toggle left<CR>", desc = "Toggle global NeoTree", icon = " " },
	{ "<leader>ee", "<cmd>Neotree reveal_force_cwd toggle left<CR>", desc = "Toggle CWD NeoTree", icon = " " },
	-------------------------------------------------------------
	{ "<leader>k", group = "Telescope", icon = " " },
	{ "<leader>kr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files", icon = "󰑌 " },
	{ "<leader>kf", "<cmd>Telescope find_files<CR>", desc = "Find files", icon = " " },
	{ "<leader>kd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics", icon = " " },
	{ "<leader>kh", "<cmd>Telescope command_history<CR>", desc = "Command History", icon = " " },
	-------------------------------------------------------------
	{ "<leader>c", group = "Conform (Autoformat)", icon = " " },
	{ "<leader>cf", desc = "Format Selection/File", icon = "󰉦 " },
	{ "<leader>cb", desc = "Toggle Buffer Autoformatting", icon = " " },
	{ "<leader>cg", desc = "Toggle Global Autoformatting", icon = " " },
	-------------------------------------------------------------
	{ "<leader>d", group = "Debug", icon = "󰃤 " },
	{ "<leader>db", desc = "Toggle Breakpoint", icon = "󱈸 " },
	{ "<leader>dc", desc = "Clear Breakpoint", icon = " " },
	{ "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle DAP UI", icon = " " },
	-------------------------------------------------------------
	{ "<leader>x", group = "Trouble (Diagnostics)", icon = " " },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)", icon = " " },
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
		desc = "Buffer Diagnostics (Trouble)",
		icon = " ",
	},
	{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)", icon = "󱔁 " },
	{
		"<leader>cl",
		"<cmd>Trouble lsp toggle focus=false<CR>",
		desc = "LSP Definitions / references / ... ",
		icon = "󰲅",
	},
	{ "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)", icon = " " },
	{ "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)", icon = " " },
	-------------------------------------------------------------
	{ "<leader>x", group = "Trouble (Diagnostics)", icon = " " },
	-------------------------------------------------------------
	{ "<leader>q", group = "Show/Hide Diagnostics", icon = " " },
	{ "<leader>qs", "<cmd>lua vim.diagnostic.show<CR>", desc = "[S]how diagnostics", icon = "󰈈 " },
	{ "<leader>qh", "<cmd>lua vim.diagnostic.hide<CR>", desc = "[H]ide diagnostics", icon = "󰈉 " },
	-------------------------------------------------------------
	{
		"<leader>t",
		"<cmd>ToggleTerm direction=horizontal dir=%:p:h<CR>",
		desc = "Split Terminal",
		icon = " ",
	},
	-------------------------------------------------------------
	{ "<leader>s", group = "Search (FzfLua)", icon = " " },
	{ "<leader>sh", "<cmd>FzfLua files cwd=~<CR>", desc = "Find files in ~", icon = " " },
	{ "<leader>sf", "<cmd>FzfLua files cwd=$CWD<CR>", desc = "Find files in CWD", icon = "󰜐 " },
})
