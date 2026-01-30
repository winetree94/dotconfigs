MiniDeps.add({
  source = 'https://github.com/neovim/nvim-lspconfig'
})

vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'biome'
})
