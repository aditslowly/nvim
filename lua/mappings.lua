require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map("n", ";", ":", { desc = "CMD enter command mode" }, opts)
map("i", "jk", "<ESC>", opts)

map('v', '<D-c>', '"+y', opts)
map('n', '<D-c>', 'yy', opts)

-- Paste from clipboard
map('n', '<D-v>', '"+p', opts)
map('i', '<D-v>', '<C-r>+', opts)

-- Cut to cliboard
map('v', '<D-x>', '"+d', opts)
map('n', '<D-x>', 'dd', opts)

-- Select all
map('n', '<D-a>', 'ggVG', opts)
map('i', '<D-a>', '<Esc>ggVG', opts)

-- Delete all
map('v', '<D-BS>', 'ggVGd', opts)

-- Undo and redo typing
map('n', '<D-z>', 'u', opts)
map('n', '<D-S-z>', '<C-r>', opts)
