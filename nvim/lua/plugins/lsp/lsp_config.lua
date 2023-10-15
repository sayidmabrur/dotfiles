-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsps = {
	-- Lua Language Server
	{
		name = "lua_ls",
		opts = {
			settings = {
				Lua = {
          -- Ignore error when accessing vim API
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
	},
	-- PHP Language Server
	{
		name = "intelephense",
		opts = {},
	},
	-- Python Language Server
	{
		name = "pyright",
		opts = {},
	},
	-- JavaScript Language Server
	{
		name = "eslint",
		opts = {},
	},
	-- JSON & YAML Language Server
	{
		name = "spectral",
		opts = {},
	},
}

-- load the lsp
local lspconfig = require("lspconfig")
for _, lsp in pairs(lsps) do
	lsp.opts.capabilities = capabilities
	lspconfig[lsp.name].setup(lsp.opts)
end
