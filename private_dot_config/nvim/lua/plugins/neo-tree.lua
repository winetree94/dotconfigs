MiniDeps.now(function()
  MiniDeps.add({
    source = "nvim-neo-tree/neo-tree.nvim",
    checkout = "v3.x",
    depends = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  })

  require("neo-tree").setup({})
  vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
  vim.keymap.set("n", "<leader>nr", ":Neotree reveal<CR>", { desc = "Reveal buffer" })
  vim.keymap.set("n", "<leader>nb", ":Neotree toggle show buffers right<CR>", { desc = "Toggle buffers panel" })
  -- vim.keymap.set("n", "<leader>ns", ":Neotree float git_status<CR>", { desc = "Float git status" })
end)
