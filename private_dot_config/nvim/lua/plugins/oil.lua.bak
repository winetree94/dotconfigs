MiniDeps.now(function()
	MiniDeps.add({
		source = "stevearc/oil.nvim",
	})

	require("oil").setup({
		columns = {
			"icon",
			"size",
			"permissions",
			"ctime",
		},
		view_options = {
			show_hidden = true,
		},
		watch_for_changes = true,
	})

	vim.keymap.set("n", "<Leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end)
