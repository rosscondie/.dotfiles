return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#82aaff" }) -- blue
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#89ddff" }) -- cyan
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#c099ff" }) -- purple
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#ff966c" }) -- orange
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#82aaff" }) -- blue
  end,
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
        },
        grep = {
          hidden = true,
          ignored = true,
        },
      },
    },
    terminal = {
      win = {
        position = "bottom",
        height = 0.25,
      },
    },
    dashboard = {
      width = 65,
      sections = {
        {
          text = {
            [[▀▀▀    ▀▀▀ ▀▀▀▀▀▀▀▀▀     ▀▀▀▀    ▀▀▀    ▀▀▀ ▀▀▀▀▀▀▀▀▀▀  ▀▀▀  ▀▀▀]],
            hl = "NeovimDashboardLogo1",
          },
          align = "center",
        }, ---@diagnostic disable-line
        {
          text = {
            [[▀▀▀▀▀  ▀▀▀ ▀▀▀    ▀▀▀  ▀▀▀  ▀▀▀   ▀▀▀  ▀▀▀      ▀▀▀    ▀▀▀ ▀▀ ▀▀▀]],
            hl = "NeovimDashboardLogo2",
          },
          align = "center",
        }, ---@diagnostic disable-line
        {
          text = {
            [[▀▀▀▀▀▀▀▀▀▀ ▀▀▀▀▀      ▀▀▀    ▀▀▀   ▀▀▀▀▀▀       ▀▀▀    ▀▀▀ ▀▀ ▀▀▀]],
            hl = "NeovimDashboardLogo3",
          },
          align = "center",
        }, ---@diagnostic disable-line
        {
          text = {
            [[▀▀▀  ▀▀▀▀▀ ▀▀▀    ▀▀▀  ▀▀▀  ▀▀▀     ▀▀▀▀        ▀▀▀    ▀▀▀ ▀▀ ▀▀▀]],
            hl = "NeovimDashboardLogo4",
          },
          align = "center",
        }, ---@diagnostic disable-line
        {
          text = {
            [[▀▀▀    ▀▀▀ ▀▀▀▀▀▀▀▀▀     ▀▀▀▀        ▀▀     ▀▀▀▀▀▀▀▀▀▀ ▀▀▀    ▀▀▀]],
            hl = "NeovimDashboardLogo5",
          },
          align = "center",
        }, ---@diagnostic disable-line
        { padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
