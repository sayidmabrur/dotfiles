local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
-- pick art at arts directory

local art_name = "bear_nvim"
local status_ok, art = pcall(require, "plugins.alpha.arts." .. art_name)
dashboard.section.header.val = art

dashboard.section.buttons.val = {
	dashboard.button("f", "   Find file", ":Telescope find_files <CR>"),
	dashboard.button("t", "󰺯   Find text", ":Telescope live_grep <CR>"),
	dashboard.button("n", "   New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "   Recent", ":Telescope oldfiles <CR>"),
}

local function footer()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return { [[Menuju tak terbatas dan melampauinya]], [[-- Buzz Lightyear --]] }
	end
	fortune = require("alpha.fortune")
	return fortune
end
dashboard.section.footer.val = footer()

dashboard.section.header.opts.position = "center"
dashboard.section.footer.opts.hl = "Type"
dashboard.section.footer.opts.position = "center"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
