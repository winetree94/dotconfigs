local add, now = MiniDeps.add, MiniDeps.now

-- Immediate load (UI related)
now(function()
	-- basic
	add({ source = "nvim-mini/mini.basics", checkout = "stable" })
	require("mini.basics").setup()

	-- cmdline
	add({ source = "nvim-mini/mini.cmdline", checkout = "stable" })
	require("mini.cmdline").setup()

	-- starter
	add({ source = "nvim-mini/mini.starter", checkout = "stable" })
	require("mini.starter").setup()

	-- Icons
	add({ source = "nvim-mini/mini.icons", checkout = "stable" })
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()

	-- Statusline
	add({ source = "nvim-mini/mini.statusline", checkout = "stable" })
	require("mini.statusline").setup({
		use_icons = true,
	})

	-- Tabline
	add({ source = "nvim-mini/mini.tabline", checkout = "stable" })
	require("mini.tabline").setup()

	-- Notifications
	add({ source = "nvim-mini/mini.notify", checkout = "stable" })
	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()
end)
