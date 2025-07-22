local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<D-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-a>", opts)

-- New Tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>")
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Close buffer
keymap.set("n", "q", ":bd<CR>", opts, { desc = "Clode buffers" })
keymap.set("n", "qq", ":q<CR>", opts)

-- Toggle Command on lazy
keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostics.goto_next()
end)
