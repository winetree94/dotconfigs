-- Fuzzy Finder
MiniDeps.later(function()
  MiniDeps.add('nvim-mini/mini.pick')
  require('mini.pick').setup()

  MiniDeps.add('nvim-mini/mini.extra')
  require('mini.extra').setup()

  -- Leader based keymaps
  vim.keymap.set('n', '<Leader>pf', MiniPick.builtin.files, { desc = 'Find files' })
  vim.keymap.set('n', '<Leader>pg', MiniPick.builtin.grep_live, { desc = 'Live grep' })
  vim.keymap.set('n', '<Leader>pb', MiniPick.builtin.buffers, { desc = 'Buffers' })
  vim.keymap.set('n', '<Leader>ph', MiniPick.builtin.help, { desc = 'Help' })
  vim.keymap.set('n', '<Leader>pr', MiniExtra.pickers.oldfiles, { desc = 'Recent files' })
  vim.keymap.set('n', '<Leader>pd', MiniExtra.pickers.diagnostic, { desc = 'Diagnostics' })
end)
