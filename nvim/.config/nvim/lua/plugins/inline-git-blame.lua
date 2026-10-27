return {
  "yt20chill/inline_git_blame.nvim",
  event = "BufReadPost",
  opts = {
    excluded_filetypes = { "NvimTree", "neo-tree", "TelescopePrompt", "help" },
    debounce_ms = 150,
    autocmd = true,
    you_label = "You",
  },
  keys = {
    {
      "<leader>gI",
      "<cmd>lua require('inline_git_blame').toggle_blame_current_line()<CR>",
      desc = "Toggle inline git blame",
    },
  },
}
