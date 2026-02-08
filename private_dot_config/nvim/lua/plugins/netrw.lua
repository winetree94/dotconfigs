-- netrw configuration (built-in file explorer)
vim.g.netrw_banner = 0 -- Hide the info banner
vim.g.netrw_liststyle = 3 -- Tree-style listing
vim.g.netrw_browse_split = 0 -- Open files in the same window
vim.g.netrw_winsize = 25 -- Sidebar width (25% of screen)

-- Toggle netrw sidebar (similar to neo-tree toggle)
vim.keymap.set('n', '<Leader>e', '<Cmd>Lexplore<CR>', { desc = 'File explorer (netrw)' })
