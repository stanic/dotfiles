-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Other configs
vim.opt.vb = true
vim.opt.colorcolumn = '80'

-- Load configs
require("config.lazy")
require("nsa")

require('telescope').load_extension('fzf')

vim.opt.filetype.plugin = true
