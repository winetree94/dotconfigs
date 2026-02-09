-- Clue (key hints)
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
      { mode = 'n', keys = '<Leader>h', desc = '+gitsign' },
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
