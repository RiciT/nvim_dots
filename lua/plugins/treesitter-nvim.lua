require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"regex",
		"markdown",
		"markdown_inline",
		"html",
		"latex",
		"rust",
		"zig",
		"nim",
		"c",
		"cpp",
		"asm",
		"awk",
		"bibtex",
		"cmake",
		"dart",
		"glsl",
		"ini",
		"julia",
		"lua",
		"make",
		"matlab",
		"nasm",
		"python",
		"r",
		"json",
		"toml",
		"vim",
		"yaml",
		"vimdoc",
		"query",
		"zsh",
		"javascript",
		"typescript",
	},
	highlight = {
		enable = true,
		-- Disables standard vim syntax highlighting for these languages in favor of TS
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
				["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
				["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- Whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = { query = "@function.outer", desc = "Next function start" },
				["]]"] = { query = "@class.outer", desc = "Next class start" },
			},
			goto_previous_start = {
				["[m"] = { query = "@function.outer", desc = "Previous function start" },
				["[["] = { query = "@class.outer", desc = "Previous class start" },
			},
		},
	},
})
