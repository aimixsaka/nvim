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

local plugins = {}
local plugin_path = lib.script_path()
-- strip self to prevent loop require
for _, module in ipairs(lib.modules_from_dir(plugin_path .. 'install/')) do
  -- `gsub` see https://www.lua.org/pil/20.2.html
  for _, plugin in ipairs(require(module)) do
    table.insert(plugins, plugin)
  end
end

local opts = {
}
lib.prequire('lazy').setup(plugins, opts)


-- require plugin config
for _, config in ipairs(lib.modules_from_dir(plugin_path .. 'config/')) do
  require(config)
end
