require("project_nvim").setup({})

vim.api.nvim_create_user_command("FzfProjects", function()
	local history = require("project_nvim.utils.history")
	local recent_projects = history.get_recent_projects()

	local formatted_projects = {}
	local seen_basenames = {}

	for _, path in ipairs(recent_projects) do
		local basename = vim.fn.fnamemodify(path, ":t")
		local display_name
		if seen_basenames[basename] then
			local parent = vim.fn.fnamemodify(path, ":h:t")
			display_name = parent .. "/" .. basename
		else
			display_name = basename
			seen_basenames[basename] = true
		end

		table.insert(formatted_projects, string.format("%s\t%s", display_name, path))
	end

	require("fzf-lua").fzf_exec(formatted_projects, {
		prompt = "Projects> ",
		fzf_opts = {
			["--delimiter"] = "\t",
			["--with-nth"] = "1",
		},
		actions = {
			["default"] = function(selected)
				if not selected or not selected[1] then
					return
				end

				local path = string.match(selected[1], "\t(.*)")
				if not path then
					return
				end

				vim.api.nvim_set_current_dir(path)

				vim.schedule(function()
					require("fzf-lua").files({
						cwd = path,
						prompt = "Files (" .. vim.fn.fnamemodify(path, ":t") .. ")> ",
					})
				end)
			end,
		},
	})
end, { desc = "Fzf Lua Recent Projects" })
