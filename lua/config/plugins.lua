-- PLUGINS
_G.TotalPluginCount = 0
local function add_package(pack)
	_G.TotalPluginCount = _G.TotalPluginCount + 1
	vim.pack.add({ "https://github.com/" .. pack })
end

-- TODO: will need to add some keymap configs for lsps

----------------------------------------------
-- Quickstart configs for LSP
add_package("neovim/nvim-lspconfig")
-- Mason -> Lsp pack manager
add_package("mason-org/mason.nvim")
-- Help Mason implement lsps with nvim
add_package("mason-org/mason-lspconfig.nvim")
require("mason").setup({})
require("mason-lspconfig").setup({})
----------------------------------------------
-- Fuzzy finder
add_package("ibhagwan/fzf-lua")
require("fzf-lua").setup({ fzf_colors = true })
----------------------------------------------
-- Git integration
add_package("lewis6991/gitsigns.nvim")
require("gitsigns").setup({})
----------------------------------------------
-- Advanced search highlighting
add_package("folke/flash.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Treesitter
add_package("nvim-treesitter/nvim-treesitter")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Dashboard
add_package("nvimdev/dashboard-nvim")
-- Coloured icons dep for quite a few things
add_package("nvim-tree/nvim-web-devicons")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Telescope
add_package("nvim-telescope/telescope.nvim")
-- deps
add_package("nvim-lua/plenary.nvim")
-- opt deps
add_package("nvim-telescope/telescope-fzf-native.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- VimTeX
add_package("lervag/vimtex")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Pywal colorscheme
add_package("AlphaTechnolog/pywal.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Which-key
add_package("folke/which-key.nvim")
add_package("nvim-mini/mini.icons")
----------------------------------------------
-- Buffer manager - (plenary also a dep here)
add_package("j-morano/buffer_manager.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Bufferline
add_package("akinsho/bufferline.nvim")
require("bufferline").setup({})
----------------------------------------------
-- Neo-tree explorer
add_package("nvim-neo-tree/neo-tree.nvim")
-- deps also plenary
add_package("MunifTanjim/nui.nvim")
-- opt deps
add_package("antosha417/nvim-lsp-file-operations")
add_package("s1n7ax/nvim-window-picker")
add_package("3rd/image.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
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
add_package("rafamadriz/friendly-snippets")
----------------------------------------------
-- Pretty UI :))
add_package("folke/noice.nvim")
-- deps
add_package("rcarriga/nvim-notify")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Formatter
add_package("stevearc/conform.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Diagnostics list
add_package("folke/trouble.nvim")
require("trouble").setup({})
----------------------------------------------
-- Markdown rendering
add_package("MeanderingProgrammer/render-markdown.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Status line
add_package("nvim-lualine/lualine.nvim")
require("lualine").setup({})
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
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Quick scratchpad terminal for compiling
add_package("akinsho/toggleterm.nvim")
-- (SETUP)CONFIG IN SEPARATE FILE
----------------------------------------------
-- Neovim Lua Development
add_package("folke/lazydev.nvim")
require("lazydev").setup({})
----------------------------------------------
-- QoL Plugins
add_package("windwp/nvim-autopairs")
add_package("kylechui/nvim-surround")
require("nvim-surround").setup({})
add_package("folke/todo-comments.nvim")
require("todo-comments").setup({})
add_package("kosayoda/nvim-lightbulb")
require("nvim-lightbulb").setup({
	autocmd = { enabled = true },
})
