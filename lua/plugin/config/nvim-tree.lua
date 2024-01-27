local lib = require('lib')

local function nvim_tree_attach(bufnr)
  local api = lib.prequire('nvim-tree.api')

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  local map = vim.keymap.set
  map('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  map('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

lib.prequire("nvim-tree").setup({
  on_attach = nvim_tree_attach,
})

-- toggle nvim tree
vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeToggle<CR>', { silent = true, noremap = true, })
