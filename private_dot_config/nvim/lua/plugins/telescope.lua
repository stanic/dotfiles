return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'nvim-orgmode/telescope-orgmode.nvim',
		event = "VeryLazy",
		dependencies = {
			'nvim-orgmode/orgmode',
			'nvim-telescope/telescope.nvim',
		},
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
	}
}
