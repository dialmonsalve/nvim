return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("dial.configs.lualine")
		end,
		config = function(_, opts)
			require("dial.configs.lualine")
		end,
	},
}
