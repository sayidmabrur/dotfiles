local utils = require("heirline.utils")

local conditions = require("heirline.conditions")
local colors = require("plugins.heirline.components.colors.kanagawa")

require("heirline").load_colors(colors)

-- layout components
local Align = require("plugins.heirline.components.core.align")
local Space = require("plugins.heirline.components.core.space")
local block = require("plugins.heirline.components.core.block")

-- statusline components
local Diagnostics = require("plugins.heirline.components.diagnostics")
local ViMode = require("plugins.heirline.components.vimode")
local Ruler = require("plugins.heirline.components.core.ruler")
local ScrollBar = require("plugins.heirline.components.core.scrollbar")
local Git = require("plugins.heirline.components.git")
local FileNameBlock = require("plugins.heirline.components.filenameblock")
local Circle = { provider = " " }
local LSPActive = require("plugins.heirline.components.lsp")
local Divider = { provider = "" }

return {
	block,
	Space,
	ViMode,
	Space,
	Space,
	FileNameBlock,
	Align,
	Diagnostics,
	Space,
	Git,
	Space,
	LSPActive,
	Space,
	Space,
	Space,
	-- Divider,
	Space,
	Circle,
	Space,
	Ruler,
	Space,
	ScrollBar,

	static = {
		mode_colors_map = {
			n = "customNormal",
			i = "customInsert",
			v = "customVisual",
			V = "customVisual",
			["\22"] = "customVisual",
			c = "customTerm",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "customTerm",
			r = "customTerm",
			["!"] = "red",
			t = "customTerm",
		},
		mode_color = function(self)
			local mode = conditions.is_active() and vim.fn.mode() or "n"
			return self.mode_colors_map[mode]
		end,
	},
}
