-- PLUGINS
local function add_package(pack)
	vim.pack.add({ "https://github.com/" .. pack })
end

-- the mason, mason-lspconfig, cmp-nvim-lsp -> requires are needed here since we have to guarantee
-- they run in the right order

----------------------------------------------
-- Quickstart configs for LSP
add_package("neovim/nvim-lspconfig")
vim.lsp.config("ltex", {
	settings = {
		ltex = {
			language = "en-GB",
		},
	},
})
-- Mason -> Lsp pack manager
add_package("mason-org/mason.nvim")
-- Help Mason implement lsps with nvim
add_package("mason-org/mason-lspconfig.nvim")
require("mason").setup({})
----------------------------------------------
-- Neovim Lua Development
add_package("folke/lazydev.nvim")
----------------------------------------------
-- Linter integration
add_package("mfussenegger/nvim-lint")
----------------------------------------------
-- Fuzzy finder
add_package("ibhagwan/fzf-lua")
----------------------------------------------
-- Git integration
add_package("lewis6991/gitsigns.nvim")
----------------------------------------------
-- Advanced search highlighting
add_package("folke/flash.nvim")
----------------------------------------------
-- Treesitter
add_package("nvim-treesitter/nvim-treesitter")
add_package("nvim-treesitter/nvim-treesitter-textobjects") --this does not work currently
----------------------------------------------
-- Dashboard
add_package("nvimdev/dashboard-nvim")
-- Coloured icons dep for quite a few things
add_package("nvim-tree/nvim-web-devicons")
----------------------------------------------
-- lot of packages require it as dep
add_package("nvim-lua/plenary.nvim")
----------------------------------------------
-- VimTeX
add_package("lervag/vimtex")
----------------------------------------------
-- Pywal colorscheme
add_package("AlphaTechnolog/pywal.nvim")
----------------------------------------------
-- Which-key
add_package("folke/which-key.nvim")
add_package("nvim-mini/mini.icons")
----------------------------------------------
-- Buffer manager - (plenary also a dep here)
add_package("j-morano/buffer_manager.nvim")
----------------------------------------------
-- Bufferline
add_package("akinsho/bufferline.nvim")
----------------------------------------------
-- Neo-tree explorer
add_package("nvim-neo-tree/neo-tree.nvim")
-- deps also plenary
add_package("MunifTanjim/nui.nvim")
-- opt deps
add_package("antosha417/nvim-lsp-file-operations")
add_package("s1n7ax/nvim-window-picker")
--add_package("3rd/image.nvim") only in kitty since terminator cant render images
----------------------------------------------
-- Better Completion engine
-- need this autocommand here sadly
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local plugin_name = string.lower(ev.data.spec.name)
		if plugin_name == "luasnip" and (ev.data.kind == "install" or ev.data.kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path })
		end
	end,
})

add_package("hrsh7th/nvim-cmp")
-- deps
add_package("L3MON4D3/LuaSnip")
add_package("saadparwaiz1/cmp_luasnip")
-- opt deps
add_package("hrsh7th/cmp-nvim-lsp")
add_package("hrsh7th/cmp-path")
add_package("hrsh7th/cmp-cmdline")
add_package("rafamadriz/friendly-snippets")
-- for vimtex completions
add_package("hrsh7th/cmp-omni")

-- set up handlers for lsps
-- get the default capabilities from cmp-nvim-lsp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
	handlers = {
		-- this default handler is called for every installed lsp
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	},
})
----------------------------------------------
-- Pretty UI :))
add_package("folke/noice.nvim")
-- deps
add_package("rcarriga/nvim-notify")
----------------------------------------------
-- Formatter
add_package("stevearc/conform.nvim")
----------------------------------------------
-- Diagnostics list
add_package("folke/trouble.nvim")
----------------------------------------------
-- Markdown rendering
add_package("MeanderingProgrammer/render-markdown.nvim")
----------------------------------------------
-- Status line
add_package("nvim-lualine/lualine.nvim")
----------------------------------------------
-- LazyGit integration
add_package("kdheepak/lazygit.nvim")
----------------------------------------------
-- Debugging (DAP)
add_package("mfussenegger/nvim-dap")
add_package("rcarriga/nvim-dap-ui")
-- deps
add_package("nvim-neotest/nvim-nio")
add_package("jay-babu/mason-nvim-dap.nvim") -- bridges Mason with DAP
----------------------------------------------
-- Quick scratchpad terminal for compiling
add_package("akinsho/toggleterm.nvim")
----------------------------------------------
-- Sessions
add_package("folke/persistence.nvim")
----------------------------------------------
-- Lean support
add_package("julian/lean.nvim")
----------------------------------------------
-- Support for the eww config language yuck
add_package("elkowar/yuck.vim")
----------------------------------------------
-- QoL Plugins
add_package("windwp/nvim-autopairs")
add_package("kylechui/nvim-surround")
add_package("folke/todo-comments.nvim")
add_package("ahmedkhalf/project.nvim")
