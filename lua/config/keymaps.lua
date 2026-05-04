-- KEYMAPS
-- Use <Esc> to exit terminal mode
local map = vim.keymap.set

map("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
map({ "n" }, "<C-m>", "<C-w>h")
map({ "n" }, "<C-n>", "<C-w>j")
map({ "n" }, "<C-e>", "<C-w>k")
map({ "n" }, "<C-i>", "<C-w>l")

-- This part is the accomodate colemak-dh
local modes = { "n", "v", "o" }

map(modes, "m", "h")
map(modes, "j", "m")

map(modes, "n", "j")
map(modes, "h", "n")

map(modes, "e", "k")
map(modes, "k", "e")

map(modes, "i", "l")
map(modes, "l", "i")

-- clear search highlights on esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- move selection up and down
map("v", "E", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "N", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
--
-- keymaps for jumping between TODOs in the current buffer
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- keymaps for breakpoints
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	require("dap").clear_breakpoints()
end, { desc = "Clear Breakpoints" })

-- classic IDE keymaps for debugging
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Debug: Step Out" })

-- debug and toggleterm
-- Custom F4 mapping to compile/run code without debugging
vim.keymap.set("n", "<F4>", function()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")

	if ft == "python" then
		vim.cmd('TermExec cmd="python3 ' .. file .. '"')
	elseif ft == "c" or ft == "cpp" then
		-- Check if we are in a CMake project
		if vim.fn.filereadable("CMakeLists.txt") == 1 then
			-- Run CMake config (generating debug symbols) and build
			vim.cmd('TermExec cmd="cmake -B build -DCMAKE_BUILD_TYPE=Debug && cmake --build build"')
		else
			-- Fallback for simple single files
			local compiler = (ft == "cpp") and "g++" or "gcc"
			vim.cmd('TermExec cmd="' .. compiler .. " -g " .. file .. ' -o out && ./out"')
		end
	elseif ft == "rust" then
		vim.cmd('TermExec cmd="cargo run"')
	else
		vim.notify("No run command configured for " .. ft, vim.log.levels.WARN)
	end
end, { desc = "Compile/Build Project" })
