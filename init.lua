-- automatically import every lua file in the config dir
local plugins_dir = vim.fn.stdpath("config") .. "/lua/config"
if vim.fn.isdirectory(plugins_dir) == 1 then
	for name, type in vim.fs.dir(plugins_dir) do
		if type == "file" and name:match("%.lua$") then
			local module = name:gsub("%.lua$", "")
			require("config." .. module)
		end
	end
end
-- automatically import every lua file in the plugins dir
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
if vim.fn.isdirectory(plugins_dir) == 1 then
	for name, type in vim.fs.dir(plugins_dir) do
		if type == "file" and name:match("%.lua$") then
			local module = name:gsub("%.lua$", "")
			require("plugins." .. module)
		end
	end
end
-- automatically import every lua file in the config dir
local plugins_dir = vim.fn.stdpath("config") .. "/lua/after/queries"
if vim.fn.isdirectory(plugins_dir) == 1 then
	for name, type in vim.fs.dir(plugins_dir) do
		if type == "file" and name:match("%.lua$") then
			local module = name:gsub("%.lua$", "")
			require("config." .. module)
		end
	end
end
