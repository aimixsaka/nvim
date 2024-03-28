local lib = require('lib')

lib.prequire("mason").setup()


lib.prequire("mason-lspconfig").setup({
  -- not using `require` here to prevent module cache
  ensure_installed = dofile(lib.current_file_dir() .. 'server.lua').must
})
