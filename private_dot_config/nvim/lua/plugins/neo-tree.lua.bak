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

	require("neo-tree").setup({
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      }
    }
	})

	vim.keymap.set("n", "<leader>fn", ':Neotree toggle<CR>', { desc = "Toggle Neotree" })
end)
