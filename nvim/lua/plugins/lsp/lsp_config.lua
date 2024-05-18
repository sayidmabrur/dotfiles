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
    name = "tsserver",
    opts = {},
  },
  -- JSON & YAML Language Server
  {
    name = "spectral",
    opts = {},
  },
  -- HTML Language Server
  {
    name = "html",
    opts = {},
  },
}

-- load the lsp
local on_attach = require("plugins.lsp.handlers").on_attach
local lspconfig = require("lspconfig")
for _, lsp in pairs(lsps) do
  lsp.opts.on_attach = on_attach
  lsp.opts.capabilities = capabilities
  lspconfig[lsp.name].setup(lsp.opts)
end

require("lspconfig.ui.windows").default_options.border = "rounded"
