local add, later = MiniDeps.add, MiniDeps.later

add({
	source = "folke/ts-comments.nvim",
})

later(function()
	require("ts-comments").setup()
end)
