return {
	{
		'tiagovla/tokyodark.nvim',
		opts = {},
		config = function(_, opts)
			require("tokyodark").setup(opts)
			vim.cmd [[colorscheme tokyodark]]
		end,
	},
	-- { 'shatur/neovim-ayu', config = require("ayu").setup() },
	{ 'vim-airline/vim-airline' },
	{ 'vim-airline/vim-airline-themes' },
}
