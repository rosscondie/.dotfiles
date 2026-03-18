return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                -- rust = { "rustfmt" },
                -- Conform will run the first available formatter
                javascript = { "prettier", "prettierd", stop_after_first = true },
                typescript = { "prettier", "prettierd", stop_after_first = true },
                typescriptreact = { "prettier", "prettierd", stop_after_first = true },
                javascriptreact = { "prettier", "prettierd", stop_after_first = true },
            },
            formatters = {
                prettierd = {
                    require_cwd = true,
                },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },
}
