local add, now = MiniDeps.add, MiniDeps.now

now(function()
  --------------- text editing
	add({ source = "nvim-mini/mini.pairs", checkout = "stable" })
	require("mini.pairs").setup()

  --------------- general workflow
	add({ source = "nvim-mini/mini.basics", checkout = "stable" })
	require("mini.basics").setup()

	add({ source = "nvim-mini/mini.cmdline", checkout = "stable" })
	require("mini.cmdline").setup()

  --------------- appearance
	add({ source = "nvim-mini/mini.icons", checkout = "stable" })
	require("mini.icons").setup()

	add({ source = "nvim-mini/mini.indentscope", checkout = "stable" })
	require("mini.indentscope").setup()

	add({ source = "nvim-mini/mini.notify", checkout = "stable" })
	require("mini.notify").setup()

	add({ source = "nvim-mini/mini.starter", checkout = "stable" })
	require("mini.starter").setup()

	add({ source = "nvim-mini/mini.statusline", checkout = "stable" })
	require("mini.statusline").setup()

	add({ source = "nvim-mini/mini.tabline", checkout = "stable" })
	require("mini.tabline").setup()

	add({ source = "nvim-mini/mini.trailspace", checkout = "stable" })
	require("mini.trailspace").setup()
end)
