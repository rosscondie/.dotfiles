return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local lolcrab = vim.fn.executable("lolcrab") == 1
        local logo_path = vim.fn.stdpath("config") .. "/lua/assets/dashboard.txt"

        require("dashboard").setup({
            theme = "doom",
            preview = lolcrab and {
                -- lolcrab has different gradients built in
                -- lolcrab -g cool for example
                -- you can check the presets out with lolcrab --presets
                command = "lolcrab -g warm",
                file_path = logo_path,
                file_width = 69,
                file_height = 8,
            },
            config = {
                header = (not lolcrab) and vim.fn.readfile(logo_path) or nil,
                center = {
                    {
                        icon = " ",
                        desc = "Recent Files",
                        key = "o",
                        action = function()
                            require("fzf-lua").oldfiles()
                        end,
                    },
                    {
                        icon = " ",
                        desc = "Find Files",
                        key = "f",
                        action = function()
                            require("fzf-lua").files()
                        end,
                    },
                    {
                        icon = " ",
                        desc = "Dotfiles",
                        key = "d",
                        action = function()
                            require("fzf-lua").files({ cwd = vim.fn.expand("~/.dotfiles") })
                        end,
                    },
                    {
                        icon = "󰒲 ",
                        desc = "Plugin Manager",
                        key = "l",
                        action = "Lazy",
                    },
                    {
                        icon = "󰿅 ",
                        desc = "Quit Neovim",
                        key = "q",
                        action = "qa",
                    },
                },
                footer = {},
            },
        })
    end,
}
