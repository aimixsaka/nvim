local lib = {}

-- body
lib.nvim_lua_dir = vim.fn.stdpath('config') .. '/lua/'

function lib.current_file_dir()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

function lib.prequire(module)
  local ok, m = pcall(require, module)
  if not ok then
    error('Cannot load module [' .. module .. ']')
  end
  return m
end

function lib.merge_list(lst1, lst2)
  for _, elem in ipairs(lst2) do
    table.insert(lst1, elem)
  end
  return lst1
end

function lib.files_from_dir(dir)
  return io.popen('find ' .. dir .. ' -mindepth 1 -maxdepth 1 -type f'):lines()
end

function lib.modules_from_dir(dir)
  local modules = {}
  for file in lib.files_from_dir(dir) do
    -- `gsub` see https://www.lua.org/pil/20.2.html
    local module = file:gsub('%.lua', ''):match(lib.nvim_lua_dir .. '(.*)')
    table.insert(modules, module)
  end
  return modules
end
-- body end

return lib
