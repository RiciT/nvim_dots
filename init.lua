-- import config dir manually to keep the load order deterministic
require("config.options")
require("config.plugins")
require("config.keymaps")
require("config.autocommands")

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

-- helper user commands for managing vim.pack
local function complete_packages(arg_lead)
	arg_lead = arg_lead or ""

	return vim.iter(vim.pack.get())
		:map(function(pack)
			return pack.spec.name
		end)
		:filter(function(name)
			return vim.startswith(name, arg_lead)
		end)
		:totable()
end

vim.api.nvim_create_user_command("PackUpdate", function(info)
	if #info.fargs ~= 0 then
		vim.pack.update(info.fargs, { force = info.bang })
	else
		local prompt = "Do you want to update ALL packages? "
		local choice = vim.fn.confirm(prompt, "&Yes\n&No", 2)

		if choice == 1 then
			vim.notify("Updating everything.", vim.log.levels.INFO)
			vim.pack.update(nil, { force = info.bang })
		else
			vim.notify("Update aborted.", vim.log.levels.WARN)
		end
	end
end, {
	desc = "Update packages",
	nargs = "*",
	bang = true,
	complete = complete_packages,
})

vim.api.nvim_create_user_command("PackDelete", function()
	local packages = vim.pack.get()
	local items = vim.tbl_map(function(pkg)
		return pkg.spec.name
	end, packages)

	vim.ui.select(items, {
		prompt = "Delete package:",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if choice then
			local ok, err = pcall(vim.pack.del, { choice })
			if ok then
				vim.notify("Deleted: " .. choice, vim.log.levels.INFO, { title = "Package manager" })
			else
				vim.notify(
					"Failed to delete: " .. choice .. "\n" .. tostring(err),
					vim.log.levels.ERROR,
					{ title = "Package manager" }
				)
			end
		end
	end)
end, {})
