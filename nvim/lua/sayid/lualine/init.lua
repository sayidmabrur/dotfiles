local variant = "classic"

local status_ok, lua_line = pcall(require, "sayid.lualine.variants." .. variant)
if not status_ok then
	vim.notify("Lua Line not found!")
	return
end
