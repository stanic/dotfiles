return {
	{ 'williamboman/mason.nvim', config = true },
	{ 'williamboman/mason-lspconfig.nvim' },
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = {
					"lua_ls",
					"pylsp",
					"rust_analyzer",
					"jdtls"
				}
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
			require('lspconfig')['lua_ls'].setup {
				capabilities = capabilities,
				filetypes = { "lua" },
			}
			require('lspconfig')['pylsp'].setup({
				settings = {
					pylsp = {
						plugins = {
							-- formatter options
							black = { enabled = false },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							-- linter options
							mccabe = { enabled = false },
							pylint = { enabled = false },
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							-- type checker
							pylsp_mypy = { enabled = true },
							-- auto-completion options
							jedi_completion = { fuzzy = false },
							-- import sorting
							pylsp_isort = { enabled = false },
							-- Other
							ruff = {
								enabled = true,
								formatEnabled = true,
								format = { "I" },
								lineLength = 79,
							},
						}
					}
				},
				on_attach = function(client, buf)
					if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = buf })
						vim.api.nvim_create_autocmd(
						"BufWritePre",
						{
							group = augroup,
							buffer = buf,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						}
						)
					end
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = buf })
					end
				end,
				capabilities = capabilities,
				filetypes = { "python" },
			})
			require('lspconfig')['rust_analyzer'].setup {
				capabilities = capabilities,
				filetypes = { "rust" },
			}
			require('lspconfig')['jdtls'].setup {
				capabilities = capabilities,
				filetypes = { "java" },
			}
		end
	},
	-- Lazydev
	{
		"folke/lazydev.nvim",
		filetypes = { "lua" }, -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			-- Snippets
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		},
		-- optional completion source for require statements and module annotations
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
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
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			expand = 1,
		},
	},
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
	{ 'scrooloose/nerdcommenter' }
}
