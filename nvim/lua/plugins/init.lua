local plugins = {
	"alpha",
	"colorscheme",
	"lsp",
	"treesitter",
	"autopairs",
	"telescope",
	"comment",
	"heirline",
	"gitsigns",
	"indent_blankline",
}

for _, j in pairs(plugins) do
	require("plugins." .. j)
end
