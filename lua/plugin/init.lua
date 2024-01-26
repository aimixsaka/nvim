local ok, lib = pcall(require, 'lib')
if not ok then
  error('Cannot load module [lib]')
end

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
for file in io.popen('find ' .. plugin_path .. ' -type f | grep -v plugin/init.lua'):lines() do
  -- `gsub` see https://www.lua.org/pil/20.2.html
  local module = file:gsub('%.lua', ''):match(lib.nvim_lua_dir .. '(.*)')
  for _, plugin in pairs(require(module)) do
    table.insert(plugins, plugin)
  end
end

local opts = {
}
require('lazy').setup(plugins, opts)
