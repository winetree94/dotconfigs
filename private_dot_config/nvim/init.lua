-- Bootstrap mini.deps
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.deps'

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing mini.deps..." | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.deps', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.deps | helptags ALL')
  vim.cmd('echo "Done!" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

-- Load base options
require('config.options')

-- Load mini.nvim plugins
require('plugins.mini')

-- mini.clue configuration (key hints)
MiniDeps.later(function()
  MiniDeps.add('echasnovski/mini.clue')

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
      delay = 300,
      config = {
        width = 'auto',
        border = 'rounded',
      },
    },
  })
end)

-- Additional keymaps (preserve defaults, only add Leader based)
vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<Leader>q', '<Cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<Leader>bd', function() MiniBufremove.delete() end, { desc = 'Delete buffer' })

-- Diagnostic keymaps (default style)
vim.keymap.set('n', '<Leader>dd', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Clear search highlight with Escape
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')
