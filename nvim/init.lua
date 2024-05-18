require("core")

-- Lazy Nvim PLugin Managers

-- list all plugins here
local plugins = {

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	{
		"aurum77/live-server.nvim",
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	},
	"nvim-lua/plenary.nvim",
	-- Terminal Toggle
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- Line Indentation
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Bracket Pairing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	-- Dashboard opener
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Syntax Highlighting
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- CMP
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"chrisgrieser/cmp-nerdfont",

	-- LSP
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim",
		"nvim-lua/lsp-status.nvim",
	},
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	-- colorscheme
	"sainnhe/gruvbox-material",
	"rebelot/kanagawa.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- File Finder

	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- Tab and buffer UI
	--
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	-- Commenter
	{ "numToStr/Comment.nvim" }, -- Easily comment stuff

	-- StatusLine
	{
		"rebelot/heirline.nvim",
		-- You can optionally lazy-load heirline on UiEnter
		-- to make sure all required plugins and colorschemes are loaded before setup
		-- event = "UiEnter",
	},

	-- Git manager
	"lewis6991/gitsigns.nvim",

	-- pwd
	"SmiteshP/nvim-navic",
}

-- add options for lazy.nvim here
local opts = {
	ui = {
		wrap = true, -- wrap the lines in the ui
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",
		title = "Made 󰄛 With 󱚦 Love 󰞇 ", ---@type string only works when border is not "none"
	},
	-- install = {
	-- 	colorscheme = { "gruvbox-material" },
	-- },
}

require("lazy").setup(plugins, opts)

-- unload plugins
require("plugins")
