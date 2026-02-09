-- File explorer
MiniDeps.later(function()
  MiniDeps.add('nvim-mini/mini.files')
  require('mini.files').setup({
    windows = {
      preview = true,
      width_preview = 40,
    },
  })
  -- Open file explorer with Leader-m (mini.files)
  vim.keymap.set('n', '<Leader>e', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'File explorer (mini.files)' })
end)
