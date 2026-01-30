-- Base options configuration (preserve default keymaps)

local opt = vim.opt

-- Tab/Indent
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false  -- statusline shows mode instead

-- Editing
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true

-- File
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Clipboard (sync with system clipboard)
opt.clipboard = "unnamedplus"

-- Leader key configuration
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps (preserve defaults, only add Leader based)
vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<Leader>q', '<Cmd>q<CR>', { desc = 'Quit' })

-- Diagnostic keymaps
vim.keymap.set('n', '<Leader>dd', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Clear search highlight with Escape
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

