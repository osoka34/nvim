return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_c = {
					{ "filename" },
					{ require("nvim-navic").get_location, cond = require("nvim-navic").is_available },
				},
			},
		})
	end,
	dependencies = {
		"dracula/vim",
		"SmiteshP/nvim-navic",
	},
}
