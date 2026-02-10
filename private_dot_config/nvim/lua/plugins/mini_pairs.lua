MiniDeps.later(function()
	MiniDeps.add({
		source = "nvim-mini/mini.pairs",
		checkout = "stable",
	})

	require("mini.pairs").setup()
end)
