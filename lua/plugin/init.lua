local lib = require('lib')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------
-- plugin list --
-----------------
local plugins = {}
local plugin_path = lib.current_file_dir()
-- strip self to prevent loop require
for _, module in ipairs(lib.modules_from_dir(plugin_path .. 'install/')) do
  table.insert(plugins, require(module))
end

local opts = {
  defaults = { lazy = true },
  performance = {
    -- disable some builtin plugins to improve performance
    -- copy from https://github.com/NvChad/NvChad/blob/f17e83010f25784b58dea175c6480b3a8225a3e9/lua/plugins/configs/lazy_nvim.lua#L14-L44
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
      },
    },
  },
}
lib.prequire('lazy').setup(plugins, opts)


-- require plugin config
for _, config in ipairs(lib.modules_from_dir(plugin_path .. 'config/')) do
  require(config)
end
