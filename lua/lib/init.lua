local lib = {}

-- body
lib.nvim_lua_dir = vim.fn.stdpath('config') .. '/lua/'

function lib.script_path()
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

-- tb2 overrides tb1
function lib.merge_table(tb1, tb2)
  for k, v in pairs(tb2) do
    tb1[k] = v
  end
  return tb1
end

function lib.merge_list(lst1, lst2)
  for _, elem in ipairs(lst2) do
    table.insert(lst1, elem)
  end
  return lst1
end
-- body end

return lib
