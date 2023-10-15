vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

-- Global mapping for LSP
vim.keymap.set("n", "q", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-q>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-Q>", vim.diagnostic.goto_next)
vim.keymap.set("n", "Q", vim.diagnostic.setloclist)
