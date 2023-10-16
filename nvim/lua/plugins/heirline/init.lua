local conditions = require("heirline.conditions")
-- defining lines
local statusline = require("plugins.heirline.components.statusline")
local winbar = require("plugins.heirline.components.winbar")
local tabline = require("plugins.heirline.components.tabline")

require("heirline").setup({
	statusline = statusline,
	winbar = winbar,
	tabline = tabline,
	opts = {
		-- if the callback returns true, the winbar will be disabled for that window
		-- the args parameter corresponds to the table argument passed to autocommand callbacks. :h nvim_lua_create_autocmd()
		disable_winbar_cb = function(args)
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "help", "quickfix" },
				filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
			}, args.buf)
		end,
	},
})

-- Yep, with heirline we're driving manual!
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
