-- Yank entire file contents to clipboard
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank entire file" })

-- Open parent directory of current file
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Copy full path of current buffer
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy file path" })
