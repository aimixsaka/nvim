return {
  -- language servers that will be installed by mason automatically
  must = {
    'lua_ls',
    'gopls',
    'clangd',
    'pyright',
    'jdtls',
  },

  -- language servers that cannot be installed by mason
  -- (may use something like nix to manually install)
  manually = {
    --'java_language_server',
    'dartls',
  }
}
