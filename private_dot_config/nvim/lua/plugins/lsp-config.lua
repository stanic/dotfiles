return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			-- Completion
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/nvim-cmp'
		},
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = {
					"lua_ls",
					"ruff",
					"rust_analyzer",
					"jdtls"
				}
			})
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('lspconfig')['lua_ls'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['ruff'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['rust_analyzer'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['jdtls'].setup {
				capabilities = capabilities
			}
		end
	},
	-- Markup
	{ 'cespare/vim-toml' },
	{
		'cuducos/yaml.nvim',
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		}
	},
	{
		'plasticboy/vim-markdown',
		ft = { "markdown" },
		dependencies = {
			'godlygeek/tabular',
		},
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_new_list_item_indent = 0
			vim.g.vim_markdown_auto_insert_bullets = 0
		end
	},
	-- Shell
	{ 'khaveesh/vim-fish-syntax' },
	-- Languages
	{
		'rust-lang/rust.vim',
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
		end
	},
	-- Others
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	}
}
