local add, now = MiniDeps.add, MiniDeps.now

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

