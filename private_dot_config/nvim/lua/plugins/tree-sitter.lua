MiniDeps.now(function()
	MiniDeps.add({
		source = "nvim-treesitter/nvim-treesitter",
		checkout = "main",
	})

	-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
	require("nvim-treesitter").install({
		"lua",
		"astro",
		"javascript",
		"jsx",
		"typescript",
		"tsx",
	})

	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local ft = args.match
			local lang = vim.treesitter.language.get_lang(ft) or ft
			local ok = pcall(vim.treesitter.language.inspect, lang)
			if ok then
				vim.treesitter.start(args.buf, lang)
			end
		end,
	})
end)
