local files = {
  "config",
  "cmp",
  "lsp_config",
  "null_ls",
  "lsp_keymaps",
  "mason",
}

for _, val in pairs(files) do
  require("plugins.lsp." .. val)
end
