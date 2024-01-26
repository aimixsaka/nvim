local lib = {}

-- body
lib.nvim_lua_dir = vim.fn.stdpath('config') .. '/lua/'

function lib.script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end
-- body end

return lib
