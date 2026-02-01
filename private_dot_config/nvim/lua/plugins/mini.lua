local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Immediate load (UI related)
now(function()
  -- Icons
  add('nvim-mini/mini.icons')
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()

  -- Statusline
  add('nvim-mini/mini.statusline')
  require('mini.statusline').setup({
    use_icons = true,
  })

  -- Tabline
  add('nvim-mini/mini.tabline')
  require('mini.tabline').setup()

  -- Notifications
  add('nvim-mini/mini.notify')
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)

-- File explorer
later(function()
  add('nvim-mini/mini.files')
  require('mini.files').setup({
    windows = {
      preview = true,
      width_preview = 40,
    },
  })
  -- Open file explorer with Leader-m (mini.files)
  vim.keymap.set('n', '<Leader>m', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'File explorer (mini.files)' })
end)

-- Fuzzy Finder
later(function()
  add('nvim-mini/mini.pick')
  require('mini.pick').setup()

  add('nvim-mini/mini.extra')
  require('mini.extra').setup()

  -- Leader based keymaps
  vim.keymap.set('n', '<Leader>ff', MiniPick.builtin.files, { desc = 'Find files' })
  vim.keymap.set('n', '<Leader>fg', MiniPick.builtin.grep_live, { desc = 'Live grep' })
  vim.keymap.set('n', '<Leader>fb', MiniPick.builtin.buffers, { desc = 'Buffers' })
  vim.keymap.set('n', '<Leader>fh', MiniPick.builtin.help, { desc = 'Help' })
  vim.keymap.set('n', '<Leader>fr', MiniExtra.pickers.oldfiles, { desc = 'Recent files' })
  vim.keymap.set('n', '<Leader>fd', MiniExtra.pickers.diagnostic, { desc = 'Diagnostics' })
end)

-- Clue (key hints)
later(function()
  add('echasnovski/mini.clue')

  local miniclue = require('mini.clue')
  miniclue.setup({
    triggers = {
      -- Leader
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },
      { mode = 'n', keys = "'" },
      { mode = 'x', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = '`' },
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window
      { mode = 'n', keys = '<C-w>' },

      -- z
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },

      -- Brackets
      { mode = 'n', keys = '[' },
      { mode = 'n', keys = ']' },
    },

    clues = {
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),

      -- Leader group descriptions
      { mode = 'n', keys = '<Leader>f', desc = '+find' },
      { mode = 'n', keys = '<Leader>g', desc = '+git' },
    },

    window = {
      delay = 100,
      config = {
        width = 'auto',
        border = 'rounded',
      },
    },
  })
end)
