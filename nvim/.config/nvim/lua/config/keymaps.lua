-- Open parent directory of current file
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Yank entire file contents to clipboard
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "[Y]ank entire file" }, { noremap = true, silent = true })

-- Show current diagnostic in a float
vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostic in float" })

-- Format current file
vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({
        lsp_format = "fallback",
    })
end, { desc = "Format current file" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
