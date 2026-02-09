local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add('folke/tokyonight.nvim')
  ---@diagnostic disable-next-line: missing-fields
  require('tokyonight').setup({
    style = 'night', -- storm, moon, night, day
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
    },
  })
  vim.cmd.colorscheme('tokyonight')
end)
