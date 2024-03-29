return {
  -- cmp
  {
    'neovim/nvim-lspconfig',
    event = "User FilePost",
  },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      -- luasnip
      {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
      },

      {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
      }
    },
  },
}
