return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup{
			ensure_installed = {
				"vim",
				"vimdoc",
				"help",
				-- Markup
				"markdown",
				"yaml",
				"toml",
				"json",
				-- Shell
				"bash",
				"fish",
				-- Build tools
				"cmake",
				"dockerfile",
				-- Language
				"c",
				"lua",
				"python",
				"rust",
				"java",
			},
			auto_install = true,
			highlight = {
				enable = true,

				additional_vim_regex_highlighting = false,
			},
			matchup = {
				enable = true
			}
		}
	end
}
