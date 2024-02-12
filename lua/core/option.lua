------------------------------
--------- global var ---------
------------------------------
local g = vim.g

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

------------------------------
--------- options  -----------
------------------------------
local opt = vim.opt

-- relativenumber
opt.relativenumber = true
opt.number = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- indent

-- persist undo
opt.undofile = true

-- smartcase(must use with ignorecase)
opt.ignorecase = true
opt.smartcase = true

-- add this config as runtime path and packpath
-- opt.rtp:append("~/.config/nvim_small")
-- opt.packpath:append("~/.config/nvim_small")

opt.scroll = 10

-- enable 24-bit colour
opt.termguicolors = true
