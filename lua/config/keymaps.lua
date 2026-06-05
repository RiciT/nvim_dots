-- KEYMAPS
-- Use <Esc> to exit terminal mode
local map = vim.keymap.set

map("t", "<Esc>", "<C-\\><C-n>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move between windows
map({ "n" }, "<C-m>", "<C-w>h")
map({ "n" }, "<C-n>", "<C-w>j")
map({ "n" }, "<C-e>", "<C-w>k")
map({ "n" }, "<C-i>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "Increase Window Width" })

map("n", "g<C-e>", "<cmd>resize +15<cr>", { desc = "Increase Window Height" })
map("n", "g<C-n>", "<cmd>resize -15<cr>", { desc = "Decrease Window Height" })
map("n", "g<C-m>", "<cmd>vertical resize +15<cr>", { desc = "Decrease Window Width" })
map("n", "g<C-i>", "<cmd>vertical resize -15<cr>", { desc = "Increase Window Width" })

-- This part is the accomodate colemak-dh
-- dont skip over wrapped lines when jumping lines
-- also remap H and L to 0 and $
-- and fix the uppercase mappings
local modes = { "n", "v", "o" }

map(modes, "m", "h")
map(modes, "M", "0")
map(modes, "j", "m")

map(modes, "n", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map(modes, "N", "H")
map(modes, "h", "n")
map(modes, "H", "N")

map(modes, "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map(modes, "E", "K")
map(modes, "k", "e")
map(modes, "K", "E")

map(modes, "i", "l")
map(modes, "I", "$")
map(modes, "l", "i")
map(modes, "L", "I")

-- map oien to esc
map({ "i" }, "oien", "<Esc>")

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

-- CONFORM
-- Manual formatting keymap (always works, even if autoformat is toggled off)
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
		timeout_ms = 500,
	})
end, { desc = "Format file or range" })

-- TOGGLE KEYMAPS
-- Toggle formatting for the current buffer only
vim.keymap.set("n", "<leader>cb", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	if vim.b.disable_autoformat then
		vim.notify("Autoformat disabled for this buffer", vim.log.levels.WARN, { title = "Conform" })
	else
		vim.notify("Autoformat enabled for this buffer", vim.log.levels.INFO, { title = "Conform" })
	end
end, { desc = "Toggle autoformat (Buffer)" })

-- Toggle formatting globally
vim.keymap.set("n", "<leader>cg", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	if vim.g.disable_autoformat then
		vim.notify("Autoformat disabled globally", vim.log.levels.WARN, { title = "Conform" })
	else
		vim.notify("Autoformat enabled globally", vim.log.levels.INFO, { title = "Conform" })
	end
end, { desc = "Toggle autoformat (Global)" })
