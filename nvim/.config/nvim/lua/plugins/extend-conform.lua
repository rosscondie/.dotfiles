return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters = opts.formatters or {}

    -- =========================
    -- JavaScript / TypeScript
    -- =========================
    opts.formatters_by_ft.javascript = { "prettierd" }
    opts.formatters_by_ft.javascriptreact = { "prettierd" }
    opts.formatters_by_ft.typescript = { "prettierd" }
    opts.formatters_by_ft.typescriptreact = { "prettierd" }
    opts.formatters_by_ft.json = { "prettierd" }
    opts.formatters_by_ft.html = { "prettierd" }
    opts.formatters_by_ft.css = { "prettierd" }
    opts.formatters_by_ft.markdown = { "prettierd" }
    opts.formatters_by_ft.yaml = { "prettierd" }

    -- =========================
    -- Go
    -- =========================
    opts.formatters_by_ft.go = { "goimports" }

    -- =========================
    -- Lua
    -- =========================
    opts.formatters_by_ft.lua = { "stylua" }

    -- =========================
    -- Shell (bash/sh)
    -- =========================
    opts.formatters_by_ft.sh = { "shfmt" }
    opts.formatters_by_ft.bash = { "shfmt" }

    -- =========================
    -- Terraform / HCL
    -- =========================
    opts.formatters_by_ft.terraform = { "terraform_fmt" }
    opts.formatters_by_ft.hcl = { "terraform_fmt" }

    -- =========================
    -- KDL
    -- =========================
    opts.formatters_by_ft.kdl = { "kdlfmt" }

    return opts
  end,
}
