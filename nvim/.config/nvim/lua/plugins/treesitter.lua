return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "lua",
                "python",
                "javascript",
                "typescript",
                "vimdoc",
                "vim",
                "regex",
                "sql",
                "dockerfile",
                "toml",
                "json",
                "go",
                "gitignore",
                "yaml",
                "make",
                "cmake",
                "markdown",
                "markdown_inline",
                "bash",
                "tsx",
                "css",
                "html",
            },
            auto_install = true,
            sync_install = false,

            highlight = { enable = true },
            indent = { enable = true },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = false,
                    node_decremental = "<BS>",
                },
            },
        },
    },
}
