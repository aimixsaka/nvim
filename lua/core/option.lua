------------------------------
--------- global var ---------
------------------------------
local g = vim.g
-- leader key
g.mapleader = " "

------------------------------
--------- options  -----------
------------------------------
local opt = vim.opt

-- relativenumber
opt.relativenumber = true
opt.number = true

-- persist undo
opt.undofile = true

-- smartcase(must use with ignorecase)
opt.ignorecase = true
opt.smartcase = true

-- add this config as runtime path and packpath
opt.rtp:append("~/.config/nvim_small")
opt.packpath:append("~/.config/nvim_small")

opt.scroll = 10

