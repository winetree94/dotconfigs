-- Fuzzy Finder
MiniDeps.later(function()
  MiniDeps.add('nvim-mini/mini.pick')
  require('mini.pick').setup()

  MiniDeps.add('nvim-mini/mini.extra')
  require('mini.extra').setup()

  -- Leader based keymaps
  vim.keymap.set('n', '<Leader>ff', MiniPick.builtin.files, { desc = 'Find files' })
  vim.keymap.set('n', '<Leader>fg', MiniPick.builtin.grep_live, { desc = 'Live grep' })
  vim.keymap.set('n', '<Leader>fb', MiniPick.builtin.buffers, { desc = 'Buffers' })
  vim.keymap.set('n', '<Leader>fh', MiniPick.builtin.help, { desc = 'Help' })
  vim.keymap.set('n', '<Leader>fr', MiniExtra.pickers.oldfiles, { desc = 'Recent files' })
  vim.keymap.set('n', '<Leader>fd', MiniExtra.pickers.diagnostic, { desc = 'Diagnostics' })
end)
