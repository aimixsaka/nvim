local lib = require('lib')
local cmp = lib.prequire('cmp')

-------------------
------ cmp -----
-------------------
cmp.setup({
  snippet = {
    expand = function(args)
      lib.prequire('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
    {
      { name = 'buffer' },
      { name = 'path' },
      -- { name = 'cmdline' },
    }
  ),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }, {
    { name = 'buffer' }
  })
})



-------------------
--- lspconfig ---
-------------------
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
  capabilities = capabilities,
}

local installed_servers = lib.prequire('mason-lspconfig').get_installed_servers()
local defined_servers = dofile(lib.current_file_dir() .. 'server.lua')
local servers = lib.merge_list(
  lib.merge_list(defined_servers.must, defined_servers.manually),
  installed_servers
)

for _, server in ipairs(servers) do
  local ok, user_config = pcall(require, 'lsp.servers.' .. server)
  -- FIXME: a little hack here (lua will return true if require an empty file )!!
  if ok and user_config ~= true then
    lsp_config = vim.tbl_deep_extend('force', lsp_config, user_config)
  end
  require('lspconfig')[server].setup(lsp_config)
end

-- Setup keymap
require('lsp.keymap')
