-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Theme
vim.g.airline_theme = "base16"

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Other configs
vim.opt.vb = true
vim.opt.colorcolumn = '80'

-- Load configs
require("config.lazy")
require("nsa")
