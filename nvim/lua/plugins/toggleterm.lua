require("toggleterm").setup({
	direction = "float",
	start_in_insert = true,
	insert_mapping = true,
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved", -- like `size`, width and height can be a number or function which is passed the current terminal
	},
	close_on_exit = true,
})
