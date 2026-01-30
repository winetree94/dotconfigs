-- mini.nvim module configuration
-- Preserve default keymaps, Leader key based custom keymaps

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Buffer remove keymap (needs to be after mini.bufremove loads)
later(function()
  vim.keymap.set('n', '<Leader>bd', function() MiniBufremove.delete() end, { desc = 'Delete buffer' })
end)

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

-- Lazy load (editing features)
later(function()
  -- Auto pairs
  add('nvim-mini/mini.pairs')
  require('mini.pairs').setup()

  -- Comment toggle (toggle with gc)
  add('nvim-mini/mini.comment')
  require('mini.comment').setup()

  -- Text surround (sa, sd, sr)
  add('nvim-mini/mini.surround')
  require('mini.surround').setup({
    -- Default keymaps: sa (add), sd (delete), sr (replace)
    -- No conflict with defaults
  })

  -- Extended text objects
  add('nvim-mini/mini.ai')
  require('mini.ai').setup({
    -- Default a/i extension, compatible with defaults
  })

  -- Indent scope indicator
  add('nvim-mini/mini.indentscope')
  require('mini.indentscope').setup({
    symbol = '│',
  })

  -- Trailing whitespace indicator
  add('nvim-mini/mini.trailspace')
  require('mini.trailspace').setup()

  -- Cursor word highlight
  add('nvim-mini/mini.cursorword')
  require('mini.cursorword').setup()

  -- Buffer removal
  add('nvim-mini/mini.bufremove')
  require('mini.bufremove').setup()
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
  -- Open file explorer with Leader-e
  vim.keymap.set('n', '<Leader>e', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'File explorer' })
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

-- Auto completion
later(function()
  add('nvim-mini/mini.completion')
  require('mini.completion').setup({
    lsp_completion = {
      source_func = 'omnifunc',
      auto_setup = true,
    },
    window = {
      info = { border = 'rounded' },
      signature = { border = 'rounded' },
    },
  })

  -- Navigate completion menu with Tab/S-Tab (default C-n/C-p also preserved)
  local keys = {
    ['tab'] = vim.api.nvim_replace_termcodes('<Tab>', true, true, true),
    ['ctrl-y'] = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
    ['ctrl-n'] = vim.api.nvim_replace_termcodes('<C-n>', true, true, true),
  }

  vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() ~= 0 then
      return keys['ctrl-n']
    else
      return keys['tab']
    end
  end, { expr = true })
end)

-- Git signs
later(function()
  add('nvim-mini/mini.diff')
  require('mini.diff').setup({
    view = {
      style = 'sign',
    },
  })

  add('nvim-mini/mini-git')
  require('mini.git').setup()
end)

-- Session management
later(function()
  add('nvim-mini/mini.sessions')
  require('mini.sessions').setup({
    autoread = false,
    autowrite = true,
  })
end)

-- Jump features
later(function()
  add('nvim-mini/mini.jump')
  require('mini.jump').setup()

  add('nvim-mini/mini.jump2d')
  require('mini.jump2d').setup({
    mappings = {
      start_jumping = '<Leader>j',  -- 2D jump with Leader-j
    },
  })
end)

-- Hipatterns (highlight TODO, FIXME, etc.)
later(function()
  add('nvim-mini/mini.hipatterns')
  local hipatterns = require('mini.hipatterns')
  hipatterns.setup({
    highlighters = {
      fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
      hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack' },
      todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo' },
      note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote' },
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
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
