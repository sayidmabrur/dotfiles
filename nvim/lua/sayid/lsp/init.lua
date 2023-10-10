local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "sayid.lsp.mason"
require("sayid.lsp.handlers").setup()
require "sayid.lsp.null-ls"
