return {
	{
		'nvim-orgmode/orgmode',
		event = 'VeryLazy',
		ft = { 'org' },
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/org/**/*",
				org_default_notes_file = "~/org/refile.org",
			})
		end
	},
	{
		'akinsho/org-bullets.nvim',
		config = function()
			require("org-bullets").setup()
		end
	}
}
