local wk = require("which-key")

wk.setup({
	preset = "helix",
})

wk.add({
	{ "<localleader>l", group = "LaTeX", icon = "󰗊" },
	-------------------------------------------------------------
	-- INDIVIDUAL MAPPINGS
	{ "<leader>e", "<cmd>Neotree reveal_force_cwd toggle left<CR>", desc = "Toggle CWD NeoTree", icon = " " },
	{ "<leader>o", "<cmd>vsplit<CR>", desc = "Split Vertically", icon = "" },
	{ "<leader>u", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "LSP Info", icon = "" },
	{ "<leader>l", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "LSP Signature Help", icon = "" },
	{ "<leader>y", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Float Open Diagnostics", icon = "󰉩" },
	{ "<leader>b", "<cmd>terminal<CR>", desc = "Open Terminal in Place", icon = " " },
	{
		"<leader>t",
		"<cmd>ToggleTerm direction=horizontal dir=%:p:h<CR>",
		desc = "Split Terminal",
		icon = " ",
	},
	{
		"<leader>p",
		"<cmd>vsplit<CR><cmd>terminal<CR>",
		desc = "Open Split Terminal",
		icon = " ",
	},
	{ "<leader> ", "<cmd>b#<CR>", desc = "Switch to previous buffer", icon = "󰒮 " },
	{ "<leader>h", icon = " " },
	{ "<leader>;", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action", icon = "a" },
	-------------------------------------------------------------
	{ "<leader>g", group = "Git", desc = "Git", icon = " " },
	{ "<leader>gg", "<cmd>LazyGitCurrentFile<CR>", desc = "LazyGit", icon = " " },
	{ "<leader>gp", icon = " " },
	{ "<leader>gb", icon = "󰈸 " },
	-------------------------------------------------------------
	{ "<leader>k", group = "FzfLua (Search)", icon = " " },
	{ "<leader>kr", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files", icon = "󰑌 " },
	{ "<leader>kf", "<cmd>FzfLua files<CR>", desc = "Find files", icon = " " },
	{ "<leader>kd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Diagnostics", icon = " " },
	{ "<leader>kh", "<cmd>FzfLua command_history<CR>", desc = "Command History", icon = " " },
	{ "<leader>kk", "<cmd>FzfLua keymaps<CR>", desc = "Keymaps", icon = " " },
	{ "<leader>kq", "<cmd>FzfLua files cwd=~<CR>", desc = "Find files in ~", icon = " " },
	{ "<leader>kw", "<cmd>FzfLua files cwd=/<CR>", desc = "Find files in /", icon = "󰞄 " },
	{ "<leader>ks", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols", icon = "󰫧 " },
	{ "<leader>kg", "<cmd>FzfLua grep_cword<CR>", desc = "Grep word under cursor", icon = " " },
	{ "<leader>kc", "<cmd>FzfLua git_commits<CR>", desc = "Git Commits", icon = " " },
	-------------------------------------------------------------
	{ "<leader>c", group = "Conform (Autoformat)", icon = " " },
	{ "<leader>cf", desc = "Format Selection/File", icon = "󰉦 " },
	{ "<leader>cb", desc = "Toggle Buffer Autoformatting", icon = " " },
	{ "<leader>cg", desc = "Toggle Global Autoformatting", icon = " " },
	-------------------------------------------------------------
	{ "<leader>d", group = "Debug", icon = "󰃤 " },
	{ "<leader>db", desc = "Toggle Breakpoint", icon = "󱈸 " },
	{ "<leader>dc", desc = "Clear Breakpoint", icon = " " },
	{ "<leader>du", desc = "Toggle DAP UI", icon = " " },
	-------------------------------------------------------------
	{ "<leader>f", group = "TODO", icon = " " },
	{ "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "Find Todo comments", icon = "📝" },
	{ "<leader>fb", "<cmd>TodoTrouble<CR>", desc = "Trouble Todo list", icon = " " },
	-------------------------------------------------------------
	{ "<leader>x", group = "Trouble (Diagnostics)", icon = " " },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)", icon = " " },
	{
		"<leader>xc",
		"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
		desc = "Buffer Diagnostics (Trouble)",
		icon = " ",
	},
	{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)", icon = "󱔁 " },
	{
		"<leader>xl",
		"<cmd>Trouble lsp toggle focus=false<CR>",
		desc = "LSP Definitions / references / ... ",
		icon = "󰲅",
	},
	{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)", icon = " " },
	-------------------------------------------------------------
	{ "<leader>q", group = "Manage tabs", icon = "󰓩 " },
	{ "<leader>qn", "<cmd>tabnew<CR>", desc = "Create New Tab", icon = "󰝜 " },
	{ "<leader>qw", "<cmd>tabNext<CR>", desc = "Switch to Next Tab", icon = "󰌒 " },
	-------------------------------------------------------------
})
