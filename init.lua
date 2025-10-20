-- Leader key
vim.g.mapleader = " "

-- General settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", {bg = "#111111", underline = false})
vim.api.nvim_set_hl(0, "MatchParen", {bg = "#444444", underline = false})
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Backups and undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

-- Keybindings
local map = vim.keymap.set
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
  desc = "Briefly highlight yanked text",
})

-- Auto-remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Trim trailing whitespace on save",
})

-- Simple status message
vim.notify("Welcome, now do something")
