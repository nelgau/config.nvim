local opt = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true
opt.guicursor = ""
opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.hlsearch = false
opt.incsearch = false

-- Keep the diagnostics gutter open to prevent popping.
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.scrolloff = 8
opt.wrap = false

opt.updatetime = 50

g.mapleader = " "

opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
