local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("mason-nvim-dap").setup({
	automatic_installation = true,
	ensure_installed = {},
	handlers = {}, -- this automatically handles DAPs installed via Mason
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
