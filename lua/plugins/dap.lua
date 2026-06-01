local _dap_loaded = false

local function setup_dap()
	if _dap_loaded then
		return
	end
	_dap_loaded = true

	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup()
	require("mason-nvim-dap").setup({
		automatic_installation = true,
		ensure_installed = {},
		handlers = {}, -- this automatically handles DAPs installed via Mason
	})

	vim.fn.sign_define("DapBreakpoint", {
		text = "●",
		texthl = "DiagnosticError",
		linehl = "",
		numhl = "DiagnosticError",
	})
	vim.fn.sign_define("DapBreakpointCondition", {
		text = "◆",
		texthl = "DiagnosticWarn",
		linehl = "",
		numhl = "DiagnosticWarn",
	})
	vim.fn.sign_define("DapStopped", {
		text = "▶",
		texthl = "DiagnosticOk",
		linehl = "DiffAdd",
		numhl = "DiagnosticOk",
	})
	vim.fn.sign_define("DapBreakpointRejected", {
		text = "○",
		texthl = "DiagnosticHint",
		linehl = "",
		numhl = "",
	})

	-- automatically open and close the DAP UI when debugging starts/stops
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end

	-- C++ configuration
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				-- Automatically append 'build/' to the working directory prompt
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
			end,

			args = function()
				local args_string = vim.fn.input("Command line args (leave empty for none): ")

				-- If you just press Enter, return an empty table (no args)
				if args_string == "" then
					return {}
				end

				-- Otherwise, cleanly split the string by spaces into a table
				local args_table = {}
				for arg in string.gmatch(args_string, "%S+") do
					table.insert(args_table, arg)
				end

				return args_table
			end,

			cwd = "${workspaceFolder}",
			stopAtEntry = false,
			MIMode = "gdb",
			miDebuggerPath = "/usr/bin/gdb",
			setupCommands = {
				{
					text = "-enable-pretty-printing",
					description = "enable pretty printing",
					ignoreFailures = false,
				},
			},
		},
	}

	-- use the exact same config for C and Rust
	dap.configurations.c = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				-- this prompts you to type the name of the compiled file (e.g., 'out')
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtEntry = false,
			MIMode = "gdb",
			miDebuggerPath = "/usr/bin/gdb",
			setupCommands = {
				{
					text = "-enable-pretty-printing",
					description = "enable pretty printing",
					ignoreFailures = false,
				},
			},
		},
	}
	dap.configurations.rust = dap.configurations.c
end

vim.keymap.set("n", "<F5>", function()
	setup_dap()
	require("dap").continue()
end, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F10>", function()
	setup_dap()
	require("dap").step_over()
end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", function()
	setup_dap()
	require("dap").step_into()
end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", function()
	setup_dap()
	require("dap").step_out()
end, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>db", function()
	setup_dap()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	setup_dap()
	require("dap").clear_breakpoints()
end, { desc = "Clear Breakpoints" })
vim.keymap.set("n", "<leader>du", function()
	setup_dap()
	require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
