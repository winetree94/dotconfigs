-- File explorer
MiniDeps.later(function()
  MiniDeps.add('nvim-mini/mini.files')
  require('mini.files').setup({
    windows = {
      preview = true,
      width_preview = 40,
    },
  })
  vim.keymap.set('n', '<Leader>fr', function()
    MiniFiles.open()
  end, { desc = 'File explorer (Root)' })
  vim.keymap.set('n', '<Leader>fc', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'File explorer (Current)' })
end)
