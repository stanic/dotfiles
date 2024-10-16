local nmap = function(keys, func, desc)
	vim.keymap.set('n', keys, func, { buffer = buf, desc = desc })
end

local wk = require("which-key")
wk.add({
	{ "<leader>p", group = "Project" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>lg", group = "Goto" },
	{ "<leader>o", group = "Org" },
	{ "<leader>c", group = "NerdCommenter" },

})

local builtin = require('telescope.builtin')

-- Project Navigation
nmap('<leader>pv', vim.cmd.Ex, '[P]roject [V]iew')
nmap('<leader>pf', builtin.find_files, 'Telescope [P]roject [F]ind')
nmap('<leader>pg', builtin.git_files, 'Telescope [P]roject [G]it Files')
nmap(
	'<leader>ps',
	function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end,
	'Grep [P]roject [S]earch'
)


-- LSP
nmap('<leader>lrn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')
nmap('<leader>lgd', builtin.lsp_definitions, '[G]oto [D]efinition')
nmap('<leader>lgr', builtin.lsp_references, '[G]oto [R]eferences')
nmap('<leader>lgi', builtin.lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>lD', builtin.lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>lds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>lws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
nmap('<leader>lK', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<leader>l<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
-- Lesser used LSP functionality
nmap('<leader>lgD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>lf', vim.lsp.buf.format, '[F]ormat')


-- Org Mode
local org = require('telescope').extensions.orgmode
nmap('<leader>or', org.refile_heading, '[R]ef File Heading')
nmap('<leader>ofh', org.search_headings, '[F]ile Search [H]eading')
nmap('<leader>oli', org.insert_link, '[L]ink [I]nsert')
