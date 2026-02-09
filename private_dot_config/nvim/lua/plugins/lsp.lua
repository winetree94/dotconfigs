MiniDeps.add({
  source = 'https://github.com/neovim/nvim-lspconfig'
})

vim.lsp.enable({
  'lua_ls',
  'stylua',
  'ts_ls',
  'biome',
  'eslint',
  'bashls',
  'tailwindcss',
  'astro',
  'yamlls',
  'vimls',
  'jsonls',
  'html',
  'cssls',
  'ansiblels',
  'dockerls',
  'docker_language_server',
  'docker_compose_language_service',
})
