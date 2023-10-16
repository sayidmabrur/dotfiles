local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = require("plugins.heirline.components.colors.kanagawa")
require("heirline").load_colors(colors)

local FileNameBlock = {
	-- let's first set up some attributes needed by this component and it's children
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}
-- We can now define some children separately and add them later

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	provider = function(self)
		-- first, trim the pattern relative to the current directory. For other
		-- options, see :h filename-modifers
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		-- now, if the filename would occupy more than 1/4th of the available
		-- space, we trim the file path to its initials
		-- See Flexible Components section below for dynamic truncation
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "[+]",
		hl = { fg = "green" },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "",
		hl = { fg = "orange" },
	},
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			-- use `force` because we need to override the child's hl foreground
			return { fg = "cyan", bold = true, force = true }
		end
	end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(
	FileNameBlock,
	FileIcon,
	utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
	FileFlags,
	{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)
local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = { fg = utils.get_highlight("Type").fg, bold = true },
}
local Space = { provider = " " }
local TerminalName = {
	-- we could add a condition to check that buftype == 'terminal'
	-- or we could do that later (see #conditional-statuslines below)
	provider = function()
		local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
		return " " .. tname
	end,
	hl = { fg = "blue", bold = true },
}

local CloseButton = {
	condition = function(self)
		return not vim.bo.modified
	end,
	-- a small performance improvement:
	-- re register the component callback only on layout/buffer changes.
	update = { "WinNew", "WinClosed", "BufEnter" },
	{ provider = " " },
	{
		provider = "",
		hl = { fg = "gray" },
		on_click = {
			minwid = function()
				return vim.api.nvim_get_current_win()
			end,
			callback = function(_, minwid)
				vim.api.nvim_win_close(minwid, true)
			end,
			name = "heirline_winbar_close_button",
		},
	},
}

-- Use it anywhere!
local WinBarFileName = utils.surround({ "", "" }, "bright_bg", {
	hl = function()
		if not conditions.is_active() then
			return { fg = "gray", force = true }
		end
	end,
	FileNameBlock,
	Space,
	CloseButton,
})

local WinBars = {
	fallthrough = false,
	{ -- A special winbar for terminals
		condition = function()
			return conditions.buffer_matches({ buftype = { "terminal" } })
		end,
		utils.surround({ "", "" }, "dark_red", {
			FileType,
			Space,
			TerminalName,
		}),
	},
	{ -- An inactive winbar for regular files
		condition = function()
			return not conditions.is_active()
		end,
		utils.surround({ "", "" }, "lotusAqua", { hl = { fg = "gray", force = true }, FileNameBlock }),
	},
	-- A winbar for regular files
	utils.surround({ "", "" }, "lotusAqua", FileNameBlock),
}

return WinBars
