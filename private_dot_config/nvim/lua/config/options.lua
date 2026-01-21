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
vim.g.mapleader = " "
vim.g.maplocalleader = " "
