local ok, lib = pcall(require, 'lib')
if not ok then
  error('Cannot load module [lib]')
end

lib.prequire("mason").setup()
lib.prequire("mason-lspconfig").setup({
  ensure_installed = lib.prequire('lsp.server').must,
})
