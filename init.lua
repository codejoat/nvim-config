-- nvim-config file

-- Leader key
vim.g.mapleader = " "

-- General settings
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.cmd("colorscheme quiet")      -- monochrome dark or light
-- vim.cmd("colorscheme peachpuff")  -- just kinda nice
-- vim.cmd("colorscheme lunaperche") -- higher contrast dark
vim.cmd("colorscheme slate")         -- lower contrast dark
-- vim.cmd("colorscheme elflord")    -- bright neon

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
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
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")
vim.keymap.set("n", "g*", "g*zzzv")
vim.keymap.set("n", "g#", "g#zzzv")

-- Background toggle
map("n", "<leader>bd", function()
  vim.o.background = "dark"
end, { desc = "Background dark" })

map("n", "<leader>bl", function()
  vim.o.background = "light"
end, { desc = "Background light" })

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
vim.notify("neovim")
