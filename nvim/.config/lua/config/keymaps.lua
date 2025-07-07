vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "[Y]ank entire file" }, { noremap = true, silent = true })

vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostic in float" })

vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({
        lsp_format = "fallback",
    })
end, { desc = "Format current file" })
