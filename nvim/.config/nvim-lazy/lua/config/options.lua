-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = ""

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- color 80 char column
vim.opt.colorcolumn = "80"
-- Set termguicolors
vim.opt.termguicolors = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- -- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'nosplit'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Highlight as you type
vim.opt.incsearch = true

-- [[ Whitespace ]]
vim.opt.expandtab = true -- bool: Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- num:  Size of an indent
vim.opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
vim.opt.tabstop = 4 -- num:  Number of spaces tabs count for

vim.opt.spell = false

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- lazyvim overrides

-- LazyVim auto format
vim.g.autoformat = false

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

local opt = vim.opt

opt.completeopt = "menu,menuone,noselect"
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.wrap = true -- Disable line wrap
