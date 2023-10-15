local files = {
	"config",
	"cmp",
	"lsp_keymaps",
	"lsp_config",
	"mason",
	"null_ls",
}

for _, val in pairs(files) do
	require("plugins.lsp." .. val)
end
