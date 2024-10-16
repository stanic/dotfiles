return {
	{
		'tiagovla/tokyodark.nvim',
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("tokyodark").setup(opts)
			vim.cmd [[colorscheme tokyodark]]
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "codedark",
				}
			})
		end
	},
}
