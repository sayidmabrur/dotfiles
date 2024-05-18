local null_ls = require("null-ls")

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local on_attach = require("plugins.lsp.handlers").on_attach
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.black,
		diagnostics.pylama,
		-- formatting.phpcsfixer,
	},
	-- Format file on save
	on_attach = on_attach,
})
