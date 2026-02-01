local add = MiniDeps.add

add({
  source = 'nvim-neo-tree/neo-tree.nvim',
  checkout = 'v3.x',
  depends = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  }
})

-- Neo-tree keybinding
vim.keymap.set('n', '<Leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'File explorer' })

